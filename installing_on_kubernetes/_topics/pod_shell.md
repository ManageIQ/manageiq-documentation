## Get a shell on the MIQ pod

On the application pods, source the `container_env` before attempting any `rails` or `rake` commands.

```bash
$ oc rsh orchestrator-78786d6b44-gcqdq
sh-4.4$ cd /var/www/miq/vmdb/
sh-4.4$ . ./container_env
```
