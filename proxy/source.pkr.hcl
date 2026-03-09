
source "amazon-ebs" "proxy_server_ubuntu" {
  ami_description = "Minimal Ubuntu Image for Proxy Server"
  ami_name        = "servers-ubuntu-{{timestamp}}"
  profile         = var.aws_profile
  instance_type   = var.instance_type
  region          = var.region


  source_ami_filter {
    filters = {
      name                = "ubuntu-minimal/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-minimal-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }

    most_recent = true
    owners      = ["099720109477"]
  }

  ssh_username = "ubuntu"


  tags = {
    "Name" = "Proxy Server"
  }
}
