resource "aws_s3_bucket" "b1" {

  bucket = "awsbucketlambda"

  acl    = "public-read"

  policy = file("policy.json")

  website {

    index_document = "test-web.html"

    error_document = "error.html"
  }



  tags = {

    Name        = "My bucket"

    Environment = "Dev"

  }

}

resource "aws_s3_bucket_object" "object1" {

  bucket       = aws_s3_bucket.b1.id

  key          = "test-web.html"

  acl          = "public-read-write"

  source       = "test-web.html"

  content_type = "text/html"


}

resource "aws_s3_bucket_object" "object2" {

  bucket       = aws_s3_bucket.b1.id

  key          = "error.html"

  acl          = "public-read-write"

  source       = "error.html"

  content_type = "text/html"



}
