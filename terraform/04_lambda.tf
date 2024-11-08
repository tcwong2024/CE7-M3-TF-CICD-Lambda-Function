# Zip the lambda file
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "./files/${var.lambda_file_name}.py"
  output_path = "./files/${var.lambda_file_name}.zip"
}

# Setup Lambda function
resource "aws_lambda_function" "own_lambda" {
  function_name    = var.lambda_function_name
  handler          = "${var.lambda_file_name}.lambda_handler"
  runtime          = "python3.10"
  role             = aws_iam_role.iam_for_lambda.arn
  filename         = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256
}

# Apply IAM assume role policy
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Apply IAM inline_policy_cloudwatch policy
data "aws_iam_policy_document" "inline_policy_cloudwatch" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["arn:aws:logs:us-east-1:255945442255:log-group:/aws/lambda/${var.lambda_function_name}:*"]
  }
}

# iam role for lambda
resource "aws_iam_role" "iam_for_lambda" {
  name               = var.iam_lambda_role
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# IAM cloudwatch policy
resource "aws_iam_role_policy" "policy_cloudwatch" {
  name   = var.iam_cloudwatch_policy
  role   = aws_iam_role.iam_for_lambda.id
  policy = data.aws_iam_policy_document.inline_policy_cloudwatch.json
}
