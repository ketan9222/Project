resource "aws_vpc" "dpp-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "dpp-vpc"
  }
}

resource "aws_subnet" "dpp-public-sn-1" {
  vpc_id     = aws_vpc.dpp-vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "dpp-public-sn-2" {
  vpc_id     = aws_vpc.dpp-vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "public-subnet-2"
  }
}

resource "aws_subnet" "dpp-public-sn-3" {
  vpc_id     = aws_vpc.dpp-vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-south-1c"

  tags = {
    Name = "public-subnet-2"
  }
}


resource "aws_internet_gateway" "dpp-igw" {
  vpc_id = aws_vpc.dpp-vpc.id

  tags = {
    Name = "dpp-igw"
  }
}


resource "aws_route_table" "dpp-public-rt" {
  vpc_id = aws_vpc.dpp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dpp-igw.id
  }
}

resource "aws_route_table_association" "dpp-rta-public-sn-1" {
  subnet_id      = aws_subnet.dpp-public-sn-1.id
  route_table_id = aws_route_table.dpp-public-rt.id
}
resource "aws_route_table_association" "dpp-rta-public-sn-2" {
  subnet_id      = aws_subnet.dpp-public-sn-2.id
  route_table_id = aws_route_table.dpp-public-rt.id
}

resource "aws_route_table_association" "dpp-rta-public-sn-3" {
  subnet_id      = aws_subnet.dpp-public-sn-3.id
  route_table_id = aws_route_table.dpp-public-rt.id
}
