#       _____                      _ _         
#      / ____|                    (_) |        
#     | (___   ___  ___ _   _ _ __ _| |_ _   _ 
#      \___ \ / _ \/ __| | | | '__| | __| | | |
#      ____) |  __/ (__| |_| | |  | | |_| |_| |
#     |_____/ \___|\___|\__,_|_|  |_|\__|\__, |
#            _____                        __/ |
#           / ____|                      |___/ 
#          | |  __ _ __ ___  _   _ _ __  
#          | | |_ | '__/ _ \| | | | '_ \ 
#          | |__| | | | (_) | |_| | |_) |
#           \_____|_|  \___/ \__,_| .__/ 
#                                 | |    
#                                 |_|     

#resource "aws_security_group" "allow-ssh" {
module "allow-ssh" {

  source = "./../../../terraform-aws-security-group"
  #source = "jason-morsley/security-group/aws"

  name = "docker"
  description = "To allow SSH"

  vpc_id = module.docker-vpc.id
  
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [local.all_cidr_block]
  security_group_id = module.allow-ssh.id
}

resource "aws_security_group_rule" "allow_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = [local.all_cidr_block]
  security_group_id = module.allow-ssh.id
}

/*  ingress = [{
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [ local.all_cidr_block ]
  }]

  egress = [{
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ local.all_cidr_block ]
  }]*/
  