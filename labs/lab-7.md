# Lab 7 - Code Coverage with Coverlet

## Lab Objectives

- Enable .NET Local Tools in a pipeline
- Install the Coverlet Tool for use within a pipeline
- Run Coverlet and require a minimum code coverage threshold
- Publish a Cobertura formatted coverage report to be viewed within Azure DevOps web portal

## Lab Steps

**Step 1.** Edit the WebAPI Build and Validate pipeline created in the previous lab exercises.

**Step 2.** Add a new Agent Job named "Validate Code Coverage with Coverlet" and configure the Build WebAPI Agent Job to be a dependency.

**Step 3.** Clone the "Use .NET Code sdk 3.1.x" task from another Agent Job and drag it to the new job. Clean up the name to remove the word "copy".

**Step 4.** Add a new ".NET Core" task to the end of the new Agent Job. Configure it as shown here:

- Display Name: dotnet test
- Command: test
- Arguments: Leave Blank
- Publish test results and code coverage: Checked

**Step 5.** Add a new ".NET Core" task to the end of the new Agent Job. Configure it as shown here:

- Display Name: dotnet new tool-manifest
- Command: custom
- Custom Command: new
- Arguments: tool-manifest --force

**Step 6.** Add a new ".NET Core" task to the end of the new Agent Job. Configure it as shown here:

- Display Name: dotnet tool install coverlet
- Command: custom
- Custom Command: tool
- Arguments: install coverlet.console --version 1.7.2

**Step 6.** Add a new ".NET Core" task to the end of the new Agent Job. Configure it as shown here:

- Display Name: dotnet tool run coverlet
- Command: custom
- Custom Command: tool
- Arguments: 

```text
run coverlet $(System.DefaultWorkingDirectory)\WebAPI.Tests\bin\Debug\netcoreapp3.1\WebAPI.Tests.dll --target dotnet -f cobertura --threshold 80 --output $(System.DefaultWorkingDirectory\CoverageResults\coverage.cobertura.xml
```

**Step 7.** Add a new "Publish code coverage results" task to the end of the new Agent Job. Configure it as shown here:

- Display Name: Publish Coverlet code coverage from $(System.DefaultWorkingDirectory)\CoverageResults\coverage.cobertura.xml
- Code coverage tool: Cobertura
- Summary file: $(System.DefaultWorkingDirectory)\CoverageResults\coverage.cobertura.xml

**Step 8.** In the left pane, click on the "Validate Code Coverage with Default Tool" blade. Scroll to the bottom of the right pane, to the last section labeled `Additional options`.

**Step 9.** For the `Run this job` field, select: "Custom condition using variable expressions".

**Step 10.** For the `Variable expression` field, type the following expression

```text
eq('', 'Coverlet')
```

**Step 11.** Save the pipeline with an appropriate comment.

**Step 12.** Queue up a run or commit a minor change to the code to verify the build runs and fails.

**Step 13.** On the pipeline run result page, review the unit tests, code coverage percent, and the errors from the build. Also, verify that the Validate Code Coverage with Default Tool Agent Job did not run.

**Step 14.** From the the pipeline run result page, click the `Code Coverage` top menu item. Review the results output of the Coverlet code coverage.
