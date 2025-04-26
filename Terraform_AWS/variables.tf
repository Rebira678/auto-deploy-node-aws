variable "access_key" {}
variable "secret_key" {}

# Default AWS region
variable "region" {
  default = "us-east-1"
}

# Ubuntu AMI ID for your region
variable "ami" {
  default = "ami-0c02fb55956c7d316"
}

# EC2 instance type
variable "instance_type" {
  default = "t2.micro"
}
