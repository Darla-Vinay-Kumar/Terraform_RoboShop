# module "cataloguue" {
#     source = "terraform-aws-modules/security-group/aws"
#     name = "${local.common_name_suffix}-scatalogue-sg"
#     description = "Security group for catalogue service"
#     vpc_id = data.aws_ssm_parameter.vpc_id.value
#     use_name_prefix = false

# }
module "sg" {
    count = length(var.sg_names)
    #source = "../../terraform-aws-sg"
    source  = "git::https://github.com/Darla-Vinay-Kumar/Terraform_AWS_SG.git//terraform-aws-sg?ref=main"
    project_name = var.project_name
    environment = var.environment
    sg_name = var.sg_names[count.index]
    sg_description = "created for ${var.sg_names[count.index]}"
    vpc_id = local.vpc_id
}

# resource "aws_security_group_rule" "frontend_from_frontend_ALB" {
#     type = "ingress"
#     security_group_id = module.sg[9].sg_id
#     source_security_group_id = module.sg[11].sg_id
#     from_port =80
#     protocol = "tcp"
#     to_port = 80
# }


