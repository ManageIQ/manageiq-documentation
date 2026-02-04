---
---

# Upgrading Appliances

In this example, we will update from jansa to kasparov.

1. Ensure that the appliance is up to date on the current branch

        # dnf update

2. Install the new manageiq-release RPM for the version that you want to upgrade to. Refer to the [release directory](https://rpm.manageiq.org/?prefix=release) in our RPM repository to find the latest manageiq-release rpm. Navigate to the non-nightly directory, el, then noarch directory for the version that you want to upgrade to, and get the URL for the manageiq-release rpm.

        # dnf install https://rpm.manageiq.org/release/11-kasparov/el8/noarch/manageiq-release-11.0-1.el8.noarch.rpm

3. Stop evmserverd if running

        # systemctl stop evmserverd
        # systemctl status evmserverd

4. Update the RPMs from the new repo

        # dnf update

5. Migrate the database

        # cd /var/www/miq/vmdb/
        # bundle exec rake db:migrate

6. Reboot the appliance

        # reboot

## Update automation engine

In the UI navigate to <strong> Automation > Embedded Automate > Import/Export</strong> and click the Reset option <strong>(<img width="21" height="19" alt="image" src="https://github.com/user-attachments/assets/0b81f390-9ed0-4996-aad8-3a3db8a5b809"/> Reset all components in the built-in domains)</strong>.
Always be sure to export the current datastore before importing or resetting.
