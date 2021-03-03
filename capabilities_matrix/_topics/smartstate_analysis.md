## Smart State Analysis Capabilities

{{ site.data.product.title_short }} allows you to analyze virtual machines and instances on the providers it manages to collect information about the base operating system on those virtual machines or instances, their virtual hardware, installed applications, and other details. This operation is known as SmartState analysis. The sections below outline what ManageIQ can parse.


### Volume Managers

| Volume Manager                 | OS Family | Known To Work |
| -------------------------------| --------- | ------------- |
| Logical Disk Manager (LDM)     | Windows   | ✅            |
| Logical Volume Manager (Linux) | Linux     | ✅            |


### File Systems

| File System | OS Family | Known To Work |
| ------------| --------- | ------------- |
| FAT         | Windows   | ✅            |
| FAT32       | Windows   | ✅            |
| NTFS        | Windows   | ✅            |
| ReFS        | Windows   | ❌            |
| Ext3        | Linux     | ✅            |
| Ext4        | Linux     | ✅            |
| XFS         | Linux     | ✅            |
| ReiserFS    | Linux     | ✅            |
| CDfs        | Linux     | ✅            |


### File Formats

| File Format       | OS Family | Known To Work |
| ------------------| --------- | ------------- |
| Registry          | Windows   | ✅            |
| Win32 Accounts    | Windows   | ✅            |
| Win32 Event Log   | Windows   | ✅            |
| Win32 Services    | Windows   | ✅            |
| Win32 Software    | Windows   | ✅            |
| Win32 System      | Windows   | ✅            |
| SQLite            | Linux     | ✅            |
| Berkeley DB (BDB) | Linux     | ✅            |
| Conary            | Linux     | ✅            |
| RPM               | Linux     | ✅            |
| /etc/passwd       | Linux     | ✅            |
| /etc/group        | Linux     | ✅            |
| /etc/init.d       | Linux     | ✅            |
| /etc/systemd      | Linux     | ✅            |
