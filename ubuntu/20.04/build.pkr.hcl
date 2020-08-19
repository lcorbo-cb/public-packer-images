build {
    sources = [
        "source.virtualbox-iso.workstation"
    ]

    provisioner "shell" {

        environment_vars = [
          "HOME_DIR=/home/vagrant"
        ]

        execute_command = "echo 'vagrant' | {{.Vars}} sudo -S -E sh -eux '{{.Path }}'"
        expect_disconnect = true
        
        scripts = [
          "scripts/update.sh",
          "scripts/motd.sh",
          "scripts/sshd.sh",
          "scripts/networking.sh",
          "scripts/sudoers.sh",
          "scripts/vagrant.sh",
          "scripts/virtualbox.sh",
          "scripts/cleanup.sh",
          "scripts/minimize.sh"
        ]
    }

    post-processors {
        post-processor "vagrant" {
            output = "${var.build_directory}/${var.box_basename}.{{.Provider}}.box"
        }

        post-processor "vagrant-cloud" {
            box_tag = "corbolj/ubuntu-20.04"
            version = var.version
        }
    }
}
