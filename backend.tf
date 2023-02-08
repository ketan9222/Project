terraform {
  backend "s3" {
    bucket = "ketan32-bucket"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "dynamodb-state-locking"
  }
}
