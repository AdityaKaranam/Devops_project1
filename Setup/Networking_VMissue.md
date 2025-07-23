# What You Learned Today: UTM & RHEL Networking

## Topics You Learned

### **1. UTM Virtualization Platform**
- UTM network modes and their differences from other hypervisors
- How to configure VM network settings in UTM interface
- Understanding UTM's limitation compared to VMware/VirtualBox

### **2. Linux Network Interface Management**
- Using `ip` command suite for network diagnosis
- Understanding network interface states and configurations
- Reading and interpreting network interface output

### **3. NetworkManager (nmcli) Administration**
- Creating, modifying, and deleting network connections
- Understanding connection profiles vs active interfaces
- Switching between DHCP and static IP configurations

### **4. Network Routing Concepts**
- Understanding default routes and routing tables
- How gateway configuration affects internet connectivity
- Troubleshooting routing issues systematically

### **5. IP Address Management**
- Difference between static and DHCP IP assignment
- Understanding IP address conflicts and their resolution
- Primary vs secondary IP addresses on same interface

### **6. SSH Server Configuration**
- Installing and configuring OpenSSH server on RHEL
- Managing SSH service with systemctl
- Understanding SSH accessibility from different network segments

### **7. Firewall Configuration**
- Using firewall-cmd for RHEL firewall management
- Opening ports for services (SSH)
- Understanding firewall impact on network services

### **8. Network Troubleshooting Methodology**
- Systematic approach to network problem diagnosis
- Using multiple diagnostic tools together
- Comparing working vs non-working configurations

### **9. DHCP vs Static IP Decision Making**
- When to choose DHCP over static configuration
- Understanding DHCP lease management
- Benefits and drawbacks of each approach

### **10. Bridged vs NAT Networking**
- Understanding how VMs can connect to networks
- When to use bridged networking for external access
- Network isolation concepts

---

## Detailed Issue Analysis & Solutions

### **Issue #1: No Host-Only Network Option in UTM**

**1. Topic:** UTM Network Mode Selection

**2. Issue Faced:** You expected to find a "Host-Only" network option in UTM (like VMware/VirtualBox) but couldn't locate it in the network settings.

**3. What I Asked & Your Response:**
- **Asked:** You to check UTM network options
- **Your Response:** "I only see Shared or bridged options I do not see host only mode in network"

**4. Analysis:** UTM's network architecture is different from traditional virtualization platforms. It only provides:
- **Shared Network (NAT)** - VM isolated but with internet
- **Bridged Network** - VM appears as separate device on network

**5. Solution Rationale:** Recommended Bridged mode because it achieves your goal (external laptop access) without needing the complexity of port forwarding that Host-Only would require.

---

### **Issue #2: "Destination Host Unreachable" Error**

**1. Topic:** Internet Connectivity Failure

**2. Issue Faced:** VM couldn't reach external internet, getting "Destination Host Unreachable" when pinging 8.8.8.8

**3. What I Asked & Your Response:**
- **Asked:** `ifconfig | grep "inet " | grep -v 127.0.0.1` and `netstat -rn | grep default` on your Mac
- **Your Response:**
```
inet 192.168.1.69 netmask 0xffffff00 broadcast 192.168.1.255
default            192.168.1.254      UGScg                 en0
```

**4. Analysis:** 
- **Key Finding:** Your Mac's gateway was `192.168.1.254`
- **Problem Identified:** When you later showed `ip route show`, your VM had `default via 192.168.1.1` 
- **Root Cause:** Gateway mismatch - VM was trying to reach a non-existent gateway (192.168.1.1)

**5. Solution Rationale:** Changed VM's gateway to match your Mac's working gateway (192.168.1.254) because that's the actual router IP on your network.

---

### **Issue #3: Dual IP Address Conflict**

**1. Topic:** Multiple IP Addresses on Single Interface

**2. Issue Faced:** VM had connectivity issues despite having an IP address

**3. What I Asked & Your Response:**
- **Asked:** `ip addr show`
- **Your Response:**
```
2: enp0s1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether f6:e5:61:ec:2f:67 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.100/24 brd 192.168.1.255 scope global noprefixroute enp0s1
       valid_lft forever preferred_lft forever
    inet 192.168.1.95/24 brd 192.168.1.255 scope global secondary dynamic noprefixroute enp0s1
       valid_lft 86273sec preferred_lft 86273sec
```

**4. Analysis:**
- **Key Finding 1:** Two `inet` lines showing different IP addresses on same interface
- **Key Finding 2:** `192.168.1.100` marked as `scope global noprefixroute` (static configuration)
- **Key Finding 3:** `192.168.1.95` marked as `scope global secondary dynamic` (DHCP lease)
- **Problem:** Operating system didn't know which IP to use as primary, causing routing confusion

**5. Solution Rationale:** 
- **Why remove .100 instead of .95:** DHCP-assigned IPs (.95) are "officially" allocated by your router's DHCP server, making conflicts less likely
- **Why .95 was better:** The `dynamic` flag indicated it was actively managed by DHCP, ensuring consistency

---

### **Issue #4: Wrong Gateway in Routing Table**

**1. Topic:** Incorrect Default Route Configuration

**2. Issue Faced:** Despite having IP addresses, VM couldn't reach internet

**3. What I Asked & Your Response:**
- **Asked:** `ip route show`
- **Your Response:**
```
default via 192.168.1.1 dev enp0s1 proto static metric 100 
192.168.1.0/24 dev enp0s1 proto kernel scope link src 192.168.1.100 metric 100 
192.168.1.0/24 dev enp0s1 proto kernel scope link src 192.168.1.95 metric 100
```

**4. Analysis:**
- **Key Finding:** `default via 192.168.1.1` - VM trying to use wrong gateway
- **Problem:** 192.168.1.1 doesn't exist on your network (your actual gateway is 192.168.1.254)
- **Evidence:** Your Mac's `netstat -rn` showed `192.168.1.254` as working gateway

**5. Solution Rationale:** 
- **Why 192.168.1.254:** Matched your Mac's working configuration
- **Why not 192.168.1.1:** This IP doesn't exist on your network (common default but not universal)

---

### **Issue #5: Multiple NetworkManager Connections**

**1. Topic:** Conflicting Network Connection Profiles

**2. Issue Faced:** Network configuration kept reverting or behaving inconsistently

**3. What I Asked & Your Response:**
- **Asked:** `nmcli con show`
- **Your Response:** (At different times you showed multiple connections like "bridged-static", "Wired connection 1", etc.)

**4. Analysis:**
- **Key Finding:** Multiple connection profiles existed simultaneously
- **Problem:** Each connection had different settings (some static, some DHCP, different gateways)
- **Conflict:** NetworkManager was applying conflicting configurations

**5. Solution Rationale:**
- **Why delete all:** Clean slate approach eliminates configuration conflicts
- **Why single DHCP connection:** Simplest, most reliable configuration that lets router manage IP assignment

---

### **Issue #6: Static vs DHCP Configuration Choice**

**1. Topic:** IP Address Assignment Method Selection

**2. Issue Faced:** Needed to choose between keeping static IP (192.168.1.100) or DHCP IP (192.168.1.95)

**3. What I Asked & Your Response:**
- **Asked:** Your preference between Option A (keep DHCP .95) or Option B (keep static .100)
- **Your Response:** "A" (chose DHCP)

**4. Analysis:**
- **Why I recommended DHCP:**
  - **Router awareness:** DHCP server knows this IP is assigned to your VM
  - **Conflict avoidance:** DHCP prevents duplicate IP assignments
  - **Maintenance:** No manual IP management needed
  - **Consistency:** Same configuration works if you change networks

**5. Solution Rationale:**
- **IP 192.168.1.95:** Kept this because it was actively managed by DHCP
- **Why not manual selection:** Your network range (192.168.1.0/24) has 254 possible IPs, but letting DHCP choose prevents conflicts with other devices

---

## **Commands You Mastered**

### **Network Diagnosis Commands**
```bash
ip addr show                    # Check interface IP addresses
ip route show                   # View routing table
ip link show                    # List network interfaces
ping -c 3 <target>             # Test connectivity
```

### **NetworkManager Commands**
```bash
nmcli con show                  # List all connections
nmcli con show --active         # Show active connections
nmcli con delete "name"         # Remove connection
nmcli con add type ethernet     # Create new connection
nmcli con mod "name" setting    # Modify connection
nmcli con up/down "name"        # Activate/deactivate
```

### **SSH Management Commands**
```bash
sudo systemctl status sshd      # Check SSH service
sudo systemctl enable sshd      # Enable auto-start
sudo systemctl start sshd       # Start SSH service
sudo netstat -tlnp | grep :22   # Check SSH listening
```

### **Firewall Commands**
```bash
sudo firewall-cmd --list-services        # List allowed services
sudo firewall-cmd --add-service=ssh      # Allow SSH
sudo firewall-cmd --permanent --reload   # Make changes permanent
```

---

## **Final Working Configuration**
- **UTM**: Bridged network mode
- **RHEL**: Single DHCP IP (192.168.1.95)
- **Gateway**: 192.168.1.254 (matching your Mac)
- **Access**: SSH from any local device
- **Connectivity**: Full internet access

## **Key Troubleshooting Lessons**
1. **Always compare working vs non-working configurations** (Mac vs VM routing)
2. **Look for multiple configurations competing** (dual IPs, multiple connections)
3. **Simple solutions often work better** (DHCP vs complex static setup)
4. **Verify each layer systematically** (IP → Gateway → Internet → DNS)
5. **Understand the difference between interface state and connection profiles**
6. **Use multiple diagnostic tools to get complete picture**