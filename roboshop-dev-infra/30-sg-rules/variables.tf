variable "project_name" {
    type = string
    default = "ROBOSHOP"
}

variable "environment" {
    type = string
    default = "DEV"
}

variable "sg_names" {
    default = [
        #databases
        "mongodb","redis","mysql","rabbitmq",
        #backend
        "catalogue","user","cart","shipping","payment",
        #frontend
        "frontend",
        #bastion
        "bastion",
        #forntend-loadbalancer
        "frontend-lb",
        #backend load balancer
        "backend_lb"
        ]
}