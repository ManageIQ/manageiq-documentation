Currently, the `appliance_console_cli` feature is a subset of the full
functionality of the `appliance_console` itself, and covers functions
most likely to be scripted using the command-line interface (CLI).

1.  After starting the {{ site.data.product.title }} appliance, log in with a user
    name of `root` and the default password of `smartvm`. This displays
    the Bash prompt for the root user.

2.  Enter the `appliance_console_cli` or `appliance_console_cli --help`
    command to see a list of options available with the command, or
    simply enter `appliance_console_cli --option <argument>` directly to
    use a specific option.

|                  |                                                                                            |
| ---------------- | ------------------------------------------------------------------------------------------ |
| Option           | Description                                                                                |
| \--region (-r)   | region number (create a new region in the database - requires database credentials passed) |
| \--internal (-i) | internal database (create a database on the current appliance)                             |
| \--dbdisk        | database disk device path (for configuring an internal database)                           |
| \--hostname (-h) | database hostname                                                                          |
| \--port          | database port (defaults to `5432`)                                                         |
| \--username (-U) | database username (defaults to `root`)                                                     |
| \--password (-p) | database password                                                                          |
| \--dbname (-d)   | database name (defaults to `vmdb_production`)                                              |

Database Configuration Options

|                   |                                                            |
| ----------------- | ---------------------------------------------------------- |
| Option            | Description                                                |
| \--key (-k)       | create a new v2\_key                                       |
| \--fetch-key (-K) | fetch the v2\_key from the given host                      |
| \--force-key (-f) | create or fetch the key even if one exists                 |
| \--sshlogin       | ssh username for fetching the v2\_key (defaults to `root`) |
| \--sshpassword    | ssh password for fetching the v2\_key                      |

v2\_key Options

|                       |                                                                                                  |
| --------------------- | ------------------------------------------------------------------------------------------------ |
| Option                | Description                                                                                      |
| \--host (-H)          | set the appliance hostname to the given name                                                     |
| \--ipaserver (-e)     | IPA server FQDN                                                                                  |
| \--ipaprincipal (-n)  | IPA server principal (default: `admin`)                                                          |
| \--ipapassword (-w)   | IPA server password                                                                              |
| \--ipadomain (-o)     | IPA server domain (optional). Will be based on the appliance domain name if not specified.       |
| \--iparealm (-l)      | IPA server realm (optional). Will be based on the domain name of the ipaserver if not specified. |
| \--uninstall-ipa (-u) | uninstall IPA client                                                                             |

IPA Server Options

<div class="note">

  - In order to configure authentication through an IPA server, in
    addition to using **Configure External Authentication (httpd)** in
    the `appliance_console`, external authentication can be optionally
    configured via the `appliance_console_cli` (command-line interface).

  - Specifying **--host** will update the hostname of the appliance. If
    this step was already performed via the `appliance_console` and the
    necessary updates made to `/etc/hosts` if DNS is not properly
    configured, the **--host** option can be omitted.

</div>

|                              |                                                                                 |
| ---------------------------- | ------------------------------------------------------------------------------- |
| Option                       | Description                                                                     |
| \--ca (-c)                   | CA name used for certmonger (default: `ipa`)                                    |
| \--postgres-client-cert (-g) | install certs for postgres client                                               |
| \--postgres-server-cert      | install certs for postgres server                                               |
| \--http-cert                 | install certs for http server (to create certs/httpd\* values for a unique key) |
| \--extauth-opts (-x)         | external authentication options                                                 |

Certificate Options

<div class="note">

The certificate options augment the functionality of the `certmonger`
tool and enable creating a certificate signing request (CSR), and
specifying `certmonger` the directories to store the keys.

</div>

|                 |                                                                                     |
| --------------- | ----------------------------------------------------------------------------------- |
| Option          | Description                                                                         |
| \--logdisk (-l) | log disk path                                                                       |
| \--tmpdisk      | initialize the given device for temp storage (volume mounted at `/var/www/miq_tmp`) |
| \--verbose (-v) | print more debugging info                                                           |

Other Options

**Example Usage.**

    $ ssh root@appliance.test.company.com

To create a new database locally on the server using `/dev/sdb`:

    # appliance_console_cli --internal --dbdisk /dev/sdb --region 0 --password smartvm

To copy the v2\_key from a host *some.example.com* to local machine:

    # appliance_console_cli --fetch-key some.example.com --sshlogin root --sshpassword smartvm

You could combine the two to join a region where *db.example.com* is the
appliance hosting the database:

    # appliance_console_cli --fetch-key db.example.com --sshlogin root --sshpassword smartvm --hostname db.example.com --password mydatabasepassword

To configure external authentication:

    # appliance_console_cli --host appliance.test.company.com
                            --ipaserver ipaserver.test.company.com
                            --ipadomain test.company.com
                            --iparealm TEST.COMPANY.COM
                            --ipaprincipal admin
                            --ipapassword smartvm1

To uninstall external authentication:

    # appliance_console_cli  --uninstall-ipa
