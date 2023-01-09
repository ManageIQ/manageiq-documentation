---
---

# Upgrading Appliances

In this example, we will update from jansa to kasparov.

1. Ensure that the appliance is up to date on the current branch

        # dnf update

2. Install the new manageiq-release RPM for the version that you want to upgrade to. Refer to the [release directory](https://rpm.manageiq.org/index.html?prefix=release/) in our RPM repository to find the latest manageiq-release rpm. The number is the alphabetical number of the release (e.g. j (jansa) is the 10th letter: 10-jansa, k (kasparov) is the 11th letter: 11-kasparov, etc.)

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
