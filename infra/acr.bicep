@description('A globally unique for your container registry. Default: concat(acr, uniqueString)')
param registryName string = 'acr${uniqueString(resourceGroup().id)}'

@description('The location (region) for the registry. Default: resource group region.')
param registryLocation string = resourceGroup().location

@description('Service tier (sku) of the acr resource.')
param registrySku string = 'Basic'

resource acrResource 'Microsoft.ContainerRegistry/registries@2025-04-01' = {
    name: registryName
    location: registryLocation
    sku: { 
        name: registrySku 
    }
    properties: {
        adminUserEnabled: false
    }
}

@description('Output: Login server for reference.')
output loginServer string = acrResource.properties.loginServer
