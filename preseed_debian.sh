# Preseed file for Debian Server installation

# Locale and language settings
d-i locale string en_US.UTF-8
d-i console-keymaps-at/keymap select us
d-i keyboard-configuration/xkb-keymap select us

# Network settings
d-i netcfg/choose_interface select auto
d-i netcfg/get_hostname string debian-server
d-i netcfg/get_domain string local

# Mirror settings (use a local or specific mirror for your region)
d-i mirror/country string US
d-i mirror/http/hostname string ftp.au.debian.org
d-i mirror/http/directory string /debian
d-i mirror/suite string stable

# Partitioning
d-i partman-auto/method string lvm
d-i partman-auto-lvm/guided_size string max
d-i partman-lvm/device_remove_lvm_device boolean true
d-i partman-auto/choose_recipe select atomic
d-i partman/confirm_write_new_label boolean true
d-i partman/confirm boolean true
d-i partman-auto/purge_lvm_from_device boolean true

# User setup
d-i passwd/user-fullname string Admin User
d-i passwd/username string admin
d-i passwd/user-password password Password123
d-i passwd/user-password-again password Password123
d-i user-setup/allow-password-weak boolean true

# Root password
d-i passwd/root-password password root
d-i passwd/root-password-again password root

# Timezone settings
d-i time/zone string UTC

# Install standard system utilities
tasksel tasksel/first multiselect standard, ssh-server

# Package selection
d-i pkgsel/include string build-essential vim sudo curl git

# Grub installation (skip if booting from UEFI)
d-i grub-installer/only_debian boolean true
d-i grub-installer/bootdev string /dev/sda

# Install recommended software (for example, server packages)
d-i pkgsel/include string openssh-server sudo vim curl git

# APT configuration for automatic updates
d-i apt-setup/upgrade select full-upgrade
d-i apt-setup/use_mirror boolean true
d-i apt-setup/mirror select US

# Set the hostname
d-i netcfg/get_hostname string debian-server

# Reboot after installation
d-i finish-install/reboot_in_progress note