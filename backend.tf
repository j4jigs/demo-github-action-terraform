terraform {
  backend "s3" {
    bucket = "jigneshterraforms3backend"
    key    = "github-terraform.tfstate"
    region = "us-east-1"
  }
}
