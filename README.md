# 🚀 Terraform S3 Static Website Hosting

## 📌 Project Overview

This project demonstrates how to use **Terraform** to provision an AWS S3 bucket, enable **versioning**, and configure it for **static website hosting**.

The infrastructure is fully parameterized using Terraform variables, making it reusable and environment-independent.

---

## 🧩 Architecture

Terraform → AWS S3 Bucket → Versioning Enabled → Static Website Hosting → Public Access

---

## ⚙️ Tech Stack

* Terraform
* AWS S3
* AWS IAM
* Linux (WSL)
* Git & GitHub

---

## 📁 Project Structure

```
.
├── main.tf
├── variables.tf
├── terraform.tfvars
├── index.html
├── .gitignore
└── README.md
```

---

## 🔐 Prerequisites

* AWS Account
* AWS CLI configured (`aws configure`)
* Terraform installed
* Unique S3 bucket name

---

## 🚀 How to Run

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Apply Configuration

```bash
terraform apply -auto-approve
```

### 3. Get Website URL

Terraform will output:

```
website_url = <your-bucket>.s3-website-ap-south-1.amazonaws.com
```

---

## 🌐 Output

Open the URL in your browser:

```
http://<your-bucket>.s3-website-ap-south-1.amazonaws.com
```

You should see:

```
🚀 Terraform S3 Website
Deployed using Terraform
```

---

## 🧠 Key Features

* ✅ S3 bucket creation using Terraform
* ✅ Versioning enabled for data safety
* ✅ Static website hosting configured
* ✅ Public access using bucket policy
* ✅ Fully dynamic using variables

---

## 🔥 Key Learnings

* Infrastructure as Code (IaC) with Terraform
* S3 bucket configuration and security
* Static website hosting on AWS
* Terraform variables and tfvars usage
* Managing public access in S3

---

## ⚠️ Important Notes

* Bucket name must be **globally unique**
* Do NOT commit:

  * `.terraform/`
  * `.tfstate`
  * `.pem` files
* Ensure **Block Public Access is disabled** for static hosting

---

## 🚀 Future Improvements

* Add CloudFront (CDN)
* Add custom domain (Route53)
* Enable HTTPS (SSL)
* Use Terraform modules

---

## 👨‍💻 Author

Siddhesh Gujar
