resource "aws_instance" "web" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"

    tags = {
        Name = "Hello Terraform"
    }
  
}

resource "aws_security_group" "roboshop_all" {
  name        = "roboshop-all-aws"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id

  tags = {
    Name = "roboshop_all_aws-1"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_roboshop_all_ipv4" {
  security_group_id = aws_security_group.roboshop_all.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 0
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.roboshop_all.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"

}
