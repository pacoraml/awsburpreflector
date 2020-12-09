resource "aws_lambda_function" "connect" {
  function_name = "connect"
  description = local.DefaultDesc
	filename    = "../lambda-code/connect.zip"
  handler = "Connect.lambda_handler"
  #handler = "main.handler"
  runtime = "python3.8"
  role = aws_iam_role.lambda_exec.arn

  tags = {
    project = local.serviceName
  }

}

resource "aws_apigatewayv2_integration" "lambda-connect" {
  api_id           = aws_apigatewayv2_api.websocket-api.id
  integration_type = "AWS"
  connection_type           = "INTERNET"
  description               = "Lambda connect"
  integration_method        = "POST"
  integration_uri           = aws_lambda_function.connect.invoke_arn
  passthrough_behavior      = "WHEN_NO_MATCH"
}


resource "aws_lambda_function" "disconnect" {
  function_name = "disconnect"
  description = local.DefaultDesc
	filename    = "../lambda-code/disconnect.zip"
  handler = "Disconnect.lambda_handler"
  #handler = "main.handler"
  runtime = "python3.8"
  role = aws_iam_role.lambda_exec.arn
  
  tags = {
    project = local.serviceName
  }

}

resource "aws_lambda_function" "sendmessage" {
  function_name = "sendmessage"
  description = local.DefaultDesc
	filename    = "../lambda-code/sendmessage.zip"
  handler = "Sendmessage.lambda_handler"
  #handler = "main.handler"
  runtime = "python3.8"
  role = aws_iam_role.lambda_exec.arn

  tags = {
    project = local.serviceName
  }

}

# IAM role for Lambda function

resource "aws_iam_role" "lambda_exec" {
  name = "${local.serviceName}-LambdaExecRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}