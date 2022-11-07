

$content = Get-Content $(Agent.TempDirectory)\folder_dir_$(Build.BuildId).txt

Write-Host "Read File"
Write-Host $content