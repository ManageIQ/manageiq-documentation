## Smart State Analysis Capabilities

{{ site.data.product.title_short }} allows you to analyze virtual machines and instances on the providers it manages to collect information about the base operating system on those virtual machines or instances, their virtual hardware, installed applications, and other details. This operation is known as SmartState analysis. The sections below outline what ManageIQ can parse.


### File Systems

| File System | OS Family | Known To Work |
| ------------| --------- | ------------- |
| FAT         | Windows   | Yes           |
| FAT32       | Windows   | Yes           |
| NTFS        | Windows   | Yes           |
| ReFS        | Windows   | No            |
| Ext3        | Linux     | Yes           |
| Ext4        | Linux     | Yes           |
| XFS         | Linux     | Yes           |
| ReiserFS    | Linux     | Yes           |
| CDfs        | Linux     | Yes           |

### Volume Managers

| Volume Manager                 | OS Family | Known To Work |
| -------------------------------| --------- | ------------- |
| Logical Disk Manager (LDM)     | Windows   | Yes           |
| Logical Volume Manager (Linux) | Linux     | Yes           |


### File Formats

| File Format       | OS Family | Known To Work |
| ------------------| --------- | ------------- |
| Registry          | Windows   | Yes           |
| Win32 Accounts    | Windows   | Yes           |
| Win32 Event Log   | Windows   | Yes           |
| Win32 Services    | Windows   | Yes           |
| Win32 Software    | Windows   | Yes           |
| Win32 System      | Windows   | Yes           |
| SQLite            | Linux     | Yes           |
| Berkeley DB (BDB) | Linux     | Yes           |
| Conary            | Linux     | Yes           |
| RPM               | Linux     | Yes           |
| /etc/passwd       | Linux     | Yes           |
| /etc/group        | Linux     | Yes           |
| /etc/init.d       | Linux     | Yes           |
| /etc/systemd      | Linux     | Yes           |
