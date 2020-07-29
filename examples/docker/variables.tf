#     __      __        _       _     _           
#     \ \    / /       (_)     | |   | |          
#      \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___ 
#       \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __|
#        \  / (_| | |  | | (_| | |_) | |  __/\__ \
#         \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/

variable "name" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t2.medium" # Minimum for Docker
}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16" # 65,531 (65,536 possible - 5 reserved by AWS) 
}