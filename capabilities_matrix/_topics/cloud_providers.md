### Cloud Providers

The following tables outline the capabilities of {{ site.data.product.title_short }} that are known to work for various cloud providers.

| Discovery                      | AWS | Azure | GCP | OpenStack | PowerVC | PowerVS | IBM VPC | Oracle |
| ------------------------------ | --- | ----- | --- | --------- | ------- | ------- | ------- | ------ |
| Compute Inventory              | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅     | ✅    |
|   - Key Pairs                  | ✅  | ❌    | ✅  | ✅        | ✅      | ✅      | ✅     | ❌    |
| Network Inventory              | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅     | ✅    |
|   - Cloud Networks             | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅     | ✅    |
|   - Cloud Subnets              | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅     | ✅    |
|   - Floating IP Addresses      | ✅  | ✅    | ✅  | ✅        | N/A     | N/A     | ✅     | ❌    |
|   - Load Balancers             | ✅  | ✅    | ✅  | ❌        | N/A     | N/A     | ✅     | ❌    |
|   - Network Managers           | ❌  | ✅    | ✅  | ❌        | ❌      | ✅      | ✅     | ✅    |
|   - Network Manager Relations  | ✅  | ✅    | ✅  | ✅        | ❌      | ✅      | ✅     | ✅    |
|   - Network Ports              | ✅  | ✅    | ✅  | ✅        | ❌      | ✅      | ✅     | ✅    |
|   - Network Routers            | ❌  | ❌    | ✅  | ✅        | ❌      | ❌      | ✅     | ❌    |
|   - Security Groups            | ✅  | ✅    | ✅  | ✅        | N/A     | N/A     | N/A     | ❌    |
| Storage Inventory              | ✅  | ✅    | ✅  | ✅        | ✅      | ✅      | ✅     | ✅    |
|   - Storage Manager            | ✅  | ❌    | ❌  | ✅        | ✅      | ✅      | ✅     | ❌    |
|   - Volumes                    | ❌  | ❌    | ✅  | ✅        | ✅      | ✅      | ✅     | ✅    |
| Events                         | ✅  | ✅    | ✅  | ✅        | ✅      | ❌      | ✅     | ✅    |
| Metrics                        | ✅  | ✅    | ✅  | ✅        | ❌      | ❌      | ❌     | ✅    |
| Forensic Analysis (SmartState) | ✅  | ✅    | ❌  | ✅        | ❌      | ❌      | ❌     | ❌    |

| General Features                | AWS | Azure | GCP | OpenStack | PowerVC              | PowerVS              | IBM VPC              | Oracle |
| ------------------------------- | --- | ----- | --- | --------- | -------------------- | -------------------- | -------------------- | ------ |
| Relationship Discovery          | ✅  | ✅    | ✅  | ✅        | ✅                   | ✅                   | ✅                   | ✅     |
| Instance Drift Comparison       | ✅  | ✅    | ❌  | ✅        | ❌                   | ❌                   | ❌                   | ❌     |
| Instance Genealogy              | ✅  | ✅    | ✅  | ✅        | ✅                   | ✅                   | ✅                   | ✅     |
| Capacity & Utilization          | ✅  | ✅    | ✅  | ✅        | ❌                   | ❌                   | ❌                   | ✅     |
| Instance Event Timelines        | ✅  | ✅    | ✅  | ✅        | ✅                   | ❌                   | ✅                   | ✅     |
| Cloud Layer Timelines           | ❌  | ❌    | ❌  | ✅        | ✅                   | ❌                   | ❌                   | ❌     |
| Reporting                       | ✅  | ✅    | ✅  | ✅        | ✅                   | ✅                   | ✅                   | ✅     |
| Right Sizing                    | ✅  | ✅    | ✅  | ✅        | ✅                   | ❌                   | ❌                   | ❌     |
| Chargeback by Allocation        | ✅  | ✅    | ✅  | ✅        | ✅                   | ✅                   | ✅                   | ❌     |
| Chargeback by Usage             | ✅  | ✅    | ✅  | ✅        | ❌                   | ❌                   | ❌                   | ❌     |
| Automation Work Flows           | ✅  | ❌    | ✅  | ✅        | ✅                   | ❌                   | ❌                   | ❌     |
| Tag Mapping from Provider       | ✅  | ✅    | ❌  | ✅        | ✅                   | ❌                   | ✅                   | ❌     |
| Tag Mapping to Provider         | ❌  | ❌    | ❌  | ❌        | ❌                   | ❌                   | ❌                   | ❌     |
| Instance Policy Enforcement     | ✅  | ✅    | ✅  | ✅        | ✅                   | ✅                   | ✅                   | ✅     |
| Instance Compliance Enforcement | ✅  | ✅    | ✅  | ✅        | ❌                   | ❌                   | ❌                   | ❌     |
| Alerts - Real Time              | ❌  | ❌    | ❌  | ✅        | ❌                   | ❌                   | ❌                   | ❌     |
| Integrate with Service Catalogs | ✅  | ✅    | ✅  | ✅        | ✅                   | ✅                   | ❌                   | ✅     |

| Operations                             | AWS | Azure | GCP | OpenStack | PowerVC                          | PowerVS  | IBM VPC | Oracle       |
| -------------------------------------- | --- | ----- | --- | --------- | -------------------------------- | -------- | ------- | ------------ |
| Instance Remote Console Access         | ❌  | ❌    | ❌  | ✅ (VNC)  | ✅ (NovaLink-managed hosts only) | ❌       | ❌      | ❌           |
| Instance Power Operations              | ✅  | ✅    | ✅  | ✅        | ✅                               | ✅       | ✅      | ✅           |
| Instance Provisioning                  | ✅  | ✅    | ✅  | ✅        | ✅                               | ✅       | ✅      | ❌           |
|   - from Image to Instance             | ✅  | ✅    | ✅  | ✅        | ✅                               | ✅       | ✅      | ❌           |
|   - from Image Snapshot to Instance    | ❌  | ❌    | ❌  | ✅        | ❌                               | ❌       | ❌      | ❌           |
|   - from Volume to Instance            | ❌  | ❌    | ❌  | ✅        | ❌                               | ❌       | ❌      | ❌           |
|   - from Volume Snapshot to Instance   | ❌  | ❌    | ❌  | ✅        | ❌                               | ❌       | ❌      | ❌           |
|   - from Orchestration Template        | ✅  | ✅    | ❌  | ✅        | ❌                               | ❌       | ❌      | ❌           |
|   - Cloud-init                         | ❌  | ❌    | ❌  | ✅        | ✅                               | ✅       | ❌      | ❌           |
|   - Sysprep Windows Templates          | ❌  | ❌    | ❌  | ✅        | N/A                              | N/A      | N/A     | ❌           |
| Instance Retirement                    | ✅  | ✅    | ✅  | ✅        | ✅                               | ✅       | ❌      | ✅           |
| Instance Reconfiguration               | ❌  | ❌    | ❌  | ✅        | ✅                               | ❌       | ❌      | ❌           |
|   - Disk Addition                      | ✅  | ✅    | ❌  | ✅        | ❌                               | ✅       | ❌      | ❌           |
| Instance Migration                     | ❌  | ❌    | ❌  | ✅        | ✅                               | N/A      | N/A     | ❌           |
| Instance Snapshot Creation and Removal | ❌  | ❌    | ❌  | ✅        | ✅                               | ❌       | ❌      | ❌           |
| Key Pairs Management                   | ✅  | ❌    | ❌  | ✅        | ✅                               | ✅       | ❌      | ❌           |
| Network Manager - CRUD Actions         | ❌  | ❌    | ❌  | ❌        | ❌                               | ❌       | ❌      | ❌           |
|   - Create/Update/Delete Network       | ❌  | ❌    | ❌  | ✅        | ❌                               | ❌       | ✅      | ❌           |
|   - Create/Update/Delete Subnet        | ❌  | ❌    | ❌  | ✅        | ❌                               | ❌       | ✅      | ❌           |
|   - Create/Update/Delete Routers       | ❌  | ❌    | ❌  | ✅        | ❌                               | ❌       | ❌      | ❌           |
| Volume Creation/Deletion               | ❌  | ❌    | ❌  | ✅        | ✅                               | ✅       | ✅      | ❌           |
