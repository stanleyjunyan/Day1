resource "aws_sns_topic" "snstopic" {
  provider = aws.sns
  name     = "stanley-test"
}
