#### Hosts: Vmware ESX (host\_vmware\_esx)

| Method                                                  | Use                                             |
| ------------------------------------------------------- | ----------------------------------------------- |
| disable\_vmotion(device = nil)                          | Disable vMotion                                 |
| enable\_vmotion(device = nil)                           | Enable vMotion                                  |
| enter\_maintenance\_mode(timeout = 0, evacuate = false) | Put Host in Maintenance Mode                    |
| exit\_maintenance\_mode(timeout = 0)                    | Leave Maintenance Mode                          |
| in\_maintenance\_mode?                                  | Check to see if the host is in Maintenance Mode |
| power\_down\_to\_standby(timeout = 0, evacuate = false) | Put Host in standby                             |
| power\_up\_from\_standby(timeout = 0)                   | Take Host out of standby                        |
| reboot(force = false)                                   | Reboot Host                                     |
| shutdown(force = false)                                 | Shutdown Host                                   |
| vmotion\_enabled?(device = nil)                         | Check to see if vMotion is enabled              |
