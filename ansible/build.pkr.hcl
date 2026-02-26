
build {
  name = "servers-ami"

  sources = [
    "source.amazon-ebs.ansible_server_ubuntu"
  ]


  provisioner "shell" {
    script = "scripts/base_setup.sh"
  }

  provisioner "shell" {
    script = "scripts/install_ansible.sh"
  }
}