# Terraform-Basic-Project
## 1. Install Aws-cli on server and configure with IAM user.
## 2. Create one IAM User and give permission to systems adminstratioons.
## 3. Install Terraform package on your systems.
## 4. Create one directory like ---> terraform-project
## 5. Create AWS-Provider Like:-
  * sudo vim aws-provider.tf
  * Code Of Aws Providers
  * terraform {
    * required_providers {
      * aws = {
        * source = "hashicorp/aws"
        * version = "~> 6.0"
    * }
  * }
* }
  * terraform init ----> For initializing terraform
### Check In Path is ".terraform/providers/registry.terraform.io/hashicorp/"
## Terrform Mian Files & Main Command Is
### Write file in .tf Extension And After That Run Command
### 1. provider.tf ----->
### 2. main.tf -----> like main-s3.tf, main-ec2.tf, main-vpc.tf
### 3. variables.tf -----> you can change value from variable file
### 4. outputs.tf -----> you can see output on your terminals
  * terraform plan
  * terraform apply
  * terraform destroy -auto-approve
