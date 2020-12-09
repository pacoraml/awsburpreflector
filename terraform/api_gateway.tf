resource "aws_apigatewayv2_api" "http-api" {
  name          = "http-api"
  protocol_type = "HTTP"

  tags = {
    project = local.serviceName
  }

}


resource "aws_apigatewayv2_api" "websocket-api" {
  name                       = "websocket-api"
  protocol_type              = "WEBSOCKET"
  route_selection_expression = "$request.body.action"
  target                     = "AWS_PROXY"

  tags = {
    project = local.serviceName
  }
}