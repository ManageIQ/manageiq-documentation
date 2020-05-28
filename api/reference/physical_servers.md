---
---

## Physical Server Management

Management of Physical Servers is available via the following endpoint:

``` data
/api/physical_servers
```

### Querying Physical Servers

Querying all physical servers in the system is simply:

    GET /api/physical_servers

Getting details on a specific Physical Server:

    GET /api/physical_servers/:id

### Managing Physical Servers

The following actions are available on Physical Servers:

| Action                                                                | Description                   |
| --------------------------------------------------------------------- | ----------------------------- |
| [power\_on](#power-on-physical-server)                                | Power On                      |
| [power\_off](#power-off-physical-server)                              | Power Off                     |
| [power\_off\_now](#power-off-now-physical-server)                     | Power Off Now                 |
| [refresh\_now](#refresh-physical-server)                              | Refresh                       |
| [restart](#restart-physical-server)                                   | Restart                       |
| [restart\_now](#restart-now-physical-server)                          | Restart Now                   |
| [restart\_to\_sys\_setup](#restart-to-sys-setup-physical-server)      | Restart to System Setup       |
| [restart\_mgmt\_controller](#restart-mgmt-controller-physical-server) | Restart Management Controller |
| [blink\_loc\_led](#blink-loc-led-physical-server)                     | Blink the Identify LED        |
| [turn\_on\_loc\_led](#turn-on-loc-led-physical-server)                | Turn On the Identify LED      |
| [turn\_off\_loc\_led](#turn-off-loc-led-physical-server)              | Turn Off the Identify LED     |

### Powering On a Physical Server

``` json
{
  "action" : "power_on"
}
```

### Powering Off a Physical Server

``` json
{
  "action" : "power_off"
}
```

### Powering Off Now a Physical Server

``` json
{
  "action" : "power_off_now"
}
```

### Refresh a Physical Server

``` json
{
  "action" : "refresh"
}
```

### Restart a Physical Server

``` json
{
  "action" : "restart"
}
```

### Restart Now a Physical Server

``` json
{
  "action" : "restart_now"
}
```

### Restart a Physical Server to System Setup

``` json
{
  "action" : "restart_to_sys_setup"
}
```

### Restart Management Controller

``` json
{
  "action" : "restart_mgmt_controller"
}
```

### Blink the Identify LED

``` json
{
  "action" : "blink_loc_led"
}
```

### Turn On the Identify LED

``` json
{
  "action" : "turn_on_loc_led"
}
```

### Turn Off the Identify LED

``` json
{
  "action" : "turn_off_loc_led"
}
```
