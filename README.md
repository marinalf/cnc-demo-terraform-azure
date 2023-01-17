## Sample [terraform](https://www.terraform.io) code with [Cisco Cloud Network Controller](https://www.cisco.com/c/en/us/solutions/data-center-virtualization/application-centric-infrastructure/cloud-network-controller.html)

This project shows how Cloud Network Controller (CNC) works on Azure, how it normalizes and translates a cloud-like policy model into public cloud native constructs, and how Terraform can be leveraged to automate CNC operations.

**High Level Diagram**

<img width="600" alt="azure" src="images/demo.png">

 **Use Case: Single Region/Tenant/VRF**

Using standard terraform modules, the code builds a single VNet on uksouth region and enable peering with the infra VNet where CNC is deployed with cloud routers, it then creates two EPGs (Web & DB) which translates to 2 ASGs/NSGs (subnet-based), and enable Web access from Internet using contracts.

**Pre-requisites**

CNC running on a dedicated Azure subscription or resource group. All credentials and sensitive data are defined in a .tfvars file.

**Providers**

| Name      | Version |
| --------- | ------- |
| [aci](https://registry.terraform.io/providers/CiscoDevNet/aci/latest)|  >=2.5.2   |

**Installation**

1. Install and set up your [terraform](https://www.terraform.io/downloads.html) environment
2. Clone/copy the .tf files (main.tf, variables.tf, outputs.tf, and versions.tf) onto your terraform environment
3. Create a terraform.tfvars file with your CNC credentials and Azure subscription used for the user tenant/VNet
4. Optionally, the azure.tf file deploys two VM instances (web-vm and db-vm) for testing purposes.

**Usage**
```
terraform init
terraform plan
terraform apply
```
