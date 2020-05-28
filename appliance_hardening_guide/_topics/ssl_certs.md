### Generating SSL Certificates for Your Appliance and Database

It is important to enhance the security of SSL communication of your
appliances, which, depending on your setup, may include your database
appliance. The appliance image ships with a default SSL certificate. It
is recommended to replace this certificate with your own certificate,
either signed by a trusted Certificate Authority (CA) or self-signed.

#### Creating a Certificate Signing Request

The first step is to determine the host name of your appliance or
database appliance by running the following command:

    $ hostname

The next step is to create a Certificate Signing Request (CSR) using the
`openssl` command:

    [root@ ~]# openssl req -new -newkey rsa:2048 -out appliance.csr -keyout appliance.key

This command generates a 2048-bit RSA private key and asks for a
passphrase for the key.

    Generating a 2048 bit RSA private key
    ..................+++
    ...........................+++
    writing new private key to 'appliance.key'
    Enter PEM pass phrase: **********
    Verifying - Enter PEM pass phrase: **********

The command then provides a questionnaire requesting certain details for
the key. Fill out this questionnaire. Use the output of the `hostname`
command to specify the `Common Name`.

For example:

    Country Name (2 letter code) [XX]:US
    State or Province Name (full name) []:North Carolina
    Locality Name (eg, city) [Default City]:Raleigh
    Organization Name (eg, company) [Default Company Ltd]:{{ site.data.product.title }}
    Organizational Unit Name (eg, section) []:Customer Content Services
    Common Name (eg, your name or your server's hostname) []:$(hostname)
    Email Address []:example@example.com

    Please enter the following 'extra' attributes
    to be sent with your certificate request
    A challenge password []:
    An optional company name []:

Running the command produces two files:

  - `appliance.key` - The private key

  - `appliance.csr` - The Certificate Signing Request (CSR)

At this stage, you would send the CSR to a trusted Certificate Authority
(CA) and in return they would send you a signed certificate.

#### Creating a Self-signed Certificate

As an alternative to obtaining a signed certificate, you can use the
`appliance.key` and `appliance.csr` files to create a self-signed
certificate by running the following `openssl` commands:

    [root@ ~]# openssl rsa -in appliance.key -out server.cer.key
    [root@ ~]# openssl x509 -in appliance.csr -out server.cer -req -signkey server.cer.key -days 3650

This produces two files:

  - `server.cer.key` - The private key for your signed certificate

  - `server.cer` - The self-signed certificate

#### Enabling Your Certificate

Despite whether you used a trusted CA or self-signed the certificate,
you should now have your own certificate for your appliance.

Copy the certificate and key files to the certificate directory on the
appliance:

    [root@ ~]# cp ~/server.cer.key /var/www/miq/vmdb/certs/server.cer.key
    [root@ ~]# cp ~/server.cer /var/www/miq/vmdb/certs/server.cer

After the certificate and key files have been copied, restart the
appliance:

    [root@ ~]# systemctl restart evmserverd

The appliance now uses your own certificate.

If your environment consists of multiple appliances connecting to a
single database appliance, you can use your certificate and key files to
set up SSL for the database connection. For more information, see
[???](#_chap_red_hat_cloudforms_security_guide_setting_ssl_for_the_database_appliance).

<div class="important">

Updates from the Red Hat Content Delivery Network might overwrite these
certificate and key files. Make sure to copy your own certificate and
key files to the certificate directory after performing an update to
your appliance.

</div>

<div class="note">

See also the following article for information on replacing SSL
certificates in {{ site.data.product.title }} :
<https://access.redhat.com/articles/449033>.

</div>
