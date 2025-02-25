@description('Resource Group Name')
param resourceGroupName string = resourceGroup().name

@description('Location for all resources')
param location string

@description('Prefix for resource names')
param prefix string

@description('Bot Service endpoint URL')
param botEndpoint string

// Unique suffix is generated from the resource group ID. You may leave this as is.
@description('Unique suffix for resource names (generated from the resource group)')
param uniqueSuffix string = uniqueString(resourceGroup().id)

/*
---------------------------------------------------------------------------
Cognitive Services - Generic Account
---------------------------------------------------------------------------
This resource deploys a generic Cognitive Services account that can be used
to access multiple cognitive capabilities.

Significance in Azure AI-102 Exam:
• Demonstrates an understanding of how to provision and configure a multi-service
  endpoint for AI capabilities.
• Relevant for exam areas focused on integrating various cognitive services into solutions.

Exam Area: Cognitive Services configuration and integration.
---------------------------------------------------------------------------
*/
resource cognitiveServicesGeneric 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}coggeneric${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'CognitiveServices'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Cognitive Services - Face API
---------------------------------------------------------------------------
This resource deploys the Face API service for facial recognition, detection,
and analysis.

Significance in Azure AI-102 Exam:
• Covers the computer vision domain, particularly facial analysis.
• Exam scenarios may include user authentication, emotion recognition, and
  image analysis using facial data.

Exam Area: Computer Vision (Face API).
---------------------------------------------------------------------------
*/
resource cognitiveServicesFace 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}face${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'Face'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Cognitive Services - Speech Services
---------------------------------------------------------------------------
This resource deploys Speech Services for converting speech-to-text, text-to-speech,
and speaker recognition.

Significance in Azure AI-102 Exam:
• Focus on natural language processing (NLP) as applied to speech.
• Demonstrates deployment and integration of audio processing capabilities within applications.

Exam Area: Speech (Speech-to-text, text-to-speech, and speaker recognition).
---------------------------------------------------------------------------
*/
resource cognitiveServicesSpeech 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}speech${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'SpeechServices'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Cognitive Services - Form Recognizer
---------------------------------------------------------------------------
This resource deploys Form Recognizer which extracts key information from forms and documents.

Significance in Azure AI-102 Exam:
• Illustrates how to automate data extraction from documents.
• Tied to scenarios in document understanding and AI-driven data processing.

Exam Area: Document processing and data extraction.
---------------------------------------------------------------------------
*/
resource cognitiveServicesFormRecognizer 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}formrecog${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'FormRecognizer'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Cognitive Services - OpenAI Service
---------------------------------------------------------------------------
This resource deploys the Azure OpenAI Service, which provides access to advanced
language models for generative AI tasks.

Significance in Azure AI-102 Exam:
• Demonstrates how to integrate cutting-edge AI models into applications.
• Highlights the use of generative AI for tasks such as text generation and summarization.

Exam Area: Generative AI and advanced language models.
---------------------------------------------------------------------------
*/
resource cognitiveServicesOpenAI 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}openai${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'OpenAI'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Cognitive Services - Text Analytics
---------------------------------------------------------------------------
This resource deploys the Text Analytics service, which provides features such as
sentiment analysis, key phrase extraction, and entity recognition.

Significance in Azure AI-102 Exam:
• Core to natural language processing tasks.
• Exam topics may cover language understanding, text classification, and semantic analysis.

Exam Area: Natural Language Processing (NLP) and text analytics.
---------------------------------------------------------------------------
*/
resource cognitiveServicesTextAnalytics 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}textanalytics${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'TextAnalytics'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Cognitive Services - Translator
---------------------------------------------------------------------------
This resource deploys a Translator service via a generic Cognitive Services account.
It provides text translation capabilities across multiple languages.

Significance in Azure AI-102 Exam:
• Demonstrates how to leverage AI for language translation.
• May be referenced in exam scenarios involving globalized applications and multi-language support.

Exam Area: Language translation and text analytics.
---------------------------------------------------------------------------
*/
resource cognitiveServicesTranslator 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}translator${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  // Translator is delivered via the generic Cognitive Services account type.
  kind: 'CognitiveServices'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Cognitive Services - Anomaly Detector
---------------------------------------------------------------------------
This resource deploys the Anomaly Detector service, which analyzes time series data
to detect unusual patterns or outliers.

Significance in Azure AI-102 Exam:
• Useful for monitoring and proactive alerting in AI solutions.
• Exam scenarios may include monitoring sensor data, financial transactions, or
  other time series data for anomalies.

Exam Area: Data analysis and monitoring using AI.
---------------------------------------------------------------------------
*/
resource cognitiveServicesAnomalyDetector 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}anomaly${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'AnomalyDetector'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Cognitive Services - Personalizer
---------------------------------------------------------------------------
This resource deploys the Personalizer service, which uses reinforcement learning
to deliver personalized content or recommendations.

Significance in Azure AI-102 Exam:
• Illustrates the application of AI for personalization and decision making.
• Exam content may include scenarios involving dynamic content personalization
  and adaptive user experiences.

Exam Area: Personalization and decision-making with AI.
---------------------------------------------------------------------------
*/
resource cognitiveServicesPersonalizer 'Microsoft.CognitiveServices/accounts@2022-12-01' = {
  name: '${prefix}personalizer${uniqueSuffix}'
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'Personalizer'
  properties: {
    apiProperties: {}
  }
}

/*
---------------------------------------------------------------------------
Azure Machine Learning Workspace
---------------------------------------------------------------------------
This resource deploys an Azure Machine Learning (AML) Workspace that provides
a comprehensive environment for model building, training, and deployment.

Significance in Azure AI-102 Exam:
• Central to managing the machine learning lifecycle and operationalizing AI models.
• Exam scenarios may involve model deployment, experimentation, and integration
  with other services.

Exam Area: Machine Learning Operations (MLOps) and model management.
---------------------------------------------------------------------------
*/
resource amlWorkspace 'Microsoft.MachineLearningServices/workspaces@2021-03-01' = {
  name: '${prefix}aml${uniqueSuffix}'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    friendlyName: 'Comprehensive AML Workspace'
    description: 'Workspace for deploying and managing AI experiments and models.'
  }
}

/*
---------------------------------------------------------------------------
Azure Bot Service
---------------------------------------------------------------------------
This resource registers an Azure Bot Service which enables the development
of conversational AI applications.

Significance in Azure AI-102 Exam:
• Demonstrates skills in building and integrating chatbots.
• Exam topics may include deploying bot frameworks, managing bot endpoints,
  and integrating with other Azure AI services.

Exam Area: Conversational AI and Bot development.
---------------------------------------------------------------------------
*/
resource botService 'Microsoft.BotService/botServices@2021-05-01-preview' = {
  name: '${prefix}bot${uniqueSuffix}'
  location: location
  sku: {
    name: 'F0'
  }
  kind: 'registration'
  properties: {
    displayName: 'Azure AI Bot'
    description: 'Bot service for developing conversational AI solutions.'
    endpoint: botEndpoint
    msaAppId: '' // Optionally, specify your Microsoft App ID if available
  }
}

/*
---------------------------------------------------------------------------
Azure Cognitive Search
---------------------------------------------------------------------------
This resource deploys Azure Cognitive Search, an AI-powered search service
that enables indexing and searching of data with built-in cognitive skills.

Significance in Azure AI-102 Exam:
• Combines search with AI enrichment for improved data insights.
• Exam scenarios may include creating search solutions that integrate AI for
  data extraction, natural language processing, and filtering.

Exam Area: Data search and enrichment using AI.
---------------------------------------------------------------------------
*/
resource cognitiveSearch 'Microsoft.Search/searchServices@2020-08-01' = {
  name: '${prefix}search${uniqueSuffix}'
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
  }
}

/*
---------------------------------------------------------------------------
Outputs
---------------------------------------------------------------------------
These outputs expose key resource identifiers and endpoints for further integration or testing.
---------------------------------------------------------------------------
*/
output cognitiveServicesGenericName string = cognitiveServicesGeneric.name
output cognitiveServicesFaceName string = cognitiveServicesFace.name
output cognitiveServicesSpeechName string = cognitiveServicesSpeech.name
output cognitiveServicesFormRecognizerName string = cognitiveServicesFormRecognizer.name
output cognitiveServicesOpenAIName string = cognitiveServicesOpenAI.name
output cognitiveServicesTextAnalyticsName string = cognitiveServicesTextAnalytics.name
output cognitiveServicesTranslatorName string = cognitiveServicesTranslator.name
output cognitiveServicesAnomalyDetectorName string = cognitiveServicesAnomalyDetector.name
output cognitiveServicesPersonalizerName string = cognitiveServicesPersonalizer.name
output amlWorkspaceId string = amlWorkspace.id
output botServiceEndpoint string = botService.properties.endpoint
output cognitiveSearchHostName string = cognitiveSearch.properties.hostName
