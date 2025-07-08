terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create the VPC
resource "aws_vpc" "start_up_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "start-up-vpc"
  }
}

# Create the Subnet
resource "aws_subnet" "start_up_subnet" {
  vpc_id            = aws_vpc.start_up_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "start-up-subnet"
  }
}

# Create the Internet Gateway
resource "aws_internet_gateway" "start_up_igw" {
  vpc_id = aws_vpc.start_up_vpc.id
  tags = {
    Name = "start-up-igw"
  }
}

# Create the Route Table
resource "aws_route_table" "start_up_route_table" {
  vpc_id = aws_vpc.start_up_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.start_up_igw.id
  }

  tags = {
    Name = "start-up-route-table"
  }
}

# Associate Route Table with Subnet
resource "aws_route_table_association" "start_up_subnet_assoc" {
  subnet_id      = aws_subnet.start_up_subnet.id
  route_table_id = aws_route_table.start_up_route_table.id
} 
