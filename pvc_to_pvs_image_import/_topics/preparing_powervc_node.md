### General Assumptions:

1. You have the latest installation of the {{ site.data.product.title_short }} base (>= [Morphy](https://github.com/{{ site.data.product.title_short }}/manageiq/milestone/4)) on your server or workstation.




2. You have `ansible-runner` installed in the system that hosts your {{ site.data.product.title_short }} instance.  
For installation instructions please refer to this [guide](https://ansible-runner.readthedocs.io/en/stable/install.html). 


3. Your {{ site.data.product.title_short }} base is located under `<MIQ_PATH>` on your {{ site.data.product.title_short }} hosting site.
 

4. You have chosen a PowerVC control server for usage with the import workflow and have administrative access via it's command line.



### Preparing IBM PowerVC Server (required once):
All commands in this paragraph are to be run on a PowerVC server that is dedicated to supporting the image import workflow.
This server should have `powervc-image` client application available in it's command line, typically included in the PowerVC installation. 

1. Install `python3.X`, `pip3`, `virtualenv` applications as well as the `libselinux-python3` library.
The standard `python3.X` installation will be used in order to run auxiliary scripts, which will 
upload PowerVC ([OVA](https://en.wikipedia.org/wiki/Open_Virtualization_Format)) disk images to the [IBM Cloud Object Storage](https://www.ibm.com/cloud/object-storage). 
The `pip3` is required in order to install Cloud Object Storage [Python SDK](https://github.com/ibm/ibm-cos-sdk-python) and auxiliary packages for proper functioning of the import workflow.
The role of `virtualenv` will be to isolate python package installations that are relevant only to the image import workflow from the
Python system packages. The `libselinux-python3` library is needed for the proper functioning of Ansible's `copy` module, which will
be used for the copying of auxiliary data between the {{ site.data.product.title_short }} hosting server and the PowerVC server.
   


2. Prepare enough local storage for holding transient PowerVC disk images that will be transported into PowerVS
and deleted from a local storage upon workflow completion. A typical PowerVC image file size can be many GBs.
As an example, a RHEL 8.3 disk image can be of 20GB size or more. You would therefore require more space
in your local storage than the mentioned disk image size in order to support the import workflow. 
You would also need enough space to hold Python virtual environment described in the next steps.
It's size however will be no more than 100MB. Additionally, import session will place auxiliary files into the sessions directory
during the workflow execution but their collective size will not exceed 5MB.


3. Create sessions directory `/home/sessions` which will have to be located on the local storage with sufficient space 
as described in previous step. E.g. if you are planning to import images of 80GB size then you need
the sessions directory to contain at least 80GB of free space + space for the Python virtual environment and auxiliary files. 
In such a scenario 81GB of free space would be sufficient in order to support single import session at a given time under the
assumption that the corresponding disk image sizes are not greater than 80GB.
 

4. Create a virtual Python environment: `virtualenv --system-site-packages /home/sessions/venv`.
As mentioned earlier, this environment will hold Python packages that are relevant only to the image import workflow
and as such will be isolated from the system packages. The `--system-site-packages` will tell the application that the existing Python system packages should be made available
to the virtual environment. 


5. Activate the newly created Python environment:  `source /home/sessions/venv/bin/activate`.
Installing packages in the environment requires one to first activate the environment after which
all the Python package installations via `pip3` will become environment relative only.


6. Install Python packages inside the Virtual Environment using: `pip3 install ntpath pathlib base64 pycryptodome ibm-cos-sdk`.
The `ntpath` and `pathlib` are used for handling file paths. The `pycryptodome` and `base64` are required for
decrypting IBM Cloud connection credentials and the `ibm-cos-sdk` is the IBM Cloud Object Storage Python SDK mentioned above.


7. Exit the virtual environment by running: `deactivate`. Upon completing the Python package installations above you should exit the virtual environment.
 

8. Place a valid PowerVC connection/resource file under '`/opt/ibm/powervc/powervcrc`' with a similar content:
    
    `export OS_IDENTITY_API_VERSION=3`
    
    `export OS_AUTH_URL=https://host:5000/v3/`
    
    `export OS_CACERT=/etc/pki/tls/certs/powervc.crt`
    
    `export OS_REGION_NAME=RegionOne`
    
    `export OS_PROJECT_DOMAIN_NAME=Default`
    
    `export OS_PROJECT_NAME=ibm-default`
    
    `export OS_TENANT_NAME=$OS_PROJECT_NAME`
    
    `export OS_USER_DOMAIN_NAME=Default`
    
    `export OS_USERNAME=root`
    
    `export OS_PASSWORD=password`
    
    `export OS_COMPUTE_API_VERSION=2.46`
    
    `export OS_NETWORK_API_VERSION=2.0`
    
    `export OS_IMAGE_API_VERSION=2`
    
    `export OS_VOLUME_API_VERSION=2`


9. The last step is to test the exporting of PowerVC disk image to the local filesystem. Firstly, execute `source /opt/ibm/powervc/powervcrc`. This will acquire all the environmental variables
   required for issuing commands to the corresponding PowerVC instance. Note the name of the image you would like to export in the output of: `powervc-image list`. 
   Export the image `powervc-image export -i <image_name> -p /home/sessions/image.ova`. Note that this a lengthy operation with the runtime taking several minutes to complete depending on the size of exported image.  

  
10. If the previous steps have all succeeded then your PowerVC control server is ready for the
usage with the image import workflow.

### Add a PowerVS instance (required once):

See the corresponding instructions [here](https://www.manageiq.org/docs/reference/latest/managing_providers/index.html#ibm-power-systems-virtual-servers-providers). 


### Add a PowerVC instance (required once):

1.  Open PowerVC registration form using `Cloud Providers` Tab in {{ site.data.product.title_short }}.

![PVC Registration Form Sample Screenshot](../images/pvc.png)

2. Fill in the registration data.


3.  Open `Image Import` Tab on the registration form.


4.  Input the SSH password of the `root` user on the PowerVC node and save the provider.


5.  Initiate the refreshing of the provider, wait for instance images to appear.


### Add a Cloud Object Storage (required once):

1.  Create new [Cloud Object Storage](https://cloud.ibm.com/objectstorage/create) instance in IBM Cloud Console.


2.  Navigate to `Service Credentials -> New Credential`, choose the `Manager` role and 

    enable `Include HMAC Credential` option when generating the credentials.


3. Navigate to `Manage -> Access (IAM) -> Service IDs` and choose your newly created key. 


4. Navigate to `Access Policies -> Assign Access -> IAM Service -> Cloud Object Storage`.


5. Select `Writer` checkbox under `Service Access` group and press `Add`.

![Access Policy Screenshot](../images/cos_access.png)

6. Create a new bucket through IBM console, e.g. `transient-image-bucket`.


![Create a new bucket Screenshot](../images/cos_buckets.png)

7.  Open Cloud Object Storage registration form using `Storage Providers` Tab in {{ site.data.product.title_short }}.



8.  Initiate the refreshing of the provider, wait for the cloud buckets to appear.

### Start the workflow

1. Navigate to the Power Virtual Servers provider added above.


2. Click on the `Import Image` button.

![Import Image Button Screenshot](../images/import_button.png)


3. Choose the PowerVC provider added above as a source provider for the import.


4. Choose the image you would like to import.


5. Choose the Cloud Object Storage provider added above.


6. Choose the transient bucket created above.


7. Choose target disk type for the image being imported.


8. Decide if you want to keep transient OVA file in your bucket upon completion.


9. Submit the Image Import Request (it might take an hour or more depending on the image size).

![Workflow Form Screenshot](../images/workflow.png)


10. You can see current progress in `{{ site.data.product.title_short }} -> Settings -> Tasks -> All Tasks`.


11.  Initiate the refreshing of the Power Virtual Servers provider upon workflow completion, 
     
     wait for the newly imported image to appear.


### Provision an instance

1. Navigate to Power Virtual Servers provider.


2. Go to Images View and click on the newly imported image.


3. Click on "`Lifecycle -> Provision Instances Using this Image`"


4. Choose the server name and set all other values as desired. 


5. Submit the provisioning workflow and wait for it to finish.


6. Connect to the newly provisioned server e.g. via SSH.


### Troubleshooting