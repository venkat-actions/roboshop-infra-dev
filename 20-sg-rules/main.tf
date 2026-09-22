# MongoDB allowing connections from catalogue on port 27017
resource "aws_security_group_rule" "mongodb_catlogue" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.catalogue_sg_id.value
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}

# MongoDB allowing connections from user on port 27017
resource "aws_security_group_rule" "mongodb_user" {
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.user_sg_id.value
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}
# MongoDB allowing connections from bastion on port 22
resource "aws_security_group_rule" "mongodb_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.mongodb_sg_id.value
}

# redis allowing connections from user on port 6379
resource "aws_security_group_rule" "redis_user" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.user_sg_id.value
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}
# redis allowing connections from cart on port 6379
resource "aws_security_group_rule" "redis_cart" {
  type              = "ingress"
  from_port         = 6379
  to_port           = 6379
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.cart_sg_id.value
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}
# redis allowing connections from bastion on port 22
resource "aws_security_group_rule" "redis_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.redis_sg_id.value
}

#mysql
# mysql allowing connections from shipping on port 3306
resource "aws_security_group_rule" "mysql_shipping" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.shipping_sg_id.value
  security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
}
# mysql allowing connections from bastion on port 22
resource "aws_security_group_rule" "mysql_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
}

#rabbitmq
# rabbitmq allowing connections from payment on port 5672
resource "aws_security_group_rule" "rabbitmq_payment" {
  type              = "ingress"
  from_port         = 5672
  to_port           = 5672
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.payment_sg_id.value
  security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
}
# rabbitmq allowing connections from bastion on port 22
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.rabbitmq_sg_id.value
}

#catalogue

resource "aws_security_group_rule" "catalogue_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.backend_alb_sg_id.value
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
}
resource "aws_security_group_rule" "catalogue_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.catalogue_sg_id.value
}

#user

resource "aws_security_group_rule" "user_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.backend_alb_sg_id.value
  security_group_id = data.aws_ssm_parameter.user_sg_id.value
}
resource "aws_security_group_rule" "user_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.user_sg_id.value
}

#cart

resource "aws_security_group_rule" "cart_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.backend_alb_sg_id.value
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}
resource "aws_security_group_rule" "cart_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.cart_sg_id.value
}

#shipping

resource "aws_security_group_rule" "shipping_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.backend_alb_sg_id.value
  security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
}
resource "aws_security_group_rule" "shipping_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.shipping_sg_id.value
}

#payment

resource "aws_security_group_rule" "payment_backend_alb" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.backend_alb_sg_id.value
  security_group_id = data.aws_ssm_parameter.payment_sg_id.value
}
resource "aws_security_group_rule" "payment_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.payment_sg_id.value
}

#backend_alb to frontend http based

resource "aws_security_group_rule" "backend_alb_frontend" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.frontend_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}
resource "aws_security_group_rule" "backend_alb_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}
resource "aws_security_group_rule" "backend_alb_catalogue" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.catalogue_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}
resource "aws_security_group_rule" "backend_alb_user" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.user_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}
resource "aws_security_group_rule" "backend_alb_cart" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.cart_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}
resource "aws_security_group_rule" "backend_alb_shipping" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.shipping_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}
resource "aws_security_group_rule" "backend_alb_payment" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.payment_sg_id.value
  security_group_id = data.aws_ssm_parameter.backend_alb_sg_id.value
}

#frontend
resource "aws_security_group_rule" "frontend_frontend_alb" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.frontend_alb_sg_id.value
  security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
}
resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  source_security_group_id= data.aws_ssm_parameter.bastion_sg_id.value
  security_group_id = data.aws_ssm_parameter.frontend_sg_id.value
}

#frontend_alb
resource "aws_security_group_rule" "frontend_alb_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = data.aws_ssm_parameter.frontend_alb_sg_id.value
}



