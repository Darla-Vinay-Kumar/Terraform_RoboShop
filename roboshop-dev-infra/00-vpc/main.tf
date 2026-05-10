module "vpc" {
    #source = "../../terraform-aws-vpc"
    source = "C:/Users/VINAY KUMAR/Repos/Terraform/Terraform/terraform-aws-vpc"
    #vpc_cidr = "10.0.0.0/16"
    #project_name = "roboshop"
    #environment = "dev"
    vpc_cidr = var.vpc_cidr
    project_name = var.project-name
    environment = var.environment  
    vpc_tags = var.vpc_tags
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs

    #create_peering = false
}
