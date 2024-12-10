## Providers

### VMware vCenter Provider

If you are having issues with a VMware provider you can enable extensive debug
logging which will log the raw XML payloads for all requests and responses between
the vCenter and {{ site.data.product.title_short }}.

There are two settings that you have to enable in Advanced Settings
1. log.level_vim must be set to debug
2. ems.ems_vmware.debug_vim_requests must be set to true

With these two settings enabled you will see the full XML payloads in the vim log,
here is a sample Login action:
```
[----] D, [2024-12-04T12:31:51.307304#554036:97f4] DEBUG -- vim: <?xml version='1.0' ?>
<env:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/">
  <env:Header />
  <env:Body>
    <n1:Login xmlns:n1="urn:vim25">
      <n1:_this type="SessionManager">SessionManager</n1:_this>
      <n1:userName>user</n1:userName>
      <n1:password>pass</n1:password>
    </n1:Login>
  </env:Body>
</env:Envelope>
[----] D, [2024-12-04T12:31:51.308114#554036:97f4] DEBUG -- vim: <?xml version="1.0" encoding="UTF-8"?>
<soapenv:Envelope xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns: xsi="http://www.w3.org/2001/XMLSchema-instance">
  <soapenv:Body>
    <LoginResponse xmlns="urn:vim25">
      <returnval>
        <key>53e7183f-4db3-4e02-b62d-840b9a47fc31</key>
        <userName>user</userName>
        <fullName>user</fullName>
        <loginTime>2024-12-04T17:31:51.307621525Z</loginTime>
        <lastActiveTime>2024-12-04T12:31:51.307628585-05:00</lastActiveTime>
        <locale>en_US</locale>
        <messageLocale>en_US</messageLocale>
        <extensionSession>false</extensionSession>
        <ipAddress>127.0.0.1</ipAddress>
        <userAgent>HTTPClient/1.0 (2.8.3, ruby 3.3.5 (2024-09-03))</userAgent>
        <callCount>1</callCount>
      </returnval>
    </LoginResponse>
  </soapenv:Body>
</soapenv:Envelope>

```

Depending on the payloads you are working with, they might overflow the journald `LineMax` and be cut off.
If this is the case you can edit the `/etc/systemd/journald.conf` file and adjust the `LineMax` setting appropriately.
