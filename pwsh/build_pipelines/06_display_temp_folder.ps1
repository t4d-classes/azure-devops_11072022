# Run this in the first stage as the last task to see the temp folder populated
# Run this in the second state as the first tasks to see the temp folder emptied

Write-Host "Contents of Temp Directory"

dir $(Agent.TempDirectory)

Write-Host "Content of Staging Directory"

dir $(Build.StagingDirectory)