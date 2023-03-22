output "publics1" {
   description =  "red publica1"
   value       = data.aws_subnets.publics.ids.0
 }

output "publics2" {
   description =  "red publica2"
   value       = data.aws_subnets.publics.ids.1
 }
