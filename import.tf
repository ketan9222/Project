resource "aws_instance" "import" {
  ami                     = "ami-06f621d90fa29f6d0"
  instance_type            = "t2.micro"
}