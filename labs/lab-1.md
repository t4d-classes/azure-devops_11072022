# Lab 1 - Create a New Project

## Lab Objectives

- Create a new Azure DevOps project
- Connect Visual Studio to the Azure DevOps project
- Create a new solution and push the solution to Azure Repositories

## Lab Steps

**Step 1.** Open a web browser, and log into the Azure Devops web portal.

- Url: https://<YOUR_SUBDOMAIN>.databots.cloud
- Email Address: devopsuser
- Password: %GET PASSWORD FROM INSTRUCTOR%

**Step 2.** In Azure DevOps web portal, under the "DefaultCollection" create a new project named "WebAPI". The new project description may be left blank. Before clicking "Create", click on "Advanced" and select TFVC for the version control system. Leave the work item process set to "Basic".

**Step 3.** Open Visual Studio 2019, turn on Team Explorer by clicking the `View` menu item, and then selecting the `Team Explorer` submenu item. The Team Explorer should be added as a tab within the Solution Explorer tab group. Click on the Team Explorer tab. Click on `Connect...` under Azure DevOps.

**Step 4.** The `Connect to a Project` dialog will appear. Click on `Add Azure DevOps Server`.

- For the server URL, enter the following URL, then click `Add`.

```text
https://<YOUR_SUBDOMAIN>.databots.cloud
```

When prompted for credentials, enter the following credentials:

- Email Address: devopsuser
- Password: %GET PASSWORD FROM INSTRUCTOR%

**Step 5.** Expand out the tree and find "WebAPI". Select "$/WebAPI" and click the `Connect` button.

**Step 6.** Once connected to the WebAPI project, click "Map & Get". Verify a new "WebAPI" folder has been created under "source\Workspaces".

**Step 7.** Create a new Blank Solution named "WebAPI" in the "source\Workspaces\WebAPI" folder.

**Step 8.** Add two projects to the solution:

- API project
  - Language: C# (select the C# project not the F# project)
  - Project Name: WebAPI.Web
  - Target Framework: .NET Core 3.1
  - Authentication Type: None
  - Configure for HTTPS: Checked
  - Enable Docker: Not Checked

- xUnit Test project (.NET Core)
  - Language: C#
  - Project Name: WebAPI.Tests
  - Target Framework: .NET Core 3.1

**Step 9.** Add a project reference to the "WebAPI.Web" project to the "WebAPI.Tests" project.

**Step 10.** Run the WebAPI.Web project by clicking the `IIS Express` button with the green arrow. Verify a web browser loads and weather forecast JSON is displayed.

**Step 11.** From the `View` menu, click the `Test Explorer` and dock it to the left side of Visual Studio.

**Step 12.** Run the tests by clicking the double green arrow button. They should all pass as indicated by green check marks.

**Step 13.** Right click on the Solution in the Solution Explorer, click `Add Solution to Source Control`

**Step 14.** Go to Team Explorer, click on `Pending Changes` to review the changes.

**Step 15.** Enter a comment into the Check In `Comment` input field. Something similar to "Initial Check In" is good. Then, click the `Check In` button. If prompted, confirm the check in by clicking `Yes`. Note the Changeset number after the check in has been completed.

**Step 16.** Switch back to the web browser, then for the "WebAPI" project in Azure DevOps click the `Repos` sidebar link . Explore the files and changesets for the new solution that was created and checked into TFVC.

**Step 17.** Within Visual Studio, open the "Controllers\WeatherForecastController.cs" file in the "WebAPI.Web" project. Change the word "Bracing" to "Cold".

**Step 18.** Review the pending changes and check in the changes.

**Step 19.** Review the files and changsets in Azure Repos to verify they were all successfully checked in.
