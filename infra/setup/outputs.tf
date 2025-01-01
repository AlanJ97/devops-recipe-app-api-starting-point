output "cd_user_access_key_id" {
  description = "value of the access key id for the CD user"
  value       = aws_iam_access_key.cd.id

}
output "cd_user_access_key_secret" {
  description = "value of the access key secret for the CD user"
  value       = aws_iam_access_key.cd.secret
  sensitive   = true
}