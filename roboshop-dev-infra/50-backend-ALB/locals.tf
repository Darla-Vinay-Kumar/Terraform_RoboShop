locals {
    common_name_suffix ="${var.project_name}-${var.environment}"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    backend_lb_sg_id = data.aws_ssm_parameter.backend_lb_sg_id.value
    public_subnets_ids = split("," , data.aws_ssm_parameter.public_subnet_ids.value)
    private_subnets_ids = split("," , data.aws_ssm_parameter.private_subnet_ids.value)
    common_tags = {
        project = var.project_name
        Environment = var.environment
        Terraform = "true"
    }
}