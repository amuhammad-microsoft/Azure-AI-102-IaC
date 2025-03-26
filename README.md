# Azure AI Sandbox - AI-102 Exam Preparation Repository

**Azure AI Sandbox** is a comprehensive, hands-on environment designed for both proof-of-concept development and preparation for the AI-102 exam. This repository provides a ready-to-deploy Bicep template that provisions a full suite of Azure AI services – including an Azure OpenAI Service (including Defender and RAI policies), Azure Cognitive Search, Generic Cognitive Services account, Computer Vision, Custom Vision Training (deployed to eastus2) and Custom Vision Prediction (deployed to eastus), Face API, Speech Services, Text Analytics, Translator, Form Recognizer and Immersive Reader – all while following Azure Cloud Adoption Framework (CAF) best practices for resource naming and configuration. This sandbox helps you gain practical experience with real-world deployments, overcome common configuration challenges, and streamline your exam preparation process.

## Overview

The repository now includes:

- **Bicep Template (`main.bicep`):**  
  This template deploys multiple Azure AI services using dynamic, well-formatted names that are generated from an object (comprising a prefix, a random value, and a user-supplied suffix). 

 - **Parameter File (`main.parameters.json`):**  
  This file externalizes environment-specific configuration such as resource names and location. Resource names are now generated using an object with a prefix, a random value, and an optional user-supplied suffix (following Azure CAF best practices) to ensure uniqueness and consistency.

## Services Deployed

The updated Bicep template provisions the following services:

- **Azure OpenAI Service:**  
 Enables generative AI scenarios using OpenAI models and supports policy enforcement with Defender and RAI features.  
  *(Exam: Generative AI & Responsible AI)*

- **Azure Cognitive Search Service:**  
  Offers AI-powered indexing and search capabilities, with a name that conforms to strict naming rules.  
  *(Exam: Data Search & Enrichment)*

- **Generic Cognitive Services Account:**  
  A multipurpose account for various cognitive capabilities.  
  *(Exam: Cognitive Services Integration)*

- **Computer Vision Account:**  
  Enables image analysis (OCR, object detection, etc.).  
  *(Exam: Computer Vision)*

- **Custom Vision Training Account:**  
  Used to train custom image classification or object detection models. Deployed to **eastus2** for service availability.  
  *(Exam: Custom Vision & Model Training)*

- **Custom Vision Prediction Account:**  
  Serves predictions from your custom vision models. Deployed to **eastus** for service availability.  
  *(Exam: Custom Vision & Model Prediction)*

- **Face API Account:**  
  Supports facial recognition and emotion detection.  
  *(Exam: Facial Analysis)*

- **Speech Services Account:**  
  Supports speech-to-text, text-to-speech, and speaker recognition functionalities.  
  *(Exam: Speech Processing)*

- **Text Analytics Account:**  
  Enables sentiment analysis, key phrase extraction, and entity recognition.  
  *(Exam: Natural Language Processing)*

- **Translator Account:**  
  Provides robust text translation capabilities.  
  *(Exam: Language Translation)*

- **Form Recognizer Account:**  
  Automates extraction of structured data from forms and documents.  
  *(Exam: Document Understanding)*

- **Immersive Reader Account:**  
  Provides advanced reading and comprehension capabilities.  
  *(Exam: Accessibility & Enhanced Reading)*
 

## Prerequisites & Considerations

Before deploying the template, please ensure:

- **Permissions:**  
  You have the necessary permissions to create resources in your Azure subscription. Some services may require additional access.
  
- **Region Availability:**  
  Confirm that the chosen region supports the deployed services. Note that the Custom Vision Training account is deployed to **eastus2** and the Custom Vision Prediction account to **eastus**.
  
- **Customization:**  
  Update the parameter file (`main.parameters.json`) as needed. The resource names are dynamically generated using an object with keys for prefix, a random value, and a user-supplied suffix following Azure CAF best practices.
  
- **Testing:**  
  It’s recommended to deploy this template in a non-production environment first to verify that all services are provisioned correctly.

## Deployment Instructions

### 1. Clone the Repository

Clone the repository locally:

```bash
git clone https://github.com/amuhammad-microsoft/Azure-AI-102-IaC.git
cd Azure-AI-102-IaC
```

### 2. Customize the Parameter File

Edit the `main.parameters.json` file to update values such as resource names, location, and other environment-specific settings.

### 3. Deploy Using Azure CLI

Ensure you’re logged in:

```bash
az login
```

Then run:

```bash
az deployment group create --resource-group <your-resource-group> --template-file main.bicep --parameters @main.parameters.json
```

Replace `<your-resource-group>` with your actual resource group name (e.g., `ISDShots`).

### 4. Deploy Using Azure PowerShell

In PowerShell, run:

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

Contributions are welcome! If you have suggestions, improvements, or encounter any issues, please open an issue or submit a pull request.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
