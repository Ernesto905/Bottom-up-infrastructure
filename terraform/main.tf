provider "aws" {
  region = local.region 
}

locals {
  name   = "bottoms-up-cluster"
  region = "us-east-1"

  vpc_cidr = "10.123.0.0/16"
  azs      = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]

  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24", "10.0.104.0/24"]
  intra_subnets   = ["10.123.5.0/24", "10.123.6.0/24", "10.123.7.0/24", "10.123.8.0/24"]

  tags = {
    # Example = local.name
  }
}





