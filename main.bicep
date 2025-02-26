// ---------------------------------------------------------------------------
// Azure AI Services Deployment Template for AI-102 Exam Practice
// ---------------------------------------------------------------------------
// This template deploys a broad range of Azure AI services that are essential
// for hands-on exam practice. It includes accounts for Generic Cognitive Services,
// Computer Vision, Custom Vision (Training & Prediction), Face API, Form Recognizer,
// Immersive Reader, OpenAI (with Defender and RAI policies), Speech Services,
// Text Analytics, Translator, and Azure Cognitive Search.
// 
// Resources that couldn’t be deployed earlier due to subscription limitations
// (e.g. Bot Service, Anomaly Detector, Personalizer) are retained as commented-out
// sections with updated comments. Users can uncomment and modify them if their
// environment supports these services.
// ---------------------------------------------------------------------------

@description('Location for all resources')
param location string = resourceGroup().location

// Resource names – supply unique names via the parameters file.
@description('Name for Generic Cognitive Services account')
param accounts_aicoggeneric6hroqbahqstok_name string

@description('Name for Computer Vision account')
param accounts_aicomputervision_1_name string

@description('Name for Custom Vision Training account')
param accounts_aicustomvision1_name string

@description('Name for Custom Vision Prediction account')
param accounts_aicustomvision1_Prediction_name string

@description('Name for Face API account')
param accounts_aiface6hroqbahqstok_name string

@description('Name for Form Recognizer account')
param accounts_aiformrecog6hroqbahqstok_name string

@description('Name for Immersive Reader account')
param accounts_aiimmersivereader_001_name string

@description('Name for OpenAI service account')
param accounts_aiopenai6hroqbahqstok_name string

@description('Name for Speech Services account')
param accounts_aispeech6hroqbahqstok_name string

@description('Name for Text Analytics account')
param accounts_aitextanalytics6hroqbahqstok_name string

@description('Name for Translator account')
param accounts_aitranslator6hroqbahqstok_name string

@description('Name for Azure Cognitive Search service')
param searchServices_aisearch6hroqbahqstok_name string

// ---------------------------------------------------------------------------
// Resource Deployments
// ---------------------------------------------------------------------------

/*
----------------------------------------------------------
Generic Cognitive Services Account
----------------------------------------------------------
Provides a multi-purpose Cognitive Services endpoint.
----------------------------------------------------------
*/
resource genericCogServices 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aicoggeneric6hroqbahqstok_name
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'CognitiveServices'
  properties: {
    apiProperties: {}
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Computer Vision Account
----------------------------------------------------------
Enables image analysis (OCR, object detection, etc.).
----------------------------------------------------------
*/
resource computerVision 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aicomputervision_1_name
  location: location
  sku: {
    name: 'F0'
  }
  kind: 'ComputerVision'
  properties: {
    customSubDomainName: accounts_aicomputervision_1_name
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Custom Vision Training Account
----------------------------------------------------------
Used to train custom image classification/object detection models.
----------------------------------------------------------
*/
resource customVisionTraining 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aicustomvision1_name
  location: location
  sku: {
    name: 'F0'
  }
  kind: 'CustomVision.Training'
  properties: {
    customSubDomainName: accounts_aicustomvision1_name
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Custom Vision Prediction Account
----------------------------------------------------------
Used for serving predictions from your custom vision models.
----------------------------------------------------------
*/
resource customVisionPrediction 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aicustomvision1_Prediction_name
  location: location
  sku: {
    name: 'F0'
  }
  kind: 'CustomVision.Prediction'
  properties: {
    customSubDomainName: accounts_aicustomvision1_Prediction_name
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Face API Account
----------------------------------------------------------
Enables facial recognition and emotion detection.
----------------------------------------------------------
*/
resource faceApi 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aiface6hroqbahqstok_name
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'Face'
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Form Recognizer Account
----------------------------------------------------------
Automates extraction of information from forms/documents.
----------------------------------------------------------
*/
resource formRecognizer 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aiformrecog6hroqbahqstok_name
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'FormRecognizer'
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Immersive Reader Account
----------------------------------------------------------
Provides immersive reading and comprehension capabilities.
----------------------------------------------------------
*/
resource immersiveReader 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aiimmersivereader_001_name
  location: location
  sku: {
    name: 'S1'
  }
  kind: 'ImmersiveReader'
  identity: {
    type: 'None'
  }
  properties: {
    customSubDomainName: accounts_aiimmersivereader_001_name
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
OpenAI Service Account
----------------------------------------------------------
Provides access to advanced language models for generative AI tasks.
----------------------------------------------------------
*/
resource openAI 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aiopenai6hroqbahqstok_name
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'OpenAI'
  properties: {
    apiProperties: {}
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Speech Services Account
----------------------------------------------------------
Supports speech-to-text, text-to-speech, and speaker recognition.
----------------------------------------------------------
*/
resource speechServices 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aispeech6hroqbahqstok_name
  location: location
  sku: {
    name: 'S0'
  }
  kind: 'SpeechServices'
  properties: {
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Text Analytics Account
----------------------------------------------------------
Enables sentiment analysis, key phrase extraction, and entity recognition.
----------------------------------------------------------
*/
resource textAnalytics 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aitextanalytics6hroqbahqstok_name
  location: location
  sku: {
    name: 'F0'
  }
  kind: 'TextAnalytics'
  properties: {
    apiProperties: {}
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Translator Account
----------------------------------------------------------
Provides text translation capabilities.
----------------------------------------------------------
*/
resource translator 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: accounts_aitranslator6hroqbahqstok_name
  location: location
  sku: {
    name: 'S0'
  }
  // Deployed as a generic Cognitive Services account.
  kind: 'CognitiveServices'
  properties: {
    apiProperties: {}
    publicNetworkAccess: 'Enabled'
  }
}

/*
----------------------------------------------------------
Azure Cognitive Search Service
----------------------------------------------------------
Offers AI-powered indexing and search capabilities.
----------------------------------------------------------
*/
resource cognitiveSearch 'Microsoft.Search/searchServices@2024-06-01-preview' = {
  name: searchServices_aisearch6hroqbahqstok_name
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'Default'
    publicNetworkAccess: 'Enabled'
    networkRuleSet: {
      ipRules: []
      bypass: 'None'
    }
    encryptionWithCmk: {
      enforcement: 'Unspecified'
    }
    disableLocalAuth: false
    authOptions: {
      apiKeyOnly: {}
    }
    disabledDataExfiltrationOptions: []
    semanticSearch: 'disabled'
  }
}

/*
----------------------------------------------------------
OpenAI Defender and RAI Policies
----------------------------------------------------------
Configures content filtering policies on the OpenAI account.
----------------------------------------------------------
*/
resource openAIDefender 'Microsoft.CognitiveServices/accounts/defenderForAISettings@2024-10-01' = {
  name: '${openAI.name}/Default'
  dependsOn: [
    openAI
  ]
  properties: {
    state: 'Disabled'
  }
}

resource openAIRAIPolicies1 'Microsoft.CognitiveServices/accounts/raiPolicies@2024-10-01' = {
  name: '${openAI.name}/Microsoft.Default'
  dependsOn: [
    openAI
  ]
  properties: {
    mode: 'Blocking'
    contentFilters: [
      {
        name: 'Hate'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      },
      {
        name: 'Hate'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      },
      {
        name: 'Sexual'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      },
      {
        name: 'Sexual'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      },
      {
        name: 'Violence'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      },
      {
        name: 'Violence'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      },
      {
        name: 'Selfharm'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      },
      {
        name: 'Selfharm'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      }
    ]
  }
}

resource openAIRAIPolicies2 'Microsoft.CognitiveServices/accounts/raiPolicies@2024-10-01' = {
  name: '${openAI.name}/Microsoft.DefaultV2'
  dependsOn: [
    openAI
  ]
  properties: {
    mode: 'Blocking'
    contentFilters: [
      {
        name: 'Hate'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      },
      {
        name: 'Hate'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      },
      {
        name: 'Sexual'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      },
      {
        name: 'Sexual'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      },
      {
        name: 'Violence'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      },
      {
        name: 'Violence'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      },
      {
        name: 'Selfharm'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      },
      {
        name: 'Selfharm'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      },
      {
        name: 'Jailbreak',
        blocking: true,
        enabled: true,
        source: 'Prompt'
      },
      {
        name: 'Protected Material Text',
        blocking: true,
        enabled: true,
        source: 'Completion'
      },
      {
        name: 'Protected Material Code',
        blocking: false,
        enabled: true,
        source: 'Completion'
      }
    ]
  }
}

/*
----------------------------------------------------------
Commented-Out Resources (Due to Limitations)
----------------------------------------------------------
// The following resources are not deployed due to subscription quota/feature 
// restrictions or configuration complexities. Uncomment and adjust if your environment supports them.

// --- Azure Bot Service ---
// Enables conversational bot development. Requires a unique Microsoft App ID.
// resource botService 'Microsoft.BotService/botServices@2021-05-01-preview' = {
//   name: '${prefix}bot${uniqueSuffix}'
//   location: location
//   sku: {
//     name: 'F0'
//   }
//   kind: 'registration'
//   properties: {
//     displayName: 'Azure AI Bot'
//     description: 'Bot service for developing conversational AI solutions.'
//     endpoint: '<your-bot-endpoint>'
//     msaAppId: '<your-unique-microsoft-app-id>'
//   }
// }

// --- Cognitive Services - Anomaly Detector ---
// Detects anomalies in time series data. Not deployed due to SKU limitations.
// resource anomalyDetector 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
//   name: '${prefix}anomaly${uniqueSuffix}'
//   location: location
//   sku: {
//     name: 'F0'
//   }
//   kind: 'AnomalyDetector'
//   properties: {
//     apiProperties: {}
//     publicNetworkAccess: 'Enabled'
//   }
// }

// --- Cognitive Services - Personalizer ---
// Delivers personalized content using reinforcement learning.
// resource personalizer 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
//   name: '${prefix}personalizer${uniqueSuffix}'
//   location: location
//   sku: {
//     name: 'F0'
//   }
//   kind: 'Personalizer'
//   properties: {
//     apiProperties: {}
//     publicNetworkAccess: 'Enabled'
//   }
// }
*/

/*
----------------------------------------------------------
Outputs
----------------------------------------------------------
*/
output genericCogName string = genericCogServices.name
output computerVisionName string = computerVision.name
output customVisionTrainingName string = customVisionTraining.name
output customVisionPredictionName string = customVisionPrediction.name
output faceApiName string = faceApi.name
output formRecognizerName string = formRecognizer.name
output immersiveReaderName string = immersiveReader.name
output openAIName string = openAI.name
output speechServicesName string = speechServices.name
output textAnalyticsName string = textAnalytics.name
output translatorName string = translator.name
output cognitiveSearchHostName string = cognitiveSearch.properties.hostName
output openAIDefenderState string = openAIDefender.properties.state
