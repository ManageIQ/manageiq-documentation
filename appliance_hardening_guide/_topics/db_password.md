### Restricting Hosts Access to the Database

Strengthening the host-based authentication (HBA) settings on a database
appliance helps with preventing unauthorized access from external hosts.
The HBA settings restrict access to an IP address range so that only
hosts within that range have access.

Restricting access to the database requires modifications to the
`/var/lib/pgsql/data/pg_hba.conf` file. This file contains a text-based
table with some initial settings:

    # TYPE    DATABASE USER  ADDRESS       METHOD
    local     all      all                 peer map=usermap
    host      all      all   all           md5
    #hostssl  all      all   all           md5

This format for this table uses the following header columns:

  - TYPE
    This defines the access type, either local access from the database
    host (`local`), remote access from an external host regardless of
    encryption (`host`), external access with encryption (`hostssl`), or
    external access without encryption (`nohostssl`).

  - DATABASE
    The name of the database the host can access. Use `all` for all
    databases.

  - USER
    The name of the user the host can use to access the database. Use
    `all` for all users.

  - ADDRESS
    The IP address of the host or address range of hosts with access to
    the database. This can either be:

      - A single address:

            host    all      all   192.168.1.10           md5

      - An address range using a CIDR mask:

            host    all      all   192.168.1.0/24           md5

      - An address range using a separate subnet mask value

            host    all      all   192.168.1.0  255.255.255.0            md5

        **Note:**

        `ADDRESS` is not required for `local` connections.

        </div>

  - METHOD
    The authentication method, which includes:

      - `trust` - Allow the connection unconditionally. This method
        allows anyone that can connect to the PostgreSQL database server
        to login as any PostgreSQL user they wish, without the need for
        a password or any other authentication.

      - `reject` - Reject the connection unconditionally. This is useful
        for "filtering out" certain hosts from a group, for example a
        `reject` line could block a specific host from connecting, while
        a later line allows the remaining hosts in a specific network to
        connect.

      - `md5` - Require the client to supply an MD5-encrypted password
        for authentication.

      - `password` - Require the client to supply an unencrypted
        password for authentication. Since the password is sent in clear
        text over the network, this should not be used on untrusted
        networks.

      - `ident` - Obtain the operating system user name of the client by
        contacting the ident server on the client and check if it
        matches the requested database user name. Ident authentication
        can only be used on TCP/IP connections. When specified for local
        connections, peer authentication will be used instead.

      - `peer` - Obtain the client’s operating system user name from the
        operating system and check if it matches the requested database
        user name. This is only available for local connections.

Using a combination of these options, you create a series of rules that
govern which hosts can access your database and which hosts are denied.
For example, you might change the default HBA rules to only allow remote
access to the {{ site.data.product.title }} database (`vmdb_production`) from hosts in
a certain subnet. The modified HBA table would looks like this:

    # TYPE  DATABASE          USER  ADDRESS         METHOD
    local   all               all                   peer map=usermap
    host    vmdb_production   all   192.168.1.0/24  md5
    #hostssl all              all   all             md5

These restrictions help when structuring your {{ site.data.product.title }} appliances
in relationships. For example, use these database restrictions to grant
access only between a master database appliance in one region and
appliances connecting from a separate region.
