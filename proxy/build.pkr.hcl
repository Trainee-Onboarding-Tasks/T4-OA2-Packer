
build {
  name = "proxy-server-ami"

  sources = [
    "source.amazon-ebs.proxy_server_ubuntu"
  ]


  provisioner "shell" {
    script          = "scripts/base_setup.sh"
    execute_command = "sudo -E bash '{{ .Path }}'"
  }

  provisioner "shell" {
    script          = "scripts/install_docker.sh"
    execute_command = "sudo -E bash '{{ .Path }}'"
  }

  provisioner "shell" {
    script           = "scripts/start_services.sh"
    execute_command  = "sudo -E bash '{{ .Path }}'"
    environment_vars = [
      "AWS_REGION=${var.region}" 
    ]
  }
}
