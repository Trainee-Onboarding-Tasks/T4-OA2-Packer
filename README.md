# T4-OA2-Packer

# Table of Contents
* [Overview](#overview)
* [Project Structure](#project-structure)
* [Setup & Run](#setup--run)
    * [Local Execution](#local-execution)
    * [GitHub Actions Execution](#github-actions-execution)

---


# Overview

This repository is designed to build multiple specialized Amazon Machine Images (AMIs) using **HashiCorp Packer**.

Instead of a single monolithic server, this project follows a modular approach to create optimized images for different roles in the infrastructure:

- **Proxy Server**: OAuth2-based authentication service environment.


---

# Project Structure
The repository is organized into directories, each containing its own Packer templates, scripts, and configurations:
```text
.
├── proxy/        # AMI for Oauth2 and Keyclock server
```


# Setup & Run

## Local Execution
To build a specific AMI from your local machine, ensure you have the required credentials and software:

1.  **Prerequisites**:
    *   AWS CLI installed and configured with creds
    *   HashiCorp Packer is installed

2.  **Configuration**:
    In target folder in file `variables.pkr.hcl` configure variables:

    ```bash
    variable "region" {
      description = "AWS region where AMI will be created"
      type        = string
      default     = "us-east-1"
    }


    variable "instance_type" {
      description = "EC2 instance type used for building the AMI"
      type        = string
      default     = "t3.medium"
    }
    ```
    there are special variables - AWS region where AMI will be created and EC2 instance type used for building the AMI.

3.  **Build**:
    ```bash
    cd <target_directory>  # e.g., cd llm
    packer init .
    packer build .
    ```



## GitHub Actions Execution

The AMI build process is fully automated using GitHub Actions and Packer.

### Configure AWS IAM Role

Before running the workflow, ensure that an AWS IAM role is configured for GitHub OIDC authentication.

The role must:

- Trust GitHub’s OIDC provider
- Allow GitHub Actions to assume the role
- Have permissions required to build and manage AWS AMIs used in the Packer pipeline

The workflow uses the following IAM role:
```bash
arn:aws:iam::971778147356:role/GitHubActionsTerraformRole
```


## Pull Request Validation

When a Pull Request targeting the `main` branch contains changes in the `proxy/` directory, GitHub Actions automatically performs:

- Packer initialization (`packer init`)
- Packer configuration validation (`packer validate`)
- AMI build process (`packer build`)

This allows AMI changes to be validated before merging.


### Automatic AMI Build

When changes are merged into the `main` branch, GitHub Actions automatically:

- Authenticates to AWS using OIDC
- Initializes Packer in the `proxy/` directory
- Validates the AMI configuration
- Builds the AMI

The build is executed using:

```bash
packer build .
```


### Workflow Triggers

The workflow runs automatically when:

- A Pull Request modifies files inside the `proxy/` directory
- Changes are pushed to the main branch affecting files inside the `proxy/` directory

---
