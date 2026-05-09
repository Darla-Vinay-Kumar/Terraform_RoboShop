resource "aws_lb" "backend_alb" {
    name = "${local.common_name_suffix}-backend-alb"
    internal = true
    load_balancer_type = "application"
    security_groups = [local.backend_lb_sg_id]
    subnets = local.private_subnets_ids
    enable_deletion_protection = false #prevents accidental deletion of ALB
    tags = merge(
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-Backend-ALB"
        }
    )
}
#backend Alb listening on port 80 and returning fixed response for now, later we will change it to forward traffic to target group
resource "aws_lb_listener" "backend_alb_listener" {
    load_balancer_arn = aws_lb.backend_alb.arn # arn means Amazon Resource Name, it is a unique identifier for AWS resources
    port = 80
    protocol = "HTTP"
    default_action {
        type = "fixed-response"

        fixed_response {
            content_type = "text/plain"
            message_body = "fixed response content for Hi iam from backend ALB HTTP listener"
            status_code = 200
        }
    }
}