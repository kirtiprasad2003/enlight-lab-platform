resource "aws_s3_bucket" "enlight_demo" {
  bucket = "enlight-demo"
  acl    = "public-read"
}
