locals {
  # EKS
  name   = "bottoms-up-cluster"
  region = "us-east-1"

  tags = {
    cluster_name = local.name
  }
  
  # VPC 
  vpc_cidr = "10.123.0.0/16"
  azs      = ["us-east-1a", "us-east-1b", "us-east-1c"]

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24"] 
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24", "10.123.7.0/24", "10.123.8.0/24"]

  # RDS
}
