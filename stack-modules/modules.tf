module "network" {
  source = "./Modules/network"
  PROJECT_NAME  = var.PROJECT_NAME
  PROJECT_ENV   = var.PROJECT_ENV
  VPC_CIDR      = var.VPC_CIDR
  AZ            = var.AZ
 
}