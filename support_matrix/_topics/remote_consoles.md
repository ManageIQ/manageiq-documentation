## Remote Console Support

{{ site.data.product.title_short }} allows you to access the console of virtual machines and instances on the providers it managers using HTML5-based VNC consoles. This section outlines the status of support for remote consoles in {{ site.data.product.title_short }}.

**Note:** For VMware vSphere providers, {{ site.data.product.title_short }} supports the versions of VMRC that VMware supports. However, VMware does not support VMRC for Mac operating systems. See VMware VMRC documentation for more information.

 For all other providers, {{ site.data.product.title_short }} supports HTML5-based VNC consoles. The following have been tested with {{ site.data.product.title_short }} Engine:

- Windows: UltraVNC 1.1.8.8 - http://www.uvnc.com/
- Linux/Mac: SSVNC 1.0.29 - http://www.karlrunge.com/x11vnc/ssvnc.html. At the time of this writing, this is the only client that supports the VNC repeater configuration.

**Note:** As of 1 September 2015, new versions of Chrome no longer support VMRC consoles. VMRC requires NPAPI plug-in support. Chrome removed support for NPAPI plug-ins in version 45.0.2454, which was released on this date.

### Support on Red Hat Enterprise Linux by Providers and Browsers

The following tables outline the status of support for remote consoles on providers for Red Hat Enterprise Linux 6 and Red Hat Enterprise Linux 7. 

#### Remote Console Support on Red Hat Enterprise Linux 6

| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | No     | Yes     |
|                                  | VMRC            |         | No     | Yes     |
|                                  | WebMKS          |         | No     | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | No     | Yes     |
|                                  | WebMKS          |         | No     | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

#### Remote Console Support on Red Hat Enterprise Linux 7

| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     |
|                                  | VMRC            |         | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

### Support on Fedora by Providers and Browsers

The following tables outline the status of support for remote consoles on providers for Fedora 25, 26, and 27.

#### Remote Console Support on Fedora 25

| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     |
|                                  | VMRC            |         | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

#### Remote Console Support on Fedora 26

| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     |
|                                  | VMRC            |         | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

#### Remote Console Support on Fedora 27

| Provider                         | Connection Type | Support | Chrome | Firefox |
| -------------------------------- | --------------- | ------- | ------ | ------- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     |
|                                  | VMRC            |         | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     |
|                                  | WebMKS          |         | Yes    | Yes     |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      |

### Support on Windows by Providers and Browsers

The following tables outline the status of support for remote consoles on providers for Windows 7, 10, and 2012 Server.

#### Remote Console Support on Windows 7
| Provider                         | Connection Type | Support | Chrome | Firefox | IE 11 | IE 10 |
| -------------------------------- | --------------- | ------- | ------ | ------- | ----- | ----- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     | Yes   | No    |
|                                  | VMRC            |         | Yes    | Yes     | Yes   | No    |
|                                  | WebMKS          |         | Yes    | Yes     | Yes   | No    |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     | Yes   | No    |
|                                  | WebMKS          |         | Yes    | Yes     | Yes   | No    |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      | No    | No    |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      | No    | No    |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      | No    | No    |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      | No    | No    |
| Amazon Web Services (AWS)        | N/A             | No      | N/A    | N/A     | N/A   | N/A   |
| Microsoft SCVMM                  | N/A             | No      | N/A    | N/A     | N/A   | N/A   |

#### Remote Console Support on Windows 10

| Provider                         | Connection Type | Support | Chrome | Firefox | IE 11 | IE 10 | Edge |
| -------------------------------- | --------------- | ------- | ------ | ------- | ----- | ----- | ---- |
| VMware vSphere 6.0               | VNC             | Yes     | No     | No      | No    | No    | Yes  |
|                                  | VMRC            |         | No     | No      | No    | No    | Yes  |
|                                  | WebMKS          |         | No     | No      | No    | No    | Yes  |
| VMware vSphere 6.5               | VMRC            | Yes     | No     | No      | No    | No    | Yes  |
|                                  | WebMKS          |         | No     | No      | No    | No    | Yes  |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      | No    | No    | No   |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      | No    | No    | No   |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      | No    | No    | No   |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      | No    | No    | No   |
| Amazon Web Services (AWS)        | N/A             | No      | N/A    | N/A     | N/A   | N/A   | N/A  |
| Microsoft SCVMM                  | N/A             | No      | N/A    | N/A     | N/A   | N/A   | N/A  |

#### Remote Console Support on Windows 2012 Server

| Provider                         | Connection Type | Support | Chrome | Firefox | IE 11 | IE 10 |
| -------------------------------- | --------------- | ------- | ------ | ------- | ----- | ----- |
| VMware vSphere 6.0               | VNC             | Yes     | Yes    | Yes     | Yes   | No    |
|                                  | VMRC            |         | No     | No      | No    | No    |
|                                  | WebMKS          |         | No     | No      | No    | No    |
| VMware vSphere 6.5               | VMRC            | Yes     | Yes    | Yes     | Yes   | No    |
|                                  | WebMKS          |         | Yes    | Yes     | Yes   | No    |
| Red Hat Virtualization (RHV) 4.2 | SPICE           | Yes     | No     | No      | No    | No    |
| Red Hat Virtualization (RHV) 4.3 | SPICE           | Yes     | No     | No      | No    | No    |
| Red Hat OpenStack Platform 10    | VNC             | Yes     | No     | No      | No    | No    |
| Red Hat OpenStack Platform 13    | VNC             | Yes     | No     | No      | No    | No    |
| Amazon Web Services (AWS)        | N/A             | No      | N/A    | N/A     | N/A   | N/A   |
| Microsoft SCVMM                  | N/A             | No      | N/A    | N/A     | N/A   | N/A   |
