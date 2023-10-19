module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.1"

  cluster_name                   = local.name
  cluster_endpoint_public_access = false 

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      resolve_conflicts        = "OVERWRITE" 
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  # subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["m5.large"]

    attach_cluster_primary_security_group = true
  }

  eks_managed_node_groups = {
    red_blue = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
      subnet_ids = [module.vpc.private_subnets[0]] 

      instance_types = ["t3.small"]
      capacity_type  = "SPOT"

      tags = {
        node_group_name = "Red and Blue"
      }
    }

    black_white = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
      subnet_ids = [module.vpc.private_subnets[1]] 


      instance_types = ["t3.small"]
      capacity_type  = "SPOT"

      tags = {
        node_group_name = "Black and White"
      }
    }

  }

  tags = local.tags
}
