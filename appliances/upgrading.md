---
---

# Upgrading Appliances
In this example, we will update from jansa to kasparov.

1. Ensure that the appliance is up to date on the current branch

        # dnf update

2. Install the new manageiq-release RPM for the version that you want to upgrade to. Refer to ([RPM URLs for manageiq-release](#rpm-urls-for-manageiq-release)) for the list of RPM URLs

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


# Appendix

## RPM URLs for manageiq-release

        https://rpm.manageiq.org/release/19-spassky/el9/noarch/manageiq-release-19.0-1.el9.noarch.rpm
        https://rpm.manageiq.org/release/18-radjabov/el9/noarch/manageiq-release-18.0-1.el9.noarch.rpm
        https://rpm.manageiq.org/release/17-quinteros/el8/noarch/manageiq-release-17.0-1.el8.noarch.rpm
        https://rpm.manageiq.org/release/16-petrosian/el8/noarch/manageiq-release-16.0-1.el8.noarch.rpm
        https://rpm.manageiq.org/release/15-oparin/el8/noarch/manageiq-release-15.0-1.el8.noarch.rpm
        https://rpm.manageiq.org/release/14-najdorf/el8/noarch/manageiq-release-14.0-1.el8.noarch.rpm
        https://rpm.manageiq.org/release/13-morphy/el8/noarch/manageiq-release-13.0-1.el8.noarch.rpm
        https://rpm.manageiq.org/release/12-lasker/el8/noarch/manageiq-release-12.0-1.el8.noarch.rpm
        https://rpm.manageiq.org/release/11-kasparov/el8/noarch/manageiq-release-11.0-1.el8.noarch.rpm
        https://rpm.manageiq.org/release/10-jansa/el8/noarch/manageiq-release-10.0-1.el8.noarch.rpm

## Update automation engine

In the UI navigate to <strong> Automation > Embedded Automate > Import/Export</strong> and click the Reset option <strong>(<img width="21" height="19" alt="image" src="https://github.com/user-attachments/assets/0b81f390-9ed0-4996-aad8-3a3db8a5b809"/> Reset all components in the built-in domains)</strong>.
Always be sure to export the current datastore before importing or resetting.
