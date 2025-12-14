
# output "basic" {
#   value = data.aws_connect_routing_profile.basic
# }

# output "admin" {
#   value = data.aws_connect_security_profile.admin
# }

# output "admin_user_id" {
#   value = data.external.admin_user.result.user_id
# }

output "connect_instance_id" {
  value = aws_connect_instance.test.id
}

output "connect_instance_alias" {
  value = aws_connect_instance.test.instance_alias
}

output "connect_console_url" {
  value = "https://${aws_connect_instance.test.instance_alias}.my.connect.aws/"
}

output "default_outbound_queue_id" {
  value = data.aws_connect_contact_flow.default_outbound.id
}

output "queue_id" {
  value = data.aws_connect_queue.basic_queue.queue_id
}

output "my_queue_arn" {
  value = aws_connect_queue.test.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.connect_function.function_name
}


output "connect_instance_arn" {
  value = aws_connect_instance.test.arn
}
