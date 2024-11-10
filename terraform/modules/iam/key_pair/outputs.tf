output "private_key" {
  value = tls_private_key.private_key.private_key_pem
  sensitive = true  
}

output "key_name" {
  value = aws_key_pair.aws_key.key_name
  sensitive = true  
}
