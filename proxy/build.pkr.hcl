
build {
  name = "servers-ami"

  sources = [
    "source.amazon-ebs.proxy_server_ubuntu"
  ]


  provisioner "shell" {
    script = "scripts/base_setup.sh"
  }

  provisioner "shell" {
    script = "scripts/install_docker.sh"
    execute_command = "sudo -E bash '{{ .Path }}'"
  }
}