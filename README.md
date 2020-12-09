# Burp Reflector Infra

Deploy lambdas, apigateway using websocket and HTTP and DynamoDB 

## Usage

```
git clone xxxx/terraform
```

Blau

```
cd terraform
zip example.zip main.js
```

Requirements
```
awscli
docker
```

Usage

```
cd ../terraform
export AWS_ACCESS_KEY_ID=xxxxx
export AWS_SECRET_ACCESS_KEY=xxxxx
docker run --rm hashicorp/terraform init
docker run --rm hashicorp/terraform plan -out tf.plan
docker run --rm hashicorp/terraform apply "tf.plan"
```

Blau Destroy

```
docker run --rm hashicorp/terraform destroy
```
