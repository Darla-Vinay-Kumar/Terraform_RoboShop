locals {
    backend_lb_sg_id = data.aws_ssm_parameter.backend_lb_sg_id.value
    bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
}