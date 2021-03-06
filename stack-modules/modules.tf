module "network" {
  source                = "./Modules/network"
  PROJECT_NAME          = var.PROJECT_NAME
  PROJECT_ENV           = var.PROJECT_ENV
  VPC_CIDR              = var.VPC_CIDR
  AZ                    = var.AZ 
}

module "database" {
  source                = "./Modules/database"
  DB_SIZE               =  var.DB_SIZE
  DB_ENGINE             =  var.DB_ENGINE
  DB_ENGINE_VERSION     =  var.DB_ENGINE_VERSION
  NEED_FINAL_SNAPSHOT   =  var.NEED_FINAL_SNAPSHOT
  DB_USER               =  var.DB_USER
  DB_NAME               =  var.DB_NAME
  DB_PASS               =  var.DB_PASS
  DB_INSTANCE           =  var.DB_INSTANCE
  PRIVATE_SUBNETS       = module.network.private-subnets
  PROJECT_NAME          = var.PROJECT_NAME
  PROJECT_ENV           = var.PROJECT_ENV
  VPC_CIDR              = var.VPC_CIDR
  VPC_ID                = module.network.studentapp_vpcid
  DEFAULT_VPC_CIDR      = module.network.default_vpc_cidr
}

module "infra" {
  source                = "./Modules/infrastructure"
  PROJECT_NAME          = var.PROJECT_NAME
  PROJECT_ENV           = var.PROJECT_ENV
  VPC_CIDR              = var.VPC_CIDR
  INSTANCE_TYPE         = var.INSTANCE_TYPE
  INSTANCE_COUNT        = var.INSTANCE_COUNT
  KEYPAIR_NAME          = var.KEYPAIR_NAME
  PUBLIC_SUBNETS        = module.network.public-subnets
  VPC_ID                = module.network.studentapp_vpcid
  DEFAULT_VPC_CIDR      = module.network.default_vpc_cidr
  DB_USER               =  var.DB_USER
  DB_NAME               =  var.DB_NAME
  DB_PASS               =  var.DB_PASS
  DB_HOST               = module.database.rds_endpoint
  AZ                    = var.AZ

}