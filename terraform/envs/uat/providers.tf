provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Environment = "uat"
      Owner       = "team-name"
      Project     = "project-name"
    }
  }
}