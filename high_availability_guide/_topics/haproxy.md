## Configuring the HAProxy Load Balancer

After configuring the appliances as described in [???](#installation),
configure a load balancer to direct traffic to the non-database
{{ site.data.product.title_short }} appliances.

The following steps highlight the configuration requirements for the
load balancer, which in this case is HAProxy. The load balancer is
assigned a virtual IP address for the {{ site.data.product.title_short }} user
interface and is pointed to one of the many non-database
{{ site.data.product.title_short }} appliances behind the load balancer in a round
robin fashion.

Additionally, to avoid the HAProxy server being a single point of
failure, two redundant HAProxy servers are configured in active-passive
mode. The failover is orchestrated by using the `keepalived` daemon.
`keepalived` monitors the health of the active load balancer and in case
of a failure, the virtual IP is failed over to the passive load
balancer, which then becomes active. The virtual IP is configured
by\`keepalived\`.

The virtual IP is the single IP address that is used as the point of
access to the {{ site.data.product.title_short }} appliance user interfaces and is
configured in the HAProxy configuration along with a load balancer
profile. When an end user accesses the virtual IP, it directs traffic to
the appropriate {{ site.data.product.title_short }} appliance based on the configured
HAProxy policy.

<div class="note">

Additional configuration is required to run HAProxy on Red Hat OpenStack
Platform. See the [OpenStack Networking
Guide](https://access.redhat.com/documentation/en/red-hat-openstack-platform/10/single/networking-guide/)
for more information.

</div>

This configuration uses two HAProxy servers and a virtual IP (configured
by `keepalived`). The following example procedure uses the following IP
addresses and names; substitute values for your environment as needed:

  - HAProxy1: 10.19.137.131 (cf-hap1.example.com)

  - HAProxy2: 10.19.137.132 (cf-hap2.example.com)

  - Virtual IP (to be configured by `keepalived`): 10.19.137.135
    (cf-ha.example.com)

  - {{ site.data.product.title_abbr_uc }} Appliance 1: 10.19.137.130
    (cfme1.example.com)

  - {{ site.data.product.title_abbr_uc }} Appliance 2: 10.19.137.129
    (cfme2.example.com)

The following diagram shows the HAProxy configuration in this procedure:
![cloudforms ha architecture 431939 0917 ece
01](../images/cloudforms_ha_architecture_431939_0917_ece-01.png)

To configure HAProxy load balancing:

1.  Install two servers (virtual or physical) running Red Hat Enterprise
    Linux 7.2 or above, to be used as the HAProxy servers.

2.  Configure subscriptions on both HAProxy servers (`cf-hap1` and
    `cf-hap2`) so that the `rhel-7-server-rpms` repository is enabled:

        [root@cf-hap1 ~]# subscription-manager repos --list-enabled
        +-------------------------------------------+
        Available Repositories in /etc/yum.repos.d/redhat.repo
        +-------------------------------------------+
        Repo Name:   Red Hat Enterprise Linux Server 7 Server (RPMs)

        Repo ID:     rhel-7-server-rpms

        Repo URL: https://cdn.redhat.com/content/dist/rhel/server/7/$release/$basearch/os
        Enabled: 1

        [root@cf-hap2 ~]# subscription-manager repos --list-enabled
        +-------------------------------------------+
        Available Repositories in /etc/yum.repos.d/redhat.repo
        +-------------------------------------------+
        Repo Name:   Red Hat Enterprise Linux Server 7 Server (RPMs)

        Repo ID:     rhel-7-server-rpms

        Repo URL: https://cdn.redhat.com/content/dist/rhel/server/7/$release/$basearch/os
        Enabled: 1

3.  Configure the firewall on both HAProxy servers.

    1.  On the `cf-hap1` server, run the following:

        <div class="note">

        `keepalived` uses VRRP (Virtual Redundancy Router Protocol) to
        monitor the servers and determine which node is the master and
        which node is the backup. VRRP communication between routers
        uses multicast IPv4 address 224.0.0.18 and IP protocol number
        112.

        </div>

            [root@cf-hap1 ~]# firewall-cmd --permanent  --add-port=80/tcp --add-port=443/tcp --add-port=8443/tcp && firewall-cmd --reload

            [root@cf-hap1 ~]# firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 0 \ --in-interface eth0 --destination 224.0.0.18 --protocol vrrp -j ACCEPT

            [root@cf-hap1 ~]#firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 0 \ --out-interface eth0 --destination 224.0.0.18 --protocol vrrp -j ACCEPT

            [root@cf-hap1 ~]# firewall-cmd --reload

    2.  On the `cf-hap2` server, repeat the same commands by running the
        following:

            [root@cf-hap2 ~]# firewall-cmd --permanent  --add-port=80/tcp --add-port=443/tcp --add-port=8443/tcp && firewall-cmd --reload

            [root@cf-hap2 ~]# firewall-cmd --direct --permanent --add-rule ipv4 filter INPUT 0 \ --in-interface eth0 --destination 224.0.0.18 --protocol vrrp -j ACCEPT

            [root@cf-hap2 ~]# firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 0 \ --out-interface eth0 --destination 224.0.0.18 --protocol vrrp -j ACCEPT

            [root@cf-hap2 ~]# firewall-cmd --reload

4.  Install and configure `keepalived` on both servers.

    1.  On the `cf-hap1` server, run the following:

            [root@cf-hap1 ~]# yum install keepalived -y

            [root@cf-hap1 ~]# cat /etc/keepalived/keepalived.conf
            vrrp_script chk_haproxy {
            script "killall -0 haproxy" # check the haproxy process
            interval 2 # every 2 seconds
            weight 2 # add 2 points if OK
            }
            vrrp_instance VI_1 {
            interface eth0             # interface to monitor
            state MASTER             # MASTER on haproxy1, BACKUP on haproxy2
            virtual_router_id 51
            priority 101             # 101 on haproxy1, 100 on haproxy2
            virtual_ipaddress {
            10.19.137.135/21 # virtual ip address
            }
            track_script {
            chk_haproxy
            }
            }

    2.  On the `cf-hap2` server, run the following:

            [root@cf-hap2 ~]# yum install keepalived -y

            [root@cf-hap2 ~]# cat /etc/keepalived/keepalived.conf
            vrrp_script chk_haproxy {
            script "killall -0 haproxy" # check the haproxy process
            interval 2 # every 2 seconds
            weight 2 # add 2 points if OK
            }
            vrrp_instance VI_1 {
            interface eth0             # interface to monitor
            state BACKUP             # MASTER on haproxy1, BACKUP on haproxy2
            virtual_router_id 51
            priority 100             # 101 on haproxy1, 100 on haproxy2
            virtual_ipaddress {
            10.19.137.135/21 # virtual ip address
            }
            track_script {
            chk_haproxy
            }
            }

    3.  On both servers, configure IP forwarding and non-local binding
        by appending the following to the `sysctl.conf` file. In order
        for the `keepalived` service to forward network packets properly
        to the real servers, each router node must have IP forwarding
        turned on in the kernel. On the `cf-hap1` server, run the
        following:

            [root@cf-hap1 ~]# cat /etc/sysctl.conf
            # System default settings live in /usr/lib/sysctl.d/00-system.conf.
            # To override those settings, enter new settings here, or in an /etc/sysctl.d/<name>.conf file
            #
            # For more information, see sysctl.conf(5) and sysctl.d(5).
            net.ipv4.ip_forward = 1
            net.ipv4.ip_nonlocal_bind = 1

    4.  On the `cf-hap2` server, run the following:

            [root@cf-hap2 ~]# cat /etc/sysctl.conf
            # System default settings live in /usr/lib/sysctl.d/00-system.conf.
            # To override those settings, enter new settings here, or in an /etc/sysctl.d/<name>.conf file
            #
            # For more information, see sysctl.conf(5) and sysctl.d(5).
            net.ipv4.ip_forward = 1
            net.ipv4.ip_nonlocal_bind = 1

    5.  Verify that the `sysctl.conf` settings were saved on each
        server:

            [root@cf-hap1 ~]# sysctl -p
            net.ipv4.ip_forward = 1
            net.ipv4.ip_nonlocal_bind = 1

            [root@cf-hap2 ~]# sysctl -p
            net.ipv4.ip_forward = 1
            net.ipv4.ip_nonlocal_bind = 1

5.  Install HAProxy on both servers:

        [root@cf-hap1 ~]# yum install haproxy -y

        [root@cf-hap2 ~]# yum install haproxy -y

6.  Configure the appropriate IPs for load balancing on the `cf-hap1`
    server as follows:

        [root@cf-hap1 ~]# cat /etc/haproxy/haproxy.cfg
        global
            log                 127.0.0.1 local0
            chroot              /var/lib/haproxy
            pidfile             /var/run/haproxy.pid
            maxconn         4000
            user                haproxy
            group               haproxy
            daemon
        defaults
            mode                        http
            log                         global
            option                      httplog
            option                      dontlognull
            option             http-server-close
            option     forwardfor       except 127.0.0.0/8
            option                      redispatch
            retries                     3
            timeout http-request    10s
            timeout queue           1m
            timeout connect         10s
            timeout client              1m
            timeout server          1m
            timeout http-keep-alive     10s
            timeout check           10s
        # {{ site.data.product.title_short }} Management UI URL
        listen apache
          bind 10.19.137.135:80
          mode tcp
          balance source
          server cfme1 10.19.137.130:80 check inter 1s
          server cfme2 10.19.137.129:80  check inter 1s
        #
        listen apache-443
          bind 10.19.137.135:443
          mode tcp
          balance source
          server cfme1 10.19.137.130:443 check inter 1s
          server cfme2 10.19.137.129:443  check inter 1s
        #
        listen apache-8443
          bind 10.19.137.135:8443
          mode tcp
          balance source
          server cfme1 10.19.137.130:8443 check inter 1s
          server cfme2 10.19.137.129:8443  check inter 1s

    <div class="note">

      - The virtual IP in this configuration is 10.19.137.135
        (cf-haproxy.example.com).

      - The IP of {{ site.data.product.title_abbr_uc }} Appliance 1 is 10.19.137.130
        (cfme1.example.com).

      - The IP of {{ site.data.product.title_abbr_uc }} Appliance 2 is 10.19.137.129
        (cfme2.example.com).

    </div>

7.  Configure the appropriate IPs for load balancing on the `cf-hap2`
    server as well:

        [root@cf-hap2 ~]# cat /etc/haproxy/haproxy.cfg
        global
            log                 127.0.0.1 local0
            chroot              /var/lib/haproxy
            pidfile             /var/run/haproxy.pid
            maxconn         4000
            user                haproxy
            group               haproxy
            daemon
        defaults
            mode                        http
            log                         global
            option                      httplog
            option                      dontlognull
            option             http-server-close
            option     forwardfor       except 127.0.0.0/8
            option                      redispatch
            retries                     3
            timeout http-request    10s
            timeout queue           1m
            timeout connect         10s
            timeout client              1m
            timeout server          1m
            timeout http-keep-alive     10s
            timeout check           10s
        # {{ site.data.product.title_short }} Management UI URL
        listen apache
          bind 10.19.137.135:80
          mode tcp
          balance source
          server cfme1 10.19.137.130:80 check inter 1s
          server cfme2 10.19.137.129:80  check inter 1s
        #
        listen apache-443
          bind 10.19.137.135:443
          mode tcp
          balance source
          server cfme1 10.19.137.130:443 check inter 1s
          server cfme2 10.19.137.129:443  check inter 1s
        #
        listen apache-8443
          bind 10.19.137.135:8443
          mode tcp
          balance source
          server cfme1 10.19.137.130:8443 check inter 1s
          server cfme2 10.19.137.129:8443  check inter 1s

8.  On each server, start the `keepalived` and `haproxy` services:

        [root@cf-hap1~]# systemctl enable keepalived
        [root@cf-hap1~]# systemctl start keepalived
        [root@cf-hap1~]# systemctl enable haproxy
        [root@cf-hap1~]# systemctl start haproxy

        [root@cf-hap2~]# systemctl enable keepalived
        [root@cf-hap2~]# systemctl start keepalived
        [root@cf-hap2~]# systemctl enable haproxy
        [root@cf-hap2~]# systemctl start haproxy

### Verifying the HAProxy Configuration

Verify the HAProxy configuration by inspecting the following:

On the master node (`cf-hap1`):

    [root@cf-hap1 ~]# ip addr show dev eth0
    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 00:01:a4:ac:32:4e brd ff:ff:ff:ff:ff:ff
        inet 10.19.137.131/21 brd 10.19.143.255 scope global eth0
           valid_lft forever preferred_lft forever
        inet 10.19.137.135/21 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 2620:52:0:1388:201:a4ff:feac:324e/64 scope global mngtmpaddr dynamic
           valid_lft 2591800sec preferred_lft 604600sec
        inet6 fe80::201:a4ff:feac:324e/64 scope link
           valid_lft forever preferred_lft forever

On the backup node (`cf-hap2`):

    [root@cf-hap2 ~]# ip addr show dev eth0
    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 00:01:a4:ac:33:a6 brd ff:ff:ff:ff:ff:ff
        inet 10.19.137.132/21 brd 10.19.143.255 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 2620:52:0:1388:201:a4ff:feac:33a6/64 scope global noprefixroute dynamic
           valid_lft 2591982sec preferred_lft 604782sec
        inet6 fe80::201:a4ff:feac:33a6/64 scope link
           valid_lft forever preferred_lft forever

Notice the virtual IP 10.19.137.135 has been started by `keepalived`
(VRRP).

Simulate a failure on the master node:

    [root@cf-hap1 ~]# systemctl stop keepalived

Notice the virtual IP failover on the master node (`cf-hap1`):

    [root@cf-hap1 ~]# ip addr show dev eth0
    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 00:01:a4:ac:32:4e brd ff:ff:ff:ff:ff:ff
        inet 10.19.137.131/21 brd 10.19.143.255 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 2620:52:0:1388:201:a4ff:feac:324e/64 scope global mngtmpaddr dynamic
           valid_lft 2591800sec preferred_lft 604600sec
        inet6 fe80::201:a4ff:feac:324e/64 scope link
           valid_lft forever preferred_lft forever

The backup node (`cf-hap2`) shows the following:

    [root@cf-hap2 ~]# ip addr show dev eth0
    2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 00:01:a4:ac:33:a6 brd ff:ff:ff:ff:ff:ff
        inet 10.19.137.132/21 brd 10.19.143.255 scope global eth0
           valid_lft forever preferred_lft forever
        inet 10.19.137.135/21 scope global eth0
           valid_lft forever preferred_lft forever
        inet6 2620:52:0:1388:201:a4ff:feac:33a6/64 scope global noprefixroute dynamic
           valid_lft 2591982sec preferred_lft 604782sec
        inet6 fe80::201:a4ff:feac:33a6/64 scope link
           valid_lft forever preferred_lft forever

Your environment is now configured for high availability.

<div class="important">

The following additional configuration in the {{ site.data.product.title }} user
interface worker appliances and the load balancer are recommended for
improved performance in worker appliances:

  - For each {{ site.data.product.title_short }} appliance behind the load balancer,
    change the `session_store` setting to `sql` in the appliance’s
    advanced settings.

  - Configure sticky sessions in the load balancer.

  - Configure the load balancer to test for appliance connectivity using
    the `https://appliance_name/ping` URL.

</div>
