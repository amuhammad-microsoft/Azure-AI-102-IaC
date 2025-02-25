# Azure AI-102 Exam Preparation Repository

This repository contains a comprehensive Bicep template that deploys a wide range of Azure AI services. It is designed to help prepare for the Azure AI-102 exam by providing a hands-on example of provisioning core AI services in Azure using infrastructure-as-code.

## Overview

The repository includes:

- **Bicep Template (`main.bicep`):** Provisions multiple Azure AI services such as Cognitive Services (with specific kinds like Face, Speech, OpenAI, etc.), Azure Machine Learning Workspace, Azure Bot Service, and Azure Cognitive Search.
- **Parameter File (`main.parameters.json`):** Externalizes environment-specific configuration (e.g., resource group name, location, service name prefix, and Bot Service endpoint) so that you don’t have to modify the main Bicep file when deploying to different environments.

## Services Deployed

The Bicep template deploys the following services:

- **Cognitive Services – Generic, Face, Speech, Form Recognizer, OpenAI, Text Analytics, Translator, Anomaly Detector, Personalizer:**  
  Each resource is configured with default settings (SKU S0) and includes inline comments describing its significance in the exam. These services cover areas like computer vision, speech processing, NLP, data extraction, and personalization.

- **Azure Machine Learning Workspace:**  
  Provides a dedicated environment for building, training, and deploying machine learning models.

- **Azure Bot Service:**  
  Registers a bot for developing conversational AI applications. (Remember to update the Bot Service endpoint in the parameter file.)

- **Azure Cognitive Search:**  
  Deploys an AI-powered search service that integrates cognitive skills for data enrichment.

## Prerequisites & Considerations

Before deploying the template, please ensure:

- **Permissions:**  
  You have the necessary permissions to create resources in your Azure subscription, and your subscription is enabled for the required services (for instance, Azure OpenAI Service may require special access).

- **Region Availability:**  
  Verify that the chosen location supports all the deployed AI services. You can check [Azure Products by Region](https://azure.microsoft.com/en-us/global-infrastructure/services/) for more details.

- **Customization:**  
  The template uses parameters to keep environment-specific values (like location, prefix, and Bot Service endpoint) separate from the deployment logic. Update the parameter file as needed without modifying `main.bicep`.

- **Testing:**  
  It’s recommended to deploy the template in a non-production environment first to ensure all services provision as expected.

> **Note:**  
> The subscription ID and tenant ID have been removed from the parameter file because they are automatically provided by the deployment context. The resource group name is now included for tagging or documentation purposes, but you can rely on the deployment context if preferred.

## Deployment Instructions

### 1. Clone the Repository

Clone the repository locally:

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 2. Customize the Parameter File

Open the `main.parameters.json` file and update the following values:

- **resourceGroupName:** Name of the resource group where you plan to deploy.
- **location:** Azure region (e.g., `eastus`) that supports all the required services.
- **prefix:** A string to use as a prefix for resource names.
- **botEndpoint:** Your actual Bot Service endpoint URL.

### 3. Deploy Using Azure CLI

Open your terminal and run:

```bash
az login
az deployment group create \
  --resource-group <your-resource-group> \
  --template-file main.bicep \
  --parameters @main.parameters.json
```

### 4. Deploy Using Azure PowerShell

Open PowerShell and run:

```powershell
Connect-AzAccount
New-AzResourceGroupDeployment -ResourceGroupName <your-resource-group> -TemplateFile main.bicep -TemplateParameterFile main.parameters.json
```

### 5. Deploy Using the Azure Portal

1. Navigate to your resource group in the [Azure Portal](https://portal.azure.com).
2. Click **Deploy a custom template**.
3. Upload the `main.bicep` file.
4. In the parameters editor, either upload `main.parameters.json` or manually input the required values.
5. Review and create the deployment.

## Contributing

Contributions are welcome! If you have suggestions, improvements, or discover issues, please open an issue or submit a pull request.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Support

If you have any questions or encounter issues with this repository or the Bicep deployment, please open an issue in the repository.
