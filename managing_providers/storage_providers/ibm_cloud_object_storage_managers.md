# IBM Cloud Object Storage Managers

[IBM Cloud Object Storage](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-about-cloud-object-storage) is a highly available, durable, and secure platform for    storing unstructured data. 
Unstructured data (sometimes called binary or "blob" data) refers to data that is not highly structured in the 
manner of a database. Object storage is the most efficient way to store PDFs, media files, database backups, 
disk images, or even large structured datasets.

The files that are uploaded into IBM Cloud Object Storage are called objects. They are organized into buckets that serve 
as containers for objects, and which can be configured independently from one another in terms of locations, resiliency, 
billing rates, security, and object lifecycle.

### Adding IBM Cloud Object Storage:

The Cloud Object Storage provider in {{ site.data.product.title_short }} is region centric. When registering this provider a given region must be chosen
such that only buckets and objects of that region will be available / visible to the provider user in {{ site.data.product.title_short }}. 
For a list of supported regions please refer to this [page](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-endpoints#endpoints-region).

1. [Create](https://cloud.ibm.com/objectstorage/create) new Cloud Object Storage instance in IBM Cloud Console.

2. Create access credentials by navigating to **Service Credentials -> New Credential** in your new instance.  
   ![Import Image Button Screenshot](../images/new_cos_creds.png)    
   Make sure to choose the **Manager** role and to enable **Include HMAC Credential** option.

3. Next navigate to `Manage -> Access (IAM) -> Service IDs`, find your newly created credential and edit it. 
   ![pvc_reg](../images/cos_access_policies.png)

4. Select `Viewer` checkbox under `Platform Access` group and press `Add`.  
   ![pvc_reg](../images/cos_viewer.png)

5. Browse to {{ site.data.product.title_short }} menu **Storage > Managers**.

6. Click **Configuration**, then click
    ![1862](../images/1862.png) (**Add a New Storage Provider**).

7. From the **Type** list, select **IBM Cloud Object Storage**.

8. Enter a **Name** for the storage manager.

9. Set **default** as a value for the **Zone**

10. Enter the desired region in the corresponding **Region** field. As explained above
    your provider will be region-specific.

11. Specify the **Resource Instance Id**, which you can find as the value of the `resource_instance_id` item of the credentials. 

12. **Endpoint** depends on the region you have chosen to connect your provider to. For more explanation and the listing of the endpoints please refer to this [page](https://cloud.ibm.com/ docs/cloud-object-storage?topic=cloud-object-storage-endpoints#endpoints-region).
    If your region is e.g. `us-south` then the public endpoint for it would be `https://s3.us-south.cloud-object-storage.appdomain.cloud`. 

13. Specify the **Apikey**, which you can find as the value of the `apikey` item of the credentials.

14. Specify the **Access Key**, which you can find as the value of the `cos_hmac_keys -> access_key_id` item of the credentials.

15. Specify the **Secret Key**, which you can find as the value of the `cos_hmac_keys -> secret_access_key` item of the credentials.

16. Once you have inputted the above values press on **Validate** button and wait for the validation to complete. 
    Upon successful validation the **Add** button will be enabled, clicking on which will add the new provider.
