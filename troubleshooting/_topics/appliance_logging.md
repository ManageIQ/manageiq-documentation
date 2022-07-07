### Appliance Logging

On appliances logging is managed using the built-in systemd-journal system.  Journald uses database-like binary files to store log lines along with extensive metadata.

There is a `journalctl` command-line utility which can be used to query the journal.  Documentation for journalctl can be found at https://man7.org/linux/man-pages/man1/journalctl.1.html

If you want to tail the main `evm` logs then you can use `journalctl -f -t evm`.  Other logs (e.g.: `automation` or `api`) can be viewed by using their syslog_identifier e.g. `journalctl -f -t automation`.  You can also view multiple logs by using `journalctl -f -t evm -t automation -t api`.

`journalctl` allows you to do much more like view logs for a specific unit (aka worker), for a time range, and for a group of workers (e.g. every generic worker).

Here are some helpful examples:

View all logs: `journalctl`
View all logs, most recent first: `journalctl -r`
View all logs since the last boot: `journalctl -b`
View all logs from the previous boot: `journalctl -b -1`
View all logs from a time range: `journalctl --since "1 hour ago"`
View all logs with extra metadata: `journalctl --output verbose`

Tail all logs: `journalctl -f`
Tail all warnings: `journalctl -f -p warning`
Tail all errors: `journalctl -f -p err`
Tail all warnings and errors: `journalctl -f -p err -p warning`

Logs for a specific unit: `journalctl -f -u manageiq-generic@51113329-8942-4a4c-98d6-1e532656c569.service`
Logs for a group of workers: `journalctl -f -u manageiq-generic.slice`
Logs matching a pattern: `journalctl -g '(Started|Stopping) EVM server''` (accepts perl compatible regular expressions)
Logs for a specific identifier: `journalctl -f -t evm`

Export to a file: `journalctl --output export > export.log`
Rotate the current journal to an archive: `journalctl --rotate`
Clear out all archived journals: `journalctl --vacuum-time=1s`
Clear out journal archives over a day old: `journalctl --vacuum-time=1d`

Almost all of these can be combined together where they don't conflict (e.g. `-f` can't be used with `-r`)
