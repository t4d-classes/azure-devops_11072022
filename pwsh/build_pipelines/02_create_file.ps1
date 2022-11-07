
Write-Host "Create File"

dir

dir | Out-File -FilePath $(Agent.TempDirectory)\folder_dir_$(Build.BuildId).txt