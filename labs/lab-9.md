# Lab 9 - Configure Pipeline Task with a Variable Group

## Lab Objectives

- Configure a Variable Group for the code coverage configuration
- Modify the code coverage configuration to pass the test

## Lab Steps

**Step 1.** On the far left-hand menu, under `Pipelines`, click the `Library` submenu item.

**Step 2.** On the `Library` top menu, click the `+ Variable Group` menu item.

**Step 3.** Name the variable group:

```text
Coverage
```

**Step 4.** Enable `Allow access to all pipelines`.

**Step 5.** Add the following variables and their values.

- coverageMinThreshold: `80`
- coverageOutputFile: `CoverageResults\coverage.cobertura.xml`
- coverageOutputFormat: `cobertura`

**Step 6.** Save the Coverage Variable Group.

**Step 7.** Edit the WebAPI Build and Validate Pipeline created in the previous lab exercises.

**Step 8.** Edit the pipeline variables.

**Step 9.** Add a new variable the following configuration.

- Name: `testProjectName`
- Value: `WebAPI.Tests`
- Settable a queue time: `Not Checked`

**Step 10.** Click `Variable group` in the left pane.

**Step 11.** Click `Link variable group` in the right pane. In the `Link variable group` panel that appears, select the Coverage Variable Group, then click the `Link` button.

**Step 12.** Save the pipeline changes as `Draft`. Do not queue a pipeline run.

**Step 13.** Within the Validate Code Coverage with Coverlet Agent Job, update the `arguments` of the `dotnet tool run coverlet` task with the following value:

```bash
run coverlet $(System.DefaultWorkingDirectory)\$(testProjectName)\bin\Debug\netcoreapp3.1\$(testProjectName).dll --target dotnet -f $(coverageOutputFormat) --threshold $(coverageMinThreshold) --output $(System.DefaultWorkingDirectory)\$(coverageOutputFile)
```

**Step 14.** Within the Validate Code Coverage with Coverlet Agent Job, update the `arguments` of the Publish Coverlet code coverage task with the following values:

- Display name: Publish Coverlet code coverage from `$(System.DefaultWorkingDirectory)\$(coverageOutputFile)`
- Summary file: `$(System.DefaultWorkingDirectory)\$(coverageOutputFile)`

**Step 15.** Save an queue a pipeline run each code coverage Agent Job. The Default Tool Agent Job should pass, and the Coverlet Agent Job should failed because of the 80% threshold. Verify this is the case.

**Step 16.** Update the "coverageMinThreshold" variable in the Coverage Variable Group to have a value of 0. Save the changes and run the pipeline again using the Coverlet Agent Job. Verify everything passes.
