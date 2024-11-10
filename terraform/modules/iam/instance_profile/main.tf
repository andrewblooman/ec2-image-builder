##########################################################
# Instance Profile
##########################################################

resource "aws_iam_instance_profile" "golden_image" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.golden_image.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "ec2.amazonaws.com",
        "imagebuilder.amazonaws.com"
      ]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "golden_image" {
  name               = var.role_name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "golden_image_policy" {
  role       = aws_iam_role.golden_image.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ImageBuilderFullAccess"
}