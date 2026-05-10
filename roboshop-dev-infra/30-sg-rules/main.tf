# backend load balancer accepting traffic from bastion
resource "aws_security_group_rule" "backend_lb_from_bastion" {
    type = "ingress"
    security_group_id = local.backend_lb_sg_id
    source_security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
    from_port =80
    protocol = "tcp"
    to_port = 80
}
# bastion allowing from laptop to access backend load balancer
resource "aws_security_group_rule" "bastion_from_laptop" {
    type = "ingress"
    security_group_id = data.aws_ssm_parameter.bastion_sg_id.value
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    protocol = "tcp"
    to_port = 22
}
# mongodb accepting traffic from bastion
resource "aws_security_group_rule" "mongodb_from_bastion" {
    type = "ingress"
    security_group_id = local.mongodb_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
}
# redis accepting traffic from bastion
resource "aws_security_group_rule" "redis_from_bastion" {
    type = "ingress"
    security_group_id = local.redis_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
}
# rabbitmq accepting traffic from bastion
resource "aws_security_group_rule" "rabbitmq_from_bastion" {
    type = "ingress"
    security_group_id = local.rabbitmq_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
}
# mysql accepting traffic from bastion
resource "aws_security_group_rule" "mysql_from_bastion" {
    type = "ingress"
    security_group_id = local.mysql_sg_id
    source_security_group_id = local.bastion_sg_id
    from_port = 22
    protocol = "tcp"
    to_port = 22
}

