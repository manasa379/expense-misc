terraform {
  backend "s3" {
    bucket = "terraform-d155"
    key    = "misc/jenkins-ip/terraform.tfstate"
    region = "us-east-1"

  }
}

data "aws_instance" "instance" {
  instance_id = "i-0d8628c551b4ca7a9"
}

resource "aws_route53_record" "jenkins" {
  name      = "jenkins.devops155.online"
  type      = "A"
  zone_id   = "Z06848581UD2LTM8TKQW6"
  records   = [data.aws_instance.instance.public_ip]
  ttl       = 10
}


data "aws_instance" "artifactory" {
  instance_id = "i-06bd5ae95d6121c"
}

resource "aws_route53_record" "artifactory" {
  name    = "artifactory.devops155.online"
  type    = "A"
  zone_id = "Z06848581UD2LTM8TKQW6"
  records = [data.aws_instance.artifactory.public_ip]
  ttl     = 10
}



