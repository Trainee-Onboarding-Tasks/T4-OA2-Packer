
build {
  name = "ansible-server-ami"

  sources = [
    "source.amazon-ebs.ansible_server_ubuntu"
  ]


  provisioner "shell" {
    script          = "scripts/base_setup.sh"
    execute_command = "sudo -E bash '{{ .Path }}'"
  }

  provisioner "shell" {
    script          = "scripts/install_ansible.sh"
    execute_command = "sudo -E bash '{{ .Path }}'"
  }
}
