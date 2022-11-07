$artifactName = "WebApi Archive"
$artifactFile = "$(Build.StagingDirectory)\WebApi.zip"

Compress-Archive $(outputFolder) $artifactFile
Write-Host "##vso[artifact.upload artifactname=$($artifactName)]$($artifactFile)"