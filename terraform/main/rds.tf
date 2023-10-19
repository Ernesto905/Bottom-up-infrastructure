// Config secrets
data "aws_secretsmanager_secret" "password" {
  name = "db-password"

}

data "aws_secretsmanager_secret_version" "password" {
  secret_id = data.aws_secretsmanager_secret.password.id
}

// Database  
module "rds" {
  source = "terraform-aws-modules/rds/aws"
  version = "6.1.1"

  identifier = local.db_name 
  engine               = "postgres"
  engine_version       = "15"
  family               = "postgres15" # DB parameter group
  major_engine_version = "15"         # DB option group
  instance_class       = "db.m5d.large"

  allocated_storage     = 100 
  max_allocated_storage = 100 

  username = "dbadmin"
  password = data.aws_secretsmanager_secret_version.password.id
}
