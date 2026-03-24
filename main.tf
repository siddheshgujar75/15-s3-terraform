provider "aws" {
  region = var.region
}

#s3
resource "aws_s3_bucket" "website" {
  bucket = var.bucket_name

  tags = {
    Environment = var.environment
  }
}

#versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.website.id

  versioning_configuration {
    status = "Enabled"
  }
}

#Static website hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = var.index_file
  }
}

#public access block
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#Bucket policy
resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.website.id

  depends_on = [
    aws_s3_bucket_public_access_block.public_access
  ]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = ["s3:GetObject"]
        Resource = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}

#upload index file to s3 bucket
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website.id
  key    = var.index_file
  source = var.index_file
  content_type = "text/html"
}

#output 
output "website_url" {
  value = aws_s3_bucket_website_configuration.website_config.website_endpoint
}