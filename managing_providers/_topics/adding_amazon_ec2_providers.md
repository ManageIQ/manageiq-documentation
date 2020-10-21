# Adding Amazon EC2 Providers

Complete the following procedure to add an Amazon EC2 cloud provider in
{{ site.data.product.title_short }}.

1.  Navigate to menu:Compute\[Clouds \> Providers\].

2.  Click ![1847](../images/1847.png) (**Configuration**), then click
    ![1862](../images/1862.png) (**Add a New Cloud Provider**).

3.  Enter a **Name** for the provider.

4.  From the **Type** list, select **Amazon EC2**.

5.  Select a **Region**.

6.  Select the appropriate **Zone** if you have more than one available.

7.  Under **Endpoints**, click the **Default** tab.

    1.  Enter the **Endpoint URL**.

        **Note:**

        AWS allows users to set a custom endpoint URL when connecting to
        certain services, which you can add in the
        {{ site.data.product.title_short }} user interface per Amazon EC2 provider.
        See [Interface VPC Endpoints (AWS
        PrivateLink)](https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpce-interface.html)
        for more information.

        </div>

    2.  Generate an **Access Key** in the **Security Credentials** of
        your Amazon AWS account. The **Access Key ID** acts as your
        **User ID**, and your **Secret Access Key** acts as your
        **Password**.

    3.  Click **Validate** to validate the credentials.

8.  Click the **SmartState Docker** tab.

    1.  Enter the **SmartState Docker User Name** and **SmartState
        Docker Password**.

9.  Click **Add**.
