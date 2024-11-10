##########################################################
# Recipe
##########################################################
resource "aws_imagebuilder_image_recipe" "golden_image" {
  block_device_mapping {
    device_name = "/dev/xvdb"

    ebs {
      delete_on_termination = true
      volume_size           = 20
      volume_type           = "gp3"
    }
  }

  # Dynamic block to handle multiple components
  dynamic "component" {
    for_each = toset([
      aws_imagebuilder_component.os_update.arn,
      aws_imagebuilder_component.install_cloudwatch_agent.arn
    ])  # List of ARNs of components
    content {
      component_arn = component.value
    }
  }

  name              = var.recipe_name
  parent_image      = "arn:${var.aws_partition_current}:imagebuilder:${var.aws_region_current}:aws:image/amazon-linux-2023-x86-64"
  version           = var.recipe_version
  working_directory = "/tmp"
}