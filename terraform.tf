terraform {
  backend "s3" {
    bucket         = "vikram-terraform-state-freetier"
    key            = "infra/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}

