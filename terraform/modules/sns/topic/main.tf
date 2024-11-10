##########################################################
# SNS Topic
##########################################################

resource "aws_sns_topic" "image_builder_notifications" {
  name = var.sns_topic_name
}


data "aws_iam_policy_document" "sns_topic_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["imagebuilder.amazonaws.com"]
    }

    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.image_builder_notifications.arn]
  }
}

resource "aws_sns_topic_policy" "image_builder_topic_policy" {
  arn    = aws_sns_topic.image_builder_notifications.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}