provider "aws" { }

variable "subnet_cidr_block" {
  description = "subnet cidr block"
  default = "10.0.10.0/24"
}


resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {      
        Name: "development"
    }
  }
  

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "ap-south-1a"
  tags = {
    Name: "dev-subnet-1"
  }
}

output "dev-vpc" {
  value = aws_vpc.development-vpc.id
}

output "dev-subnet" {
  value = aws_subnet.dev-subnet-1.id
}