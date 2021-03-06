#cloud-config
package_update: false
package_upgrade: false
locale: en_US.UTF-8
timezone: America/Los_Angelos
final_message: ${hostname} is finally up after $UPTIME at $TIMESTAMP
manage_etc_hosts: true
preserve_hostname: false
fqdn: ${hostname}.${domainName}
hostname: ${hostname}

users:
  - default

system_info:
  distro: ubuntu
  default_user:
    name: ops
    passwd: $6$QwM7oc3p$TfPrrnIJO7ff72AXTcI7h3Y7xlDV8OSEmznjyQDck7joC9T8mEgqvhYQB7c1ADrKjpB5OH6tfhPFoRA2O9yGo1
    lock_passwd: false
    gecos: opts
    groups:
      - adm
      - audio
      - cdrom
      - dialout
      - dip
      - floppy
      - lxd
      - netdev
      - plugdev
      - sudo
      - video
    sudo: 'ALL=(ALL) NOPASSWD:ALL'
    shell: /bin/bash
    ssh_authorized_keys:
      - ${sshKey}

cloud_init_modules:
  - migrator
  - seed_random
  - bootcmd
  - write-files
  - growpart
  - resizefs
  - disk_setup
  - mounts
  - set_hostname
  - update_hostname
  - update_etc_hosts
  - ca-certs
  - rsyslog
  - users-groups
  - ssh

cloud_config_modules:
  - emit_upstart
  - snap
  - ssh-import-id
  - locale
  - set-passwords
  - grub-dpkg
  - apt-pipelining
  - apt-configure
  - ntp
  - timezone
  - runcmd
  - byobu

cloud_final_modules:
  - package-update-upgrade-install
  - fan
  - lxd
  - ubuntu-drivers
  - rightscale_userdata
  - scripts-vendor
  - scripts-per-once
  - scripts-per-boot
  - scripts-per-instance
  - scripts-user
  - ssh-authkey-fingerprints
  - keys-to-console
  - phone-home
  - final-message
  - power-state-change
