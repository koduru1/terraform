resource "aws_instance" "web" {
    ami = "ami-0b4f379183e5706b9"
    instance_type = "t2.micro"

    tags = {
        Name = "Hello Terraform"
    }
  
}

resource "aws_security_group" "roboshop_all" {
    name = var.sg-name
    description = var.sg_description
    #vpc_id      = aws_vpc.main.id

    tags = {
        Name = "roboshop-all_aws_1"
    }
  
}

resource "aws_vpc_security_group_ingress_rule" "allow_roboshop_all_ipv4" {
    security_group_id = aws_security_group.roboshop_all.id
    cidr_ipv4 = var.cidr_block
    from_port = var.inbound_from_port
    to_port = 0
    ip_protocol = "tcp"
  
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffice_ipv4" {
    security_group_id = aws_security_group.roboshop_all.id
    cidr_ipv4 = var.cidr_block
    ip_protocol = "-1"
  
}