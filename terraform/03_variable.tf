# region name
variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}

# s3 bucket name
# variable "s3_bucket" {
#   description = "s3 bucket name"
#   type        = string
#   default     = "ce7-grp-2-wtc-s3-bucket"
# }

# lambda function name
variable "lambda_function_name" {
  description = "Name of lambda function"
  type        = string
  default     = "ce7-grp-2-wtc-holidayLambdaFunction"
}

# lambda file name
variable "lambda_file_name" {
  description = "Name of lambda file to be zipped"
  type        = string
  default     = "ce7-grp-2-wtc-tf-lambda"
}

# IAM lambda role
variable "iam_lambda_role" {
  description = "IAM role Name for lambda"
  type        = string
  default     = "ce7-grp-2-wtc-iam-lambda-role"
}

# IAM cloudwatch policy name
variable "iam_cloudwatch_policy" {
  description = "IAM cloudwatch policy name for lambda"
  type        = string
  default     = "ce7-grp-2-wtc-iam-cloudwatch-policy"
}
