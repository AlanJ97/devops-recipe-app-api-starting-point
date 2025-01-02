##
# ECS Cluster for running app on Fargate.
##
resource "aws_ecs_cluster" "name" {
  name = "${local.prefix}-cluster"
}