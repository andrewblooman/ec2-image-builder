/*terraform {
  backend "s3" {
    bucket         = "medium-example-terraform-state-test"
    key            = "terraform/test/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
*/