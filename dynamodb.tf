resource "aws_dynamodb_table" "Basic_dynamodb-table" {
  name           = "dynamodb-terra-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"
  

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name = "dynamodb-terra-table"
  }
}
