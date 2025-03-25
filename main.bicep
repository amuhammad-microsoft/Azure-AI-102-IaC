// ---------------------------------------------------------------------------
// Azure AI Services Deployment Template for AI-102 Exam Practice
// ---------------------------------------------------------------------------
// This template deploys a broad range of Azure AI services that are essential
// for hands-on exam practice and skill development. Each resource name is
// constructed from an object parameter (with a prefix, a random value, and an
// optional user-supplied suffix) following Azure CAF best practices.
// 
// Deployed Resources:
//   - Generic Cognitive Services Account        (Exam: Cognitive Services Integration)
//   - Computer Vision Account                   (Exam: Computer Vision)
//   - Custom Vision Training Account            (Exam: Custom Vision & Model Training)
//   - Custom Vision Prediction Account          (Exam: Custom Vision & Model Prediction)
//   - Face API Account                          (Exam: Facial Analysis)
//   - Form Recognizer Account                   (Exam: Document Understanding)
//   - Immersive Reader Account                  (Exam: Accessibility & Enhanced Reading)
//   - Speech Services Account                   (Exam: Speech Processing)
//   - Text Analytics Account                    (Exam: Natural Language Processing)
//   - Translator Account                        (Exam: Language Translation)
//   - Azure Cognitive Search Service            (Exam: Data Search & Enrichment)
//   - Azure Open AI Service Account             (Exam: OpenAI Integration)
// 
// ---------------------------------------------------------------------------

@description('Location for all resources')
param location string = resourceGroup().location

// ---------------------------------------------------------------------------
// Naming Parameters: Each is an object with keys: prefix, randValue, userSuffix
// The final resource name is: ${prefix}${randValue}${userSuffix}
// ---------------------------------------------------------------------------
@description('Naming object for Generic Cognitive Services account')
param aicoggeneric object

@description('Naming object for Computer Vision account')
param aicomputervision object

@description('Naming object for Custom Vision Training account')
param aicustomvision1 object

@description('Naming object for Custom Vision Prediction account')
param aicustomvision1Prediction object

@description('Naming object for Face API account')
param aiface object

@description('Naming object for Form Recognizer account')
param aiformrecog object

@description('Naming object for Immersive Reader account')
param aiimmersivereader object

@description('Naming object for OpenAI service account')
param aiopenai object

@description('Naming object for Speech Services account')
param aispeech object

@description('Naming object for Text Analytics account')
param aitextanalytics object

@description('Naming object for Translator account')
param aitranslator object

@description('Naming object for Azure Cognitive Search service')
param aisearch object = {
  prefix: 'aisearch'
  randValue: uniqueString(resourceGroup().id)
  userSuffix: 'svc'
}

// ---------------------------------------------------------------------------
// Variables: Build final resource names using the naming objects
// ---------------------------------------------------------------------------
var genericName = '${aicoggeneric.prefix}${aicoggeneric.randValue}${aicoggeneric.userSuffix}'
var computerVisionName = '${aicomputervision.prefix}${aicomputervision.randValue}${aicomputervision.userSuffix}'
var customVisionTrainingName = '${aicustomvision1.prefix}${aicustomvision1.randValue}${aicustomvision1.userSuffix}'
var customVisionPredictionName = '${aicustomvision1Prediction.prefix}${aicustomvision1Prediction.randValue}${aicustomvision1Prediction.userSuffix}'
var faceApiName = '${aiface.prefix}${aiface.randValue}${aiface.userSuffix}'
var formrecogName = '${aiformrecog.prefix}${aiformrecog.randValue}${aiformrecog.userSuffix}'
var immersiveReaderName = '${aiimmersivereader.prefix}${aiimmersivereader.randValue}${aiimmersivereader.userSuffix}'
var openaiName = '${aiopenai.prefix}${aiopenai.randValue}${aiopenai.userSuffix}'
var speechName = '${aispeech.prefix}${aispeech.randValue}${aispeech.userSuffix}'
var textanalyticsName = '${aitextanalytics.prefix}${aitextanalytics.randValue}${aitextanalytics.userSuffix}'
var translatorName = '${aitranslator.prefix}${aitranslator.randValue}${aitranslator.userSuffix}'
// Convert the entire search name to lowercase for compliance.
var searchName = toLower('${aisearch.prefix}${aisearch.randValue}${aisearch.userSuffix}')

// ---------------------------------------------------------------------------
// Resource Deployments
// ---------------------------------------------------------------------------

/*
------------------------------------------------------------------------------
Generic Cognitive Services Account
------------------------------------------------------------------------------
Provides a multi-purpose endpoint for various cognitive capabilities.
----------------------------------------------------------
*/
resource genericCogServices 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: genericName
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
  name: computerVisionName
  location: location
  sku: {
    name: 'S1'
  }
  kind: 'ComputerVision'
  properties: {
    customSubDomainName: computerVisionName
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
**Note:** If you get an error stating that CustomVision.Training is unavailable in this region, deploy in a supported region (e.g., eastus2).
----------------------------------------------------------
*/
resource customVisionTraining 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: customVisionTrainingName
  location: 'eastus2'
  sku: {
    name: 'S0'
  }
  kind: 'CustomVision.Training'
  properties: {
    customSubDomainName: customVisionTrainingName
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
**Note:** Deployed to "eastus" for service availability.
----------------------------------------------------------
*/
resource customVisionPrediction 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: customVisionPredictionName
  location: 'eastus'
  sku: {
    name: 'S0'
  }
  kind: 'CustomVision.Prediction'
  properties: {
    customSubDomainName: customVisionPredictionName
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
  name: faceApiName
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
Automates extraction of structured data from forms and documents.
----------------------------------------------------------
*/
resource formRecognizer 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: formrecogName
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
Provides advanced reading and comprehension capabilities.
----------------------------------------------------------
*/
resource immersiveReader 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: immersiveReaderName
  location: location
  sku: {
    name: 'S1'
  }
  kind: 'ImmersiveReader'
  identity: {
    type: 'None'
  }
  properties: {
    customSubDomainName: immersiveReaderName
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    publicNetworkAccess: 'Enabled'
  }
}

//----------------------------------------------------------
// OpenAI Service Account 
// ----------------------------------------------------------
resource openAI 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: openaiName
  location: 'eastus'
  sku: {
    name: 'S0'
  }
  kind: 'OpenAI'
  properties: {
    apiProperties: {}
    customSubDomainName: openaiName
    networkAcls: {
      defaultAction: 'Allow'
      virtualNetworkRules: []
      ipRules: []
    }
    publicNetworkAccess: 'Enabled'
  }
}

resource openAIDefender 'Microsoft.CognitiveServices/accounts/defenderForAISettings@2024-10-01' = {
  name: 'Default'
  parent: openAI
  properties: {
    state: 'Disabled'
  }
}

resource openAIRAIPolicies1 'Microsoft.CognitiveServices/accounts/raiPolicies@2024-10-01' = {
  name: 'Microsoft.Default'
  parent: openAI
  properties: {
    mode: 'Blocking'
    contentFilters: [
      {
        name: 'Hate'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
      {
        name: 'Hate'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      }
      {
        name: 'Sexual'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
      {
        name: 'Sexual'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      }
      {
        name: 'Violence'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
      {
        name: 'Violence'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      }
      {
        name: 'Selfharm'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
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
  name: 'Microsoft.DefaultV2'
  parent: openAI
  properties: {
    mode: 'Blocking'
    contentFilters: [
      {
        name: 'Hate'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
      {
        name: 'Hate'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      }
      {
        name: 'Sexual'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
      {
        name: 'Sexual'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      }
      {
        name: 'Violence'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
      {
        name: 'Violence'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      }
      {
        name: 'Selfharm'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
      {
        name: 'Selfharm'
        severityThreshold: 'Medium'
        blocking: true
        enabled: true
        source: 'Completion'
      }
      {
        name: 'Jailbreak'
        blocking: true
        enabled: true
        source: 'Prompt'
      }
      {
        name: 'Protected Material Text'
        blocking: true
        enabled: true
        source: 'Completion'
      }
      {
        name: 'Protected Material Code'
        blocking: false
        enabled: true
        source: 'Completion'
      }
    ]
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
  name: speechName
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
  name: textanalyticsName
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
Provides robust text translation capabilities.
----------------------------------------------------------
*/
resource translator 'Microsoft.CognitiveServices/accounts@2024-10-01' = {
  name: translatorName
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
Azure Cognitive Search Service
----------------------------------------------------------
Offers AI-powered indexing and search capabilities.
----------------------------------------------------------
*/
resource cognitiveSearch 'Microsoft.Search/searchServices@2024-06-01-preview' = {
  name: searchName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
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
output cognitiveSearchHostName string = cognitiveSearch.properties.status
