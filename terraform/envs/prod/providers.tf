provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Environment = "prod"
      Owner       = "team-name"
      Project     = "project-name"
    }
  }
}