terraform {
  backend "s3" {
    bucket = "sctp-ce7-tfstate"
    key    = "ce7-grp-2-wtc-tf-lambda.tfstate"
    region = "us-east-1"

  }
}