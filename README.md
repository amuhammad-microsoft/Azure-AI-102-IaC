# Azure AI-102 Exam Preparation Repository

This repository contains a comprehensive Bicep template that deploys a broad range of Azure AI services. It is designed to help you prepare for the Azure AI-102 exam by providing a hands-on example of provisioning core AI services in Azure using infrastructure-as-code.

## Overview

The repository now includes:

- **Bicep Template (`main.bicep`):**  
  This template deploys multiple Azure AI services such as:
  - Generic Cognitive Services account  
  - Computer Vision account  
  - Custom Vision Training and Custom Vision Prediction accounts  
  - Face API account  
  - Form Recognizer account  
  - Immersive Reader account  
  - OpenAI Service account (with child resources for Defender and RAI policies)  
  - Speech Services account  
  - Text Analytics account (deployed at free tier SKU F0)  
  - Translator account  
  - Azure Cognitive Search service

  In addition, resources that couldn’t be deployed due to quota or configuration limitations are preserved as commented-out sections:
  - **Azure Bot Service** – Requires a unique Microsoft App ID (to avoid conflicts).  
  - **Cognitive Services – Anomaly Detector** – Not deployed because the required free SKU isn’t available.  
  - **Cognitive Services – Personalizer** – Omitted due to similar SKU/quota restrictions.

- **Parameter File (`main.parameters.json`):**  
  This file externalizes environment-specific configuration (such as resource names, resource group, and location). Simply update the parameters without modifying the core template.

## Services Deployed

The updated Bicep template now deploys the following services:

- **Generic Cognitive Services Account:**  
  A multipurpose account for various cognitive capabilities.

- **Computer Vision Account:**  
  Enables image analysis, OCR, and object detection.

- **Custom Vision Training & Prediction Accounts:**  
  Two separate accounts allow you to train custom image classification/object detection models and serve predictions from those models.

- **Face API Account:**  
  Supports facial recognition and emotion detection.

- **Form Recognizer Account:**  
  Automates extraction of key data from forms and documents.

- **Immersive Reader Account:**  
  Provides immersive reading and comprehension features to support accessibility and enhanced user experiences.

- **OpenAI Service Account (with Defender and RAI Policies):**  
  Grants access to advanced language models for generative AI tasks and includes child resources that enforce content filtering policies.

- **Speech Services Account:**  
  Supports speech-to-text, text-to-speech, and speaker recognition functionalities.

- **Text Analytics Account:**  
  Enables sentiment analysis, key phrase extraction, and entity recognition at the free tier (F0).

- **Translator Account:**  
  Provides text translation capabilities.

- **Azure Cognitive Search Service:**  
  Offers AI-powered indexing and search for data enrichment.

## Resources Not Deployed (Commented Out)

The following resources are included in the template as commented-out sections for reference. They were not deployed because of subscription limitations or configuration complexities:
- **Azure Bot Service:**  
  Deployment requires a unique Microsoft App ID that is not in conflict with existing bots.
- **Cognitive Services – Anomaly Detector:**  
  The required SKU is not available in your subscription.
- **Cognitive Services – Personalizer:**  
  Similar SKU/quota restrictions prevent deployment in this environment.

## Prerequisites & Considerations

Before deploying the template, please ensure:

- **Permissions:**  
  You have the necessary permissions to create resources in your Azure subscription. Some services (such as Azure OpenAI) may require special access.

- **Region Availability:**  
  Verify that the chosen location supports all the deployed services. Use the [Azure Products by Region](https://azure.microsoft.com/en-us/global-infrastructure/services/) page for reference.

- **Customization:**  
  The template uses parameters to keep environment-specific values (e.g., resource names, location, etc.) separate from the deployment logic. Update the parameter file (`main.parameters.json`) as needed without modifying the core Bicep file.

- **Testing:**  
  It is recommended to deploy the template in a non-production environment first to ensure all services provision as expected.

## Deployment Instructions

### 1. Clone the Repository

Clone the repository locally:

```bash
git clone https://github.com/amuhammad-microsoft/Azure-AI-102-IaC.git
cd Azure-AI-102-IaC
```

### 2. Customize the Parameter File

Open the `main.parameters.json` file and update the values:
- **Resource names:** Supply unique names for each deployed service.
- **Location:** Choose the Azure region where you want to deploy.
- Other settings can be adjusted as needed.

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
