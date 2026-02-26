
variable "aws_profile" {
  description = "AWS CLI profile used for authentication"
  type        = string
  default     = "default"
}


variable "instance_type" {
  description = "EC2 instance type to be used for the deployment"
  type        = string
  default     = "t3.micro"
}


variable "region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}
