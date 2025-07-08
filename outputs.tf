output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.start_up_vpc.id
}

output "subnet_id" {
  description = "ID of the subnet"
  value       = aws_subnet.start_up_subnet.id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.start_up_sg.id
}

output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.start_up_instance[*].public_ip
}

output "private_key_path" {
  description = "Path to the generated private key file"
  value       = local_file.start_up_key.filename
}

output "key_pair_name" {
  description = "Name of the AWS key pair"
  value       = aws_key_pair.start_up_key.key_name
}
