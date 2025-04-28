# Secure Azure Infrastructure Deployment with Terraform 🚀

This repository contains the Terraform configuration files used to deploy a secure and scalable Azure environment for a simple web application. It includes modules for:

- **Virtual Network (VNet)** 🌐
- **Key Vault** 🔑
- **Virtual Machine (VM)** 🖥️
- **Monitoring & Alerts** 📊
- **Role-Based Access Control (RBAC)** 🔒

## Prerequisites 📋

Before you begin, ensure you have the following:

- **Terraform** (v1.3 or higher) installed. You can download it from [terraform.io](https://www.terraform.io/downloads).
- **Azure CLI** installed and authenticated. If you don't have it, install it from [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).
- **Azure Subscription** to deploy the resources.
- **Azure Active Directory Object ID** for assigning RBAC roles.

## Architecture Overview 🌍

The deployment will create the following resources:

- **Resource Group** for organizing resources.
- **Virtual Network (VNet)** with a **Subnet**.
- **VM** running Ubuntu with **Nginx** serving a simple "Hello World" page.
- **Key Vault** for managing secrets like the admin password.
- **Monitoring** via **Azure Monitor** and **Log Analytics Workspace**.
- **Alerts** using **Azure Logic Apps**.
- **Role-Based Access Control (RBAC)** for managing permissions.

## Folder Structure 📁

The project structure is divided into the following directories and files:

### Main Files:

- **`main.tf`**: The root configuration file where the resource group and modules are defined. This is where you include references to the modules for Key Vault, VM, VNet, Monitoring, and RBAC.
  
- **`outputs.tf`**: Defines all the outputs that you want to display after deployment (e.g., public IPs, VM names, Key Vault URIs).
  
- **`provider.tf`**: Configuration for the Azure provider, where you define authentication and the Azure region.

- **`terraform.tfvars`**: Defines values for variables like VM username, password, and network details.

### Modules:

#### **`keyvault/`**
- **`keyvault.tf`**: Defines the Azure Key Vault resource.
- **`outputs.tf`**: Exports values such as the Key Vault's URI or secrets.

#### **`monitoring/`**
- **`monitoring.tf`**: Configures monitoring resources like Log Analytics Workspace, Application Insights, or Azure Monitor Alerts.
- **`outputs.tf`**: Exports monitoring-related outputs like the Log Analytics Workspace ID.

#### **`rbac/`**
- **`rbac.tf`**: Assigns RBAC roles to Azure resources. For example, assigning a "Key Vault Reader" role to a user.
- **`outputs.tf`**: Exports information about the RBAC roles assigned.

#### **`vm/`**
- **`vm.tf`**: Defines the VM configuration, including the operating system, size, and Nginx installation script.
- **`outputs.tf`**: Exports details like the VM's public IP or internal DNS name.

#### **`vnet/`**
- **`vnet.tf`**: Defines the Virtual Network, subnets, Network Security Groups (NSGs), and other networking resources.
- **`outputs.tf`**: Exports the VNet's name, subnet information, and public IP address of the VM.

## Steps to Deploy the Environment 🚀

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/azure-terraform-deployment.git
   cd azure-terraform-deployment
## Configure Variables

Update the `terraform.tfvars` file with your specific details, such as:

- `admin_password`: Secure password for the VM.
- `admin_username`: Username for VM access.
- `ssh_public_key`: Your public SSH key for VM login.
- `alert_email`: Email address for monitoring alerts.
- `admin_object_id`: Your Azure Active Directory Object ID.

## Plan the Deployment

Run the following command to preview the changes Terraform will make:

```bash terraform plan```

## Configure Variables :
Update the terraform.tfvars file with your specific details, such as:
admin_password: Secure password for the VM.
admin_username: Username for VM access.
ssh_public_key: Your public SSH key for VM login.
alert_email: Email address for monitoring alerts.
admin_object_id: Your Azure Active Directory Object ID.
Plan the Deployment :
Run the following command to preview the changes Terraform will make:
bash


1
terraform plan
Apply the Configuration :
If the plan looks good, apply the configuration to deploy the resources:
bash


1
terraform apply
Access the Web Server :
After deployment, you can access the web page hosted on the VM via the public IP that is output by Terraform.

## Best Practices Implemented 🛡️
Infrastructure as Code (IaC) : All resources are defined using Terraform, ensuring a reproducible and versioned deployment.
RBAC for Security : Roles are assigned using Azure's RBAC system, ensuring the principle of least privilege for accessing resources.
Secure Access : SSH access to the VM is restricted to specific IPs, ensuring only authorized users can connect.
Key Vault for Secrets Management : Admin passwords and other sensitive data are stored securely in Azure Key Vault, preventing hardcoding in the Terraform configuration.
Monitoring and Alerts : Azure Monitor and Logic Apps are configured to send alerts for high-severity security incidents.
Network Security : NSG (Network Security Groups) are applied to control inbound traffic to the VM.

## Design Choices & Assumptions 🧩
VNet with DDoS Protection : The VNet includes DDoS protection, as it is critical for securing public-facing applications.
Ubuntu VM : An Ubuntu Linux VM was chosen to minimize costs and ensure compatibility with common open-source software (Nginx in this case).
Nginx Web Server : A simple Hello World HTML page is served by Nginx to demonstrate the VM’s functionality.
Key Vault SKU : The default Key Vault SKU is set to "Standard", which is appropriate for most use cases but can be changed to "Premium" if advanced features are needed.
Role Assignments : The "Virtual Machine Administrator Login" role is assigned to the VM, and the "Key Vault Reader" role is assigned to the admin for accessing Key Vault secrets.
Troubleshooting 🔧
Access Denied Errors : Ensure the Azure Active Directory Object ID provided in terraform.tfvars has the necessary permissions to assign roles.
VM Not Accessible : Verify that your IP is included in the allowed_ssh_ips list in the terraform.tfvars file.
Future Improvements ✨
Automate Key Vault Secret Insertion : Consider automating the insertion of secrets into Key Vault from external sources or securely managed pipelines.
Advanced Monitoring : Add more detailed monitoring such as Azure Security Center integration or custom metrics for the web server.
Scaling VM : Depending on the use case, the VM size and configuration can be scaled up to meet performance demands.
