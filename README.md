# Automated-Cloud-Infrastructure
How I Built Automated Cloud Infrastructure for a Fast-Moving Startup
# 🚀 Terraform AWS Infrastructure for Start-Up Feature Rollout

This project provisions a secure, scalable, and easily repeatable AWS infrastructure using **Terraform**, designed to support a start-up feature rollout that requires **dynamic, zero-manual provisioning** of resources.

---

## 🏗️ What this project does

 Sets up a **custom VPC** with public subnets and internet access.  
 Creates a **Security Group** that allows SSH and outbound traffic.  
 Launches **EC2 instances** with root and additional EBS volumes.  
 Generates an **SSH key pair** automatically for secure access.  
 Uses **Infrastructure as Code (IaC)** best practices: parameterized, modular, repeatable.

---


---

## ⚙️ Getting Started

### 🔧 Prerequisites
- [Terraform](https://terraform.io) installed (>= v1.3)
- AWS CLI configured (`aws configure`) with access keys
- IAM user/role with permissions for EC2, VPC, and IAM resources.

---

### 🚀 Usage

1. **Initialize the project**

     ```bash
      terraform init 
### The private SSH key will be saved as
  ```bash
   ./start-up-aws-key-pair.pem
---

**Connect to your instance using**
ssh -i ./start-up-aws-key-pair.pem ec2-user@<PUBLIC_IP>


