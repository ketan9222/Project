resource "aws_instance" "demo-server" {
  ami                     = "ami-0f5ee92e2d63afc18"
  instance_type            = "t3.micro"
  key_name =                    "terraform"
  count = 4
  subnet_id = aws_subnet.dpp-public-sn-3.id
  security_groups = ["allow_SSH"]
}