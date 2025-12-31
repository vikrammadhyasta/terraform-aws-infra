resource "aws_s3_bucket" "tf_state" {
  bucket = "vikram-terraform-state-freetier"
  force_destroy = true
}
