provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Environment = "Test"
      Owner       = "Security Team"
      Project     = "Golden Image Pipeline"
    }
  }
}