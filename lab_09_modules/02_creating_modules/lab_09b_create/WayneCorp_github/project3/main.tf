
## Create a VPC using module
module "s3-bucket" { ## We could call this "pepe" :-)
  #  source            = "../modules/aws-web-vpc"
  source = "github.com/matypro/terraform-s3-module/s3_bucket"
  bucket_name = "sergio122311231231564546"
  versioning = "true"
  login-prefix = "logs"
  

}

