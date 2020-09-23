PROJECT_NAME = "Studentapp"
PROJECT_ENV = "Dev"
VPC_CIDR = "10.0.0.0/21"
AZ = ["us-east-1c","us-east-1d","us-east-1e","us-east-1f"]

#DB PARAMETERS
DB_SIZE             = 10
DB_ENGINE           = "mariadb"
DB_ENGINE_VERSION   = 10.4
# IN DEV , I DONT NEED FINAL SNAPSHOT, BUT IN PROD REQ, HENCE NOT HARDCODING
NEED_FINAL_SNAPSHOT = false
DB_USER             = "student"
DB_NAME             = "studentapp"
DB_PASS             = "student1"
DB_INSTANCE         = "db.t2.micro"

#INFRA PARAMETERS

INSTANCE_TYPE       = "t2.micro"
INSTANCE_COUNT      = 1
KEYPAIR_NAME        = "key_28042020"
