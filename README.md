# Terraform AWS VPC

## Project Architecture Diagram

![Architecture Diagram](images/module-architecture.png)

# Terraform AWS VPC Module

A reusable Terraform module for provisioning a highly available, production-ready Amazon VPC.

This module creates a VPC across multiple Availability Zones with public, private application, and private data subnets. It follows AWS networking best practices by separating resources into dedicated subnet tiers and supporting highly available NAT Gateways for outbound internet access from private application subnets.

## Features

- Creates a custom Amazon VPC
- Public subnets across multiple Availability Zones
- Private application subnets
- Private data subnets
- Internet Gateway
- Public route table
- Highly available NAT Gateways (one per Availability Zone)
- Dedicated private route tables for application subnets
- Private route table for data subnets
- Route table associations
- Configurable CIDR blocks, Availability Zones, and resource naming

This module is intended to be used as the networking foundation for AWS infrastructure such as Application Load Balancers, Auto Scaling Groups, EC2 instances, RDS databases, and other services deployed within a secure multi-tier architecture.