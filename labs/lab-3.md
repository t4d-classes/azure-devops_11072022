# Lab 3 - Setup a Build Pipeline

## Lab Objectives

- Build the application with build pipeline
- Trigger the build with code check ins
- Explore pipeline tasks

## Lab Steps

**Step 1.** Using a web browser, navigate to the WebAPI project in the Azure DevOps web portal.

**Step 2.** On the side menu, mouse over the "Pipelines" link, and click the "Pipelines" submenu link.

**Step 3.** Click the button "Create Pipeline".

**Step 4.** Each pipeline needs to start with a source code location. Select "Team Foundation Version Control".

**Step 5.** The source control location could contain many projects, so for "Server Path" select the folder under "WebAPI" that contains the solution file. Click Continue.

**Step 6.** There are many templates to choose from for different kinds of pipelines for different kinds of programming technologies. For this first pipeline, let's create an empty pipeline and add the needed tasks manually. Click "Empty Job" at the top.

**Step 7.** Name the pipeline "WebAPI Build and Validate".

**Step 8.** For Agent Pool, select the Default Agent Pool (this pool contains the Build Agent created earlier).

**Step 9.** On the left pane, click "Agent job 1". Modify the "Display name" to be "Build WebAPI".

**Step 10.** On the left pane, click the plus sign "+" on the Agent Job (Build WebAPI) blade.

**Step 11.** On the right pane, select the "Use .NET Core" task. This will add the task to the end of the Agent Job of Pipeline. Feel free to use the search box to search on ".NET" to see a smaller list of tasks from which to choose. Configure it as shown here:

- Display Name: Use .NET Core sdk 3.1.x
- Package to install: SDK (contains runtime)
- Version: 3.1.x
- Compatible Visual Studio version: 16.11.20
- Path to Install .Net Core: $(Agent.ToolsDirectory)/dotnet

**Step 12.** Once again add a new task, select the ".NET Core" task and click the "Add" button.

**Step 13.** On the left pane, click the "dotnet build" task. View the settings. Observe the "Display name" and the "Command" of the task. Update `Arguments` input field to have the following value:

```test
--output $(Build.ArtifactStagingDirectory)
```

**Step 14.** On the menu above the panes, click the "Triggers" menu item.

**Step 15.** On the right pane, check the checkbox for "Enable continuous integration".

**Step 16.** On the menu above the panes, click the "Save & queue" down arrow to revale the drop down button menu. Select "Save" to only save the pipeline, not to run it.

**Step 17.** Leave the folder as a backslash. Enter the following comment: "Build WebAPI Application".

**Step 18.** On the side menu, mouse over the "Pipelines" link, and click the "Pipelines" submenu link. The new pipeline should now be listed.

**Step 19.** Mouse over the pipeline in the list and observe the three dot button on the right side. Click it and then click on "Run pipeline".

**Step 20.** Do not modify any of the settings, simply click the "Run" button at the bottom.

**Step 21.** The pipeline will queue up the build job. To view details of the run, click on the job in the list. Click on the various tasks to see the output. The output from the tasks is useful to view successes and failures.

**Step 22.** Once all of the tasks have green check marks the build is complete.

**Step 23.** Within Visual Studio, open the "Controllers\WeatherForecastController.cs" file in the "WebAPI.Web" project. Make the following code change (copy and paste is the preferred way to do this).

Change this code:

```bash
private static readonly string[] Summaries = new[]
{
  "Freezing", "Cold", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
};
```

To this code:

```bash
private static readonly int[] Summaries = new[]
{
  "Freezing", "Cold", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
};
```

**Step 24.** The code should now be broken (do not fix it). Review the pending changes and check in the changes.

**Step 25.** Within the Azure DevOps web portal, view the pipelines list and click on the pipeline created.

**Step 26.** The pipeline should have queued up a build job when the code was committed. This is how continuous integration worls.

**Step 27.** The build should fail. Navigate the pipeline and build steps to view the error. You should see an error similar to this:

```bash
Starting: dotnet build
==============================================================================
Task         : .NET Core
Description  : Build, test, package, or publish a dotnet application, or run a custom dotnet command
Version      : 2.181.0
Author       : Microsoft Corporation
Help         : https://docs.microsoft.com/azure/devops/pipelines/tasks/build/dotnet-core-cli
==============================================================================
C:\Windows\system32\chcp.com 65001
Active code page: 65001
Info: .NET Core SDK/runtime 2.2 and 3.0 are now End of Life(EOL) and have been removed from all hosted agents. If you're using these SDK/runtimes on hosted agents, kindly upgrade to newer versions which are not EOL, or else use UseDotNet task to install the required version.
"C:\Program Files\dotnet\dotnet.exe" build "-dl:CentralLogger,\"C:\agent\_work\_tasks\DotNetCoreCLI_5541a522-603c-47ad-91fc-a4b1d163081b\2.181.0\dotnet-build-helpers\Microsoft.TeamFoundation.DistributedTask.MSBuild.Logger.dll\"*ForwardingLogger,\"C:\agent\_work\_tasks\DotNetCoreCLI_5541a522-603c-47ad-91fc-a4b1d163081b\2.181.0\dotnet-build-helpers\Microsoft.TeamFoundation.DistributedTask.MSBuild.Logger.dll\""
MSBuild version 17.3.2+561848881 for .NET
  Determining projects to restore...
  All projects are up-to-date for restore.
##[error]WebAPI.Web\Controllers\WeatherForecastController.cs(14,47): Error CS0029: Cannot implicitly convert type 'string[]' to 'int[]'
```

**Step 28.** Undo the code change in Visual Studio, check in the fix, and verify the build passes successfully.

**Step 29.** Add a new task. Search for the "Publish build artifacts" task and add it to the pipeline. Do not add the "Pipeline Publish Artifacts" task.

**Step 30.** Update the `Artifact name` input field to: "WebAPI".

**Step 31.** Enqueue a pipeline run, and review the status page of the run. When run is complete, view the artifacts produced by the build.
