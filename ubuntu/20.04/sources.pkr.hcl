source "virtualbox-iso" "workstation" {

  boot_command = [
    "<esc><wait>",
    "<esc><wait>",
    "<enter><wait>",
    "/install/vmlinuz<wait>",
    " auto<wait>",
    " console-setup/ask_detect=false<wait>",
    " console-setup/layoutcode=us<wait>",
    " console-setup/modelcode=pc105<wait>",
    " debconf/frontend=noninteractive<wait>",
    " debian-installer=en_US.UTF-8<wait>",
    " fb=false<wait>",
    " initrd=/install/initrd.gz<wait>",
    " kbd-chooser/method=us<wait>",
    " keyboard-configuration/layout=USA<wait>",
    " keyboard-configuration/variant=USA<wait>",
    " locale=en_US.UTF-8<wait>",
    " netcfg/get_domain=vm<wait>",
    " netcfg/get_hostname=vagrant<wait>",
    " grub-installer/bootdev=/dev/sda<wait>",
    " noapic<wait>",
    " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_path}<wait>",
    " -- <wait>",
    "<enter><wait>"
  ]

  boot_wait = "10s"
  cpus = var.cpus
  disk_size = var.disk_size
  guest_additions_url = var.guest_additions_url
  guest_additions_path = "VBoxGuestAdditions_{{.Version}}.iso"
  guest_os_type = "Ubuntu_64"
  hard_drive_interface = "sata"
  headless = var.headless
  http_directory = "http"
  iso_checksum = var.iso_checksum
  iso_url = "${var.mirror}/${var.mirror_directory}/${var.iso_name}"
  output_directory = "${var.build_directory}/packer-${var.template}-virtualbox"
  shutdown_command = "echo 'vagrant' | sudo -S shutdown -P now"
  ssh_password = "vagrant"
  ssh_port = 22
  ssh_username = "vagrant"
  ssh_wait_timeout = "10000s"
  memory = var.memory
  virtualbox_version_file = ".vbox_version"
  vm_name = var.template
}
