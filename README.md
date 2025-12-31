# 🚀 End-to-End AWS Infrastructure Provisioning Using Terraform (IaC)

## 📌 Project Overview

This project demonstrates **end-to-end AWS infrastructure provisioning** using **Terraform (Infrastructure as Code)** with **CI/CD automation via GitHub Actions**.

---



## 🏗️ Architecture Diagram

    ┌────────────────────────────┐
    │        GitHub Repo         │
    │   (Terraform IaC Code)     │
    └──────────────┬─────────────┘
                   │ git push
                   ▼
    ┌────────────────────────────┐
    │     GitHub Actions CI/CD   │
    │  - terraform init          │
    │  - terraform validate      │
    │  - terraform plan          │
    │  - terraform apply         │
    └──────────────┬─────────────┘
                   │
                   ▼
    ┌────────────────────────────────────────────┐
    │                 AWS Account                │
    │                                            │
    │  ┌───────────────┐        ┌─────────────┐  │
    │  │     VPC       │        │ DynamoDB    │  │
    │  │ 10.0.0.0/16   │        │ State Lock  │  │
    │  │               │        └─────────────┘  │
    │  │  ┌─────────┐  │                         │
    │  │  │ Public  │  │        ┌─────────────┐  │
    │  │  │ Subnet  │◄─┼────────│   S3 Bucket │  │
    │  │  │10.0.1.0 │  │        │ Terraform   │  │
    │  │  └────┬────┘  │        │ State File  │  │
    │  │       │       │        └─────────────┘  │
    │  │  ┌────▼────┐  │                         │
    │  │  │  EC2    │  │                         │
    │  │  │ t3.micro│  │                         │
    │  │  └─────────┘  │                         │
    │  │       ▲       │                         │
    │  │  ┌────┴────┐  │                         │
    │  │  │ Security│  │                         │
    │  │  │  Group  │  │                         │
    │  │  │ 22, 80  │  │                         │
    │  └───────────────┘                         │
    └────────────────────────────────────────────┘

---

## 🧱 Technologies Used

| Category | Tools |
|--------|------|
| Cloud | AWS (Free Tier) |
| IaC | Terraform |
| Backend | S3 + DynamoDB |
| CI/CD | GitHub Actions |
| Compute | EC2 (t3.micro) |
| Networking | VPC, Subnet, IGW |
| Security | Security Groups |
| OS | Ubuntu VM |

---

## 📁 Project Structure

    terraform-aws-infra/
    │
    ├── backend/
    │   ├── provider.tf
    │   └── dynamodb.tf
    │
    ├── modules/
    │   ├── vpc/
    │   ├── security-group/
    │   └── ec2/
    │
    ├── provider.tf
    ├── terraform.tf
    ├── main.tf
    └── .github/workflows/terraform.yml

---

## 🔐 Terraform Remote Backend

**S3 Bucket** &
**DynamoDB Table** 

This ensures:
- Remote state storage
- State locking
- No corruption during parallel Terraform runs

---

## ⚙️ CI/CD Pipeline (GitHub Actions)

### Pipeline Triggers
- On every push to the **main** branch

### Pipeline Stages
- Checkout repository
- Install Terraform
- Configure AWS credentials securely
- Terraform Init
- Terraform Format Check
- Terraform Validate
- Terraform Plan
- Terraform Apply (auto-approved)

---

## 🚀 How to Deploy Manually

    terraform init
    terraform validate
    terraform plan
    terraform apply

---

## 🧹 Destroy Infrastructure (Cost Control)

    terraform destroy

Backend resources remain intact.

---


