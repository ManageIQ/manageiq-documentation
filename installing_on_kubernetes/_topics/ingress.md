### Obtain host information from ingress/route

An ingress should have been deployed.  If enabling internal SSL and running in OpenShift, a route is created.

        $ oc get ingress
        NAME      HOSTS                              ADDRESS   PORTS     AGE
        httpd     my-app.apps.example.com                     80, 443   56s
        $ oc get routes
        NAME          HOST/PORT                          PATH      SERVICES   PORT      TERMINATION     WILDCARD
        httpd-qlvmj   my-app.apps.example.com           /         httpd      80        edge/Redirect   None

Examine output and point your web browser to the reported URL/HOST.
