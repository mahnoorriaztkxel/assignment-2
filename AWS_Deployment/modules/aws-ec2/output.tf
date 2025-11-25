
output "key_name" {
  value = aws_key_pair.generated_key.key_name
}

output "private_key_path" {
  value = local_file.private_key_pem.filename
}
output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}