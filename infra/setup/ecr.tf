##############################################
# Create ECR repos for storing Docker images #
##############################################

resource "aws_ecr_repository" "app" {
  name                 = "recipe-app-api_app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    #NOTE: Update to true for real deployment.
    scan_on_push = false
  }
}

resource "aws_ecr_repository" "proxy" {
  name                 = "recipe-app-api_proxy"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    #NOTE: Update to true for real deployment.
    scan_on_push = false
  }
}