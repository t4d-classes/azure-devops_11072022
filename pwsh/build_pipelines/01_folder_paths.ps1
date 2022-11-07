# Source code is checked out to here
$location = Get-location
Write-Host "Current Working Directory: $($location)"

# The local path on the agent where your source code files are downloaded. For
# example: c:\agent_work\1\s
Write-Host "System Default Working Directory: $(System.DefaultWorkingDirectory)"

# The local path on the agent where your source code files are downloaded. For
# example: c:\agent_work\1\s
Write-Host "Build Sources Directory: $(Build.SourcesDirectory)"

# The local path on the agent where any artifacts are copied to before being
# pushed to their destination. For example: c:\agent_work\1\a
Write-Host "Build Staging Directory: $(Build.StagingDirectory)"

# The local path on the agent where the test results are created. For example: 
# c:\agent_work\1\TestResults
Write-Host "Common Test Results Directory $(Common.TestResultsDirectory)"

# The directory the agent is installed into. This contains the agent software.
# For example: c:\agent.
Write-Host "Agent Home Directory: $(Agent.HomeDirectory)"

# The working directory for this agent. For example: c:\agent_work. 
Write-Host "Agent Work Folder: $(Agent.WorkFolder)"

# The local path on the agent where all folders for a given build pipeline are
# created. This variable has the same value as Pipeline.Workspace.
Write-Host "Agent Build Directory: $(Agent.BuildDirectory)"

# The directory used by tasks such as Node Tool Installer and Use Python
# Version to switch between multiple versions of a tool. These tasks will add
# tools from this directory to PATH so that subsequent build steps can use them. 
Write-Host "Agent Tools Directory: $(Agent.ToolsDirectory)"

# A temporary folder that is cleaned after each pipeline job. This directory is
# used by tasks such as .NET Core CLI task to hold temporary items like test
# results before they are published.
Write-Host "Agent Temp Directory: $(Agent.TempDirectory)"
