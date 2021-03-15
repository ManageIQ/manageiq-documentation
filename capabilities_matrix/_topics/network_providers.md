### Network Providers

The following tables outline the capabilities of {{ site.data.product.title_short }} that are known to work for various network providers.

| Discovery         | Nuage | VMware NSX-t |
| ----------------- | ----- | ------------ |
| Cloud Tenants     | ✅     | ✅           |
| Cloud Networks    | ✅     | ✅           |
| Cloud Subnets     | ✅     | ✅           |
| Security Groups   | ✅     | ✅           |
| Security Policies | ❌     | ✅           |
| Network Services  | ❌     | ✅           |
| Floating IPs      | ✅     | ❌           |
| Network Ports     | ✅     | ✅           |
| Network Routers   | ✅     | ✅           |
| Events            | ✅     | ❌           |
| Metrics           | ❌     | ❌           |

| Operations             | Nuage | VMware NSX-t |
| ---------------------- | ----- | ------------ |
| Create Cloud Network   | ✅     | ✅           |
| Create Cloud Subnet    | ✅     | ❌           |
| Delete Cloud Subnet    | ✅     | ❌           |
| Delete Floating IP     | ✅     | ❌           |
| Create Security Group  | ❌     | ✅           |
| Delete Security Group  | ✅     | ❌           |
| Create Security Policy | ❌     | ✅           |
