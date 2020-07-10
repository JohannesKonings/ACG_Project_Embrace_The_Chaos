# ACG_Project_Embrace_The_Chaos

## Cloudformation

creation

```sh
aws cloudformation deploy \
--template-file EC2_cloudformation.yaml \
--stack-name EC2-chaos-admin
```

deletion

```sh
aws cloudformation delete-stack --stack-name EC2-chaos-admin
```

## terraform

```sh
terraform init
```
```sh
terraform plan
```
```sh
terraform apply
```
```sh
terraform destroy
```