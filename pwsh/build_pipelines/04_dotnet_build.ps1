# https://learn.microsoft.com/en-us/azure/devops/pipelines/scripts/logging-commands?view=azure-devops&tabs=bash

$outputFolder = "$(Agent.TempDirectory)\WebApi"
dotnet build --output $outputFolder
Write-Host "##vso[task.setvariable variable=outputFolder;]$outputFolder"




