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
## Dyanamics Block (For_each, Count)
### 1. Count syntex is 
### In main-ec2.tf file
 * # EC2 Instance
   * resource "aws_instance" "my_instance" {
     * count = 2 # meta argumrnt
     * ami             = var.ec2_ami_id
     * instance_type   = var.ec2_instance_type
     * Remembered This: Used Of "count = 2"
 ### NOTE:- This syntax is Used for multiple instances, multiple vpc, s3-bucket and lost of things in AWS.

### In outputs.tf file changes in is
 * output "ec2_public_ip" {
   * value = aws_instance.my_instance[*].public_ip
   * }
* Remembered This:- Used of hastrics [*]

### 2. for_each Syntax is
* resource "azurerm_resource_group" "rg" {
  * for_each = tomap({
    * a_group       = "eastus"
    * another_group = "westus2"
  * })
  * name     = each.key
  * location = each.value
* }
### NOTE: This syntax is used for changing name of instances.

### Used Example:
### Changes in main-ec2.tf
# EC2 Instance
* resource "aws_instance" "my_instance" {
  * for_each = tomap({
    * terraform-automate-micro="t2.micro"
    * terraform-automate-medium="t2.medium"
* }) # meta arguments
  * ami             = var.ec2_ami_id
  * instance_type   = each.value
  * key_name        = aws_key_pair.my_key.key_name
  * vpc_security_group_ids = [aws_security_group.my_security_group.id]

  * root_block_device {
    * volume_size = var.ec2_root_storage_size
    * volume_type = "gp3"
  * }

  * tags = {
    * Name = each.key
  * }
* }

### Chnages in outputs.tf syntax is
* output "ec2_public_ip" {
 * value = {
   * for key, instance in aws_instance.my_instance : key => instance.public_ip
  * }
* }

## Conditional Expressions:- (if_else (cinditions))
### Create on variable.tf syntax is:-
* Add this line in file
* Enviroment Variable
* variable "env" {
  * default = "dev"
  * type = string
* }
### Changes in maine-ec2.tf
* Add this syntax in one line:-
* root_block_device {
    * volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage_size
    * volume_type = "gp3"
  * }

  
