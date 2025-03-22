variable sg-name {
    type = string
    default = "roboshop_all_aws"
}

variable sg_description {
    type = string
    default = "allows all roboshop inbound and outbound traffic"
}

variable inbound_from_port {
    type = number
    default = 0
}

variable cidr_block{
    type = string
    default = "0.0.0.0/0"
}
