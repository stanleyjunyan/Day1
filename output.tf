output "Private_IP" {
  description = "private ip for the ssh terminal"
  value       = toset([
    for vminfo in aws_instance.stanley-web : vminfo.private_ip
  ])
}

output "private" {
  description = "This is the private ip for the SSH terminal"
  value       = aws_instance.stanley-web[*].private_ip
}