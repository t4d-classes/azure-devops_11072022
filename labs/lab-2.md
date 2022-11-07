# Lab 2 - Setup a Build Agent

## Lab Objectives

- Understand the Relationship between Azure DevOps, Build Agents and Code
- Configure a Self-Hosted Build Agent

## Lab Steps

**Step 1.** Remote Desktop into the Azure DevOps Server with the following information:

- Host: <YOUR_SUBDOMAIN>.databots.cloud
- Username: devopsuser
- Password: %GET PASSWORD FROM INSTRUCTOR%

**Step 2.** On the remove desktop, open a browser, and browse to the local URL for your Azure DevOps web poral. Ask the instructor for the local URL if you do not know it. Login with the following credentials.

- Username: devopsuser
- Password: %GET PASSWORD FROM INSTRUCTOR%

Note: You may be asked to use a PAT. If you are, then use the PAT process demoed in class.

**Step 3.** When you login you should be in the "DefaultCollection". In the bottom left-hand corner, click the `Collection Settings` link.

**Step 4.** In the sidebar, under `Pipelines`, click the `Agent pools` link.

**Step 5.** Click the `Default` pool.

**Step 6.** In the top menu, click the `Agents` link.

**Step 7.** Click the `New Agent` button located in the upper right-hand corner.

**Step 8.** When the `Get the agent` dialog appears, ensure that `Windows` and `x64` are clicked.

**Step 9.** Click `Download` to download the agent to your downloads folder.

**Step 10.** Change to `c:\`.

```bash
cd c:\
```

**Step 11.** Create folder named `agent`. If a folder by that name exists, create a new folder named `agent2`. Change into the folder your created.

```bash
mkdir agent

cd agent
```

**Step 12.** Run the following command to install the agent into the current folder. You can copy and paste the entire command. Note: the version number below may not match version number of the agent downloaded. Update the command below to use the correct version number, if needed.

```bash
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-2.181.2.zip", "$PWD")
```

**Step 13.** Run the Build Agent configure script and enter the following values to configure the agent.

```bash
.\config.cmd
```

- Server URL: %YOUR_AZURE_DEVOPS_WEB_PORTAL_URL%
- Authentication Type: Integrated
- Agent Pool: Default
- Agent Name: agent (or agent2 if agent already exists)
- Work Folder: _work
- Perform an Unzip: No
- Run Agent as Service: Yes
- Enter User account to use for the service: NT AUTHORITY\NETWORK SERVICE

NOTE: PLEASE DO NOT RUN THE COMMANDS FOR USING THE AGENT INTERACTIVELY.

**Step 15.** Verify the new Build Agent has been added to the Agents list in the Azure DevOps web portal. The new Build Agent should be online (give it a few moments for the light to turn green). The agent will be used in the remaining labs, but there is nothing to run now.

**Step 16.** Verify the new agent has been added as service. Right click on the `Start` button, click `Computer Management`. Expand `Services` under `Services and Applications` and look for `Azure DevOps Pipelines Agent`. Ensure the service is started.
