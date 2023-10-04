module "shipping" {
  source = "../../terraform-roboshop-app"
  project_name = var.project_name
  env = var.env
  common_tags = var.common_tags

  #Target Group
  #health_check = var.health_check
  target_group_port = var.target_group_port
  target_group_protocol =var.target_group_protocol
  vpc_id = data.aws_ssm_parameter.vpc_id.value

  #Launch template
  image_id = data.aws_ami.devops_ami.id
  security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
  launch_template_tags = var.launch_template_tags
  user_data = filebase64("${path.module}/shipping.sh")

  #Auto scaling
  vpc_zone_identifier = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
  tag = var.autoscaling_tags

  #Auto Scaling policy, I am good with optional params
  
  #Listener rule
  alb_listener_arn = data.aws_ssm_parameter.app_alb_listener_arn.value
  rule_priority = 40 #Catalogue have already rule number 10 and user have 20 and cart have 30 and now shipping is 40
  host_header = var.host_header
}