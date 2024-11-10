##########################################################
# Main
##########################################################

module "ec2_image_builder_pipeline" {
  source                           = "../../modules/ec2_image_builder/pipeline"
  image_pipeline_name              = "Golden Image Pipeline"
  image_recipe_arn                 = module.ec2_image_builder_recipe.image_recipe_arn
  infrastructure_configuration_arn = module.ec2_image_builder_infra_config.arn
}

module "ec2_image_builder_recipe" {
  source                = "../../modules/ec2_image_builder/recipe"
  recipe_name           = "Golden Image Recipe"
  recipe_version        = "1.0.0"
  aws_partition_current = data.aws_partition.current.partition
  aws_region_current    = data.aws_region.current.name
}

module "ec2_image_builder_infra_config" {
  source                = "../../modules/ec2_image_builder/infra_config"
  s3_bucket_name        = module.s3_bucket_logs.bucket_name
  instance_profile_name = module.iam_instance_profile.iam_instance_profile_name
  key_pair              = module.iam_key_pair.key_name
  sns_topic_arn         = module.sns_topic.topic_arn
  subnet_id             = data.aws_subnet.subnet.id
  security_group_ids    = ["${data.aws_security_group.name.id}"]
}

module "iam_instance_profile" {
  source                    = "../../modules/iam/instance_profile"
  iam_instance_profile_name = "golden_image_profile"
  role_name                 = "golden_image_role"
}

module "iam_key_pair" {
  source   = "../../modules/iam/key_pair"
  key_name = "ec2-image-builder"
}

module "s3_bucket_logs" {
  source      = "../../modules/s3/bucket"
  bucket_name = "medium-golden-image-pipeline-logs"
}

module "sns_topic" {
  source         = "../../modules/sns/topic"
  sns_topic_name = "golden_image_pipeline_notifications"
}

##########################################################
# Data
##########################################################

data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = ["common-tooling-subnet-private1-eu-west-1a"]
  }
}

data "aws_security_group" "name" {
  filter {
    name   = "tag:Name"
    values = ["ec2imagebuilder"]
  }
}

data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}