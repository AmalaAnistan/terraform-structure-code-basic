output "instance_id" {
  value       = aws_instance.app_server.id
  description = "AWS EC2 instance ID"
}

output "instance_public" {
  value       = aws_eip_association.eio_allpcation.public_ip
  description = "AWS EC2 instance public access"
}
