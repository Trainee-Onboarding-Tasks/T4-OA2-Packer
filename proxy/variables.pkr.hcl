
variable "region" {
  description = "AWS region where AMI will be created"
  type        = string
  default     = "us-east-1"
}


variable "instance_type" {
  description = "EC2 instance type used for building the AMI"
  type        = string
  default     = "t3.medium"
}
