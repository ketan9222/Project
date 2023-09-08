resource "aws_instance" "demo-server" {
  ami                     = "ami-0f5ee92e2d63afc18"
  instance_type            = "t3.micro"
  key_name =                    "terraform"
  for_each 	= toset(["jenkins-master","jenkins-slave","ansible"])
  
#  count = 1
  subnet_id = aws_subnet.dpp-public-sn-3.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
   Name = "${each.key}"
}
}
