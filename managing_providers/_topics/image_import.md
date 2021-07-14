# Image Import Workflows

## IBM PowerVC to IBM Power Systems Virtual Server

The image import functionality allows you to easily move an image from your on-prem PowerVC environment to an off-prem Power Systems Virtual Server environment using {{ site.data.product.title_short }} web interface.
The enablement of the workflow in {{ site.data.product.title_short }} requires you to perform certain preparations that are described in detail below.

### Preparing {{ site.data.product.title_short }} hosting server (required once):

The following commands are to be run on a server (or in a corresponding docker container) that is dedicated to hosting your {{ site.data.product.title_short }} instance.

1. Install `ansible-runner` application using the installation [instructions](https://ansible-runner.readthedocs.io/en/stable/install.html). The application must be available in the the command line
of the user under which the {{ site.data.product.title_short }} web-server is running.

### Preparing IBM PowerVC Server (required once):
The  following commands are to be run on a PowerVC server that is dedicated to supporting the image import workflow.

1. Make sure that the IBM PowerVC version you are using is [1.4.4](https://www.ibm.com/docs/it/powervc/1.4.4?topic=installing-power-virtualization-center) or higher and is located on a server running either SLES or RHEL family GNU/Linux distribution.


2. Install `python3.X`, `pip3`, `virtualenv` applications as well as the `libselinux-python3` library.
   You can achieve this by issuing the following command as a "root" user:

       yum install -y python3 python-pip3 python-virtualenv libselinux-python3 gcc

   The standard `python3.X` installation will be used in order to run auxiliary scripts, which will
   upload PowerVC ([OVA](https://en.wikipedia.org/wiki/Open_Virtualization_Format)) disk images to the [IBM Cloud Object Storage](https://www.ibm.com/cloud/object-storage).
   The `pip3` is required in order to install Cloud Object Storage [Python SDK](https://github.com/ibm/ibm-cos-sdk-python) and auxiliary packages for proper functioning of the import workflow.
   The role of `virtualenv` will be to isolate python package installations that are relevant only to the image import workflow from the
   Python system packages. The `libselinux-python3` library is needed for the proper functioning of Ansible's `copy` module, which will
   be used for the copying of auxiliary data between the {{ site.data.product.title_short }} hosting site and the PowerVC server. Presence
   of `gcc` is needed as a dependency of one of the Python packages (`pycryptodome`) that will be installed on later steps.


3. Prepare enough local storage for holding transient PowerVC disk images that will be transported into Power Systems Virtual Server
   and deleted from a local storage upon workflow completion. A typical PowerVC image file size can be many GBs.
   As an example, a RHEL 8.3 disk image can be of 20GB size or more. You would therefore require more space
   in your local storage than the mentioned disk image size in order to support the import workflow.
   You would also need enough space to hold Python virtual environment described in the next steps.
   Its size however will be no more than 100MB. Additionally, import session will place auxiliary files into the sessions directory
   during the workflow execution but their collective size will not exceed 5MB. In summary, if you're attempting to import an image 
   whose size is 'G' Gigabytes, then having 'G+1' Gigabytes of free space in that directory would be sufficient.

   
4. Create an empty sessions directory `/home/sessions` which will have to be located on the local storage with sufficient space
   as described in previous step.
 
       mkdir /home/sessions

5. The image import workflow will use Ansible via SSH from the {{ site.data.product.title_short }} server in order to execute commands on the PowerVC server. At this point you need to choose a system user 
   that will be made available to {{ site.data.product.title_short }} instance for connection to the PowerVC server via SSH. Make sure the user has a read/write access to the `/home/sessions` directory.
   The user must also be able to execute `powervc-image` application through the command line. We will assume that all further commands in this section are executed using this existing or newly created system user:

       su - your_user

7. Create a separate virtual Python environment:

       virtualenv --system-site-packages /home/sessions/venv

   This environment will hold Python packages that are relevant only to the image import workflow
   and as such will not be available system-wide. Conversely, the `--system-site-packages` will indicate to the application that the existing Python system packages are to be made available
   to the virtual environment.


7. Installing packages in the environment requires one to first activate the environment after which
   all the Python package installations via `pip3` will become environment relative only. Therefore, activate the newly created Python environment:

       source /home/sessions/venv/bin/activate


8. Install Python packages inside the virtual environment using: 

       pip3 install pathlib pycryptodome ibm-cos-sdk

   The `pathlib` is  used for handling file paths. The `pycryptodome` is required for
   encrypting/decrypting IBM Cloud connection credentials and the `ibm-cos-sdk` represents the IBM Cloud Object Storage Python SDK.


9. Upon completing the Python package installations above you should exit the virtual environment by running:

       deactivate

11. Make sure to have a valid PowerVC connection/resource file under `/opt/ibm/powervc/powervcrc` (or at your custom location) containing similar definitions:

        export OS_IDENTITY_API_VERSION=3
        export OS_AUTH_URL=https://host:5000/v3/
        export OS_CACERT=/etc/pki/tls/certs/powervc.crt
        export OS_REGION_NAME=RegionOne
        export OS_PROJECT_DOMAIN_NAME=Default
        export OS_PROJECT_NAME=ibm-default
        export OS_TENANT_NAME=$OS_PROJECT_NAME
        export OS_USER_DOMAIN_NAME=Default
        export OS_USERNAME=root
        export OS_PASSWORD=password
        export OS_COMPUTE_API_VERSION=2.46
        export OS_NETWORK_API_VERSION=2.0
        export OS_IMAGE_API_VERSION=2
        export OS_VOLUME_API_VERSION=2

    **Note:** If you don't want to specify the password (`OS_PASSWORD`) in this file then you will be prompted by the
    PowerVC command line utilities to input it in the interactive mode. This will occur during testing only as the image import
    workflow will make use of the credentials that will be specified when registering PowerVC provider in your {{ site.data.product.title_short }} instance on later steps.


12. The last step is to test the exporting of PowerVC disk image to the local filesystem. Firstly, execute:

        source /opt/ibm/powervc/powervcrc

    This will acquire all the environmental variables required for issuing commands to the corresponding PowerVC instance. Now run the following command:

        powervc-image list

     The output should be similar to the one below:

        +----------+--------------------------------------+--------+---------+------+-------------+--------------+-----------+------------+
        | Name     | ID                                   | Status | Volumes | Size | Description | Architecture | OS Distro | Exportable |
        +----------+--------------------------------------+--------+---------+------+-------------+--------------+-----------+------------+
        | test-IMG | XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX | active | 1       | 10   |             | ppc64        | rhel      | True       |
        +----------+--------------------------------------+--------+---------+------+-------------+--------------+-----------+------------+

      Note the name of the image you would like to export, which will be `test-IMG` in our example. Next export the image of your choice:

        powervc-image export -i test-IMG -p /home/sessions/image.ova

      It is a time-consuming operation with the runtime taking several minutes to complete depending on the size of exported image.
      Once the operation completes you should be able to find the exported image under `/home/sessions/image.ova`.  At this stage you can remove the exported image thus concluding the test:

        rm /home/sessions/image.ova

### Add a Cloud Object Storage provider in {{ site.data.product.title_short }}: 

1. See the corresponding instructions [here](#storage-managers).

2. Create a bucket in your Cloud Object Storage that will hold the transient OVA image files.    
   ![New Bucket](../images/new_bucket.png)  
   Make sure to choose the region for the bucket that corresponds to the region that you have specified when registering the
   Cloud Object Storage provider.

### Add an IBM Power Systems Virual Servers provider in {{ site.data.product.title_short }}:

1. See the corresponding instructions [here](#ibm-power-systems-virtual-servers-providers).

### Add an IBM PowerVC provider in {{ site.data.product.title_short }}:

1. See the corresponding instructions [here](#ibm-powervc). 

2. Specify the image import related parameters on the PowerVC registration form.   
  ![pvc_reg](../images/pvc_import_method.png)  

* Enter the SSH username for access to the PowerVC server. It corresponds to the user on your PowerVC server that is dedicated to
running image import related commands via Ansible as described in previous section. 

* Select the authentication method: Password / Private key
 
* If password method is chosen then enter the corresponding SSH password.  
  ![pvc_reg](../images/pvc_import_pass.png)

* If private key method is chosen then enter the private key and the private key passphrase (if present).  
  ![pvc_reg](../images/pvc_import_pkey.png)

* (optional) Specify custom location of the resource file on the PowerVC server:  
   ![pvc_reg](../images/pvc_rcfile.png)



### Start the workflow
The workflow operates by exporting the image as an OVA file onto a PowerVC local storage, uploading it to the Cloud Object Storage bucket and then transferring it into Power Systems Virtual Servers image registry. In order to initiate the workflow:

1. Queue the refreshing of all the above mentioned (cloud and storage) providers and wait for the operations to complete.
![Import Image Button Screenshot](../images/refresh_providers.png)


2. Navigate to the Power Virtual Servers provider added above. ![Import Image Button Screenshot](../images/import_button.png)


3. Click on the `Import Image` button after which an import form will appear.


4. Choose the PowerVC provider added above as a source provider.


5. Choose the image you would like to import.


6. Choose the Cloud Object Storage provider added above.


7. Choose the transient bucket created above.


8. Choose target disk type for the image being imported.


9. Check the corresponding box if you wish to keep the OVA file in the cloud bucket upon workflow completion.


10. Click on the `Import` button initiating the workflow.  
  ![Import Image Button Screenshot](../images/pvc_pvs_import_form.png)

11. The workflow can take an hour or more depending on the image size, bucket location,
Power Systems Virtual Server and PowerVC internal load.

12. Watch for the current status of the workflow under `Settings -> Tasks -> All Tasks`.  
  ![Workflow Form Screenshot](../images/miq_import_task.png)

13. Initiate the refreshing of the Power Virtual Servers provider upon workflow completion and
wait for the newly imported image to appear.


### Troubleshooting

* If the {{site.data.product.title_short}} UI shows no detailed error description then make sure to check the latest logs in `<{{ site.data.product.title_short }}>/log/evm.log` on a server that hosts your {{site.data.product.title_short}} instance.


* If  `{{ site.data.product.title_short }}` server is terminated during the workflow execution then certain residual objects will 
  have to be removed manually. These are potentially the session directory on the PowerVC server under `/home/sessions`, the already uploaded OVA 
  image file in the Cloud Object Storage bucket or its parts as explained [here](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-large-objects) (see `Abort incomplete multipart uploads`).

