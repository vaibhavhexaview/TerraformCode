terraform{
    backend "s3"{
      bucket = var.bucket
      region = "ap-southeast-1"
      key = "Nodes/terraform.tfstate"
  }
}