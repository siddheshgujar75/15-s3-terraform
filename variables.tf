variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "Unique S3 bucket name"
  type        = string
}

variable "index_file" {
  description = "Website index file"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}