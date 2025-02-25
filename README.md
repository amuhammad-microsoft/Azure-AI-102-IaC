# Azure AI-102 Exam Preparation Repository

This repository contains a comprehensive Bicep template that deploys a wide range of Azure AI services. It is designed to help prepare for the Azure AI-102 exam by providing a hands-on example of provisioning core AI services in Azure.

## Overview

The Bicep template in this repository deploys the following Azure AI services:

- **Cognitive Services (Generic Account):** A multi-service endpoint for various AI capabilities.
- **Face API:** For facial recognition, detection, and analysis.
- **Speech Services:** For speech-to-text, text-to-speech, and speaker recognition.
- **Form Recognizer:** To extract key information from forms and documents.
- **Azure OpenAI Service:** Provides access to advanced language models for generative AI tasks.
- **Text Analytics:** For sentiment analysis, key phrase extraction, and entity recognition.
- **Translator:** For multi-language text translation.
- **Anomaly Detector:** To detect unusual patterns or outliers in time series data.
- **Personalizer:** For delivering personalized content and recommendations using reinforcement learning.
- **Azure Machine Learning Workspace:** A complete environment for model building, training, and deployment.
- **Azure Bot Service:** For developing and managing conversational AI applications.
- **Azure Cognitive Search:** An AI-powered search service with built-in cognitive skills.

## Prerequisites & Permissions

Before deploying the template, ensure that:
- **Permissions:** You have the necessary permissions to create resources in your Azure subscription.
- **Service Access:** Your subscription is enabled for each of the services. For example, Azure OpenAI Service may require special access.
- **Azure CLI/PowerShell:** You have the latest version of the Azure CLI or Azure PowerShell installed.

## Region Availability

Some Azure AI services have regional restrictions. Verify that the selected location (or the location of your resource group) supports all the services you plan to deploy. You can refer to the [Azure Products by Region](https://azure.microsoft.com/en-us/global-infrastructure/services/) page for detailed information.

## Customization

This template is a starting point. Consider the following before deploying:
- **Service-Specific Properties:** Update properties as needed. For example, replace the placeholder Bot Service endpoint with your actual endpoint.
- **SKUs:** Adjust SKUs and other settings to align with your production or testing requirements.
- **Naming Conventions:** The template uses a prefix and a unique suffix (based on the resource group) to generate resource names. Modify these if needed.

## Testing

It is highly recommended to:
- **Deploy in a Test Environment:** Test the deployment in a non-production environment first to ensure that everything provisions as expected.
- **Validate Each Service:** After deployment, check the configurations and endpoints of each service to ensure they meet your requirements.

## Deployment

You can deploy the Bicep template using one of the following methods:

### Using Azure CLI

1. **Login:**
   ```bash
   az login
   ```
2. **Deploy the Template:**
   ```bash
   az deployment group create \
     --resource-group <your-resource-group> \
     --template-file main.bicep \
     --parameters prefix=<your-prefix>
   ```

### Using Azure PowerShell

1. **Login:**
   ```powershell
   Connect-AzAccount
   ```
2. **Deploy the Template:**
   ```powershell
   New-AzResourceGroupDeployment -ResourceGroupName <your-resource-group> -TemplateFile main.bicep -prefix <your-prefix>
   ```

### Using Azure Portal

1. Navigate to the [Azure Portal](https://portal.azure.com).
2. Go to **Resource Groups** and select your resource group.
3. Click on **Deploy a custom template**.
4. Paste the contents of the Bicep template into the editor or upload the file.
5. Fill in any required parameters and deploy.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contributing

Contributions are welcome! If you have suggestions, improvements, or find any issues, please create a pull request or open an issue.

## Support

For any questions or issues regarding this repository or the Bicep template, feel free to open an issue in this repository.
