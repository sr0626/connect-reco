

resource "aws_iam_role" "lambda_exec_role" {
  name = "Connect-Logs-Lambda-Role"
  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Action" : "sts:AssumeRole",
          "Principal" : {
            "Service" : "lambda.amazonaws.com"
          },
          "Effect" : "Allow",
          "Sid" : "LambdaRole"
        }
      ]
    }
  )
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "Connect-Logs-Lambda-Policy"
  role = aws_iam_role.lambda_exec_role.id
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Resource" : "*"
        },
        {
          "Effect" : "Allow",
          "Action" : [
            "connect:ListQueues"
          ],
          "Resource" : "*"
        }
      ]
    }
  )
}

# resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
#   policy_arn = aws_iam_role_policy.lambda_policy.arn
#   role = aws_iam_role.lambda.id
# }

resource "aws_lambda_function" "connect_function" {
  function_name    = "${var.instance_alias}-function"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "dob_appender.lambda_handler"
  runtime          = "python3.12"
  filename         = data.archive_file.connect_function_zip.output_path
  source_code_hash = data.archive_file.connect_function_zip.output_base64sha256
  timeout          = 30

  environment {
    variables = {
      CONNECT_INSTANCE_ID = "${aws_connect_instance.test.id}"
      #REGION = "${data.aws_region.current}"
    }
  }
}

data "archive_file" "connect_function_zip" {
  type        = "zip"
  output_path = "${path.module}/function.zip"
  source_dir  = "${path.module}/functions"
}

resource "aws_lambda_permission" "allow_connect_invoke" {
  statement_id  = "AllowConnectInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.connect_function.function_name
  principal     = "connect.amazonaws.com"
  source_arn    = aws_connect_instance.test.arn
  # If your flow references an ALIAS (e.g., "prod"), add:
  # qualifier   = "prod"
}