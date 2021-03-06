#     __      __  _____     _____
#     \ \    / / |  __ \   / ____|
#      \ \  / /  | |__) | | |     
#       \ \/ /   |  ___/  | |     
#        \  /    | |      | |____
#         \/     |_|       \_____|

module "rke-vpc" {

  source = "./../../../terraform-aws-vpc"
  #source = "jason-morsley/vpc/aws"

  name = local.name

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs = ["10.0.1.0/24"] # 251 (256 possible - 5 reserved by AWS)

  availability_zones = [ data.aws_availability_zones.available.names[0] ]
  
  public_subnet_tags = local.cluster_id_tag
          
}