# Adding an IBM Terraform Provider

To start discovering the Terraform templates and virtual machines, you need at least one IBM Terraform provider added to {{ site.data.product.title_short }}.

1. Browse to menu: **Configuration > Providers**.

2. Select menu: **Configuration > Add a new Provider**.

3. Select **Type** as **IBM Terraform Configuration**

4. Enter a **Name** for the provider.

5. Select a **Zone**, choose **default**.
   ### In the Endpoint section:
6. Enter the **Managed Services URL** for the provider.
   
   This is the URL for Managed Services and can be either an IP address or a hostname. 
    
    For example, `https://cam.apps.test.example.com`.

7. In the `Endpoint` section, enter the **CloudPak for MCM URL**. This is the console URL for the IBM CloudPak for Multicloud Management system. This is used for authentication and access token.
    
    For example, `https://cp-console.apps.test.example.com`.

8. Select **SSL verification** as **Verify** or **Do not verify**.
 
9.  Enter a **Username** for a user on the provider. This must be a user in IBM CloudPak for Multicloud Management.

10. Enter a **Password**.

11. Click **Validate** to test your connection.

12. Click **Add** to confirm your settings and save the provider.

{{ site.data.product.title_short }} saves the IBM Terraform provider in its database and triggers a refresh of resources detected in the provider.
