# Lab 5 - Validate a Build with Code Coverage

## Lab Objectives

- Capture code coverage for unit tests
- Review the code coverage results in Visual Studio 2019 Enterprise

## Lab Steps

**Step 1.** Edit the WebAPI Build and Validate pipeline created in the previous lab exercises.

**Step 2.** Select the "dotnet test" task.

**Step 3.** Update the "arguments" to contain:

```bash
--collect "Code coverage"
```

**Step 4.** Run the pipeline manually or push some kind of small code change that does not break the unit test.

**Step 5.** View the pipeline build results. In the final column, on the right, observe the percent code coverage value.

**Step 6.** In the top menu, click the "Code Coverage" link.

**Step 7.** In the Code Coverage page, download code coverage results.

**Step 8.** If you have Visual Studio 2019 Enterprise Edition you can view the code coverage results. With Visual Studio 2019, open the "WebAPI" project.

Note: If you do not have Visual Studio 2019 Enterprise, then you can skip the remaining steps. The instructor will demo reading the code coverage results.

**Step 9.** From the "View" menu item, click on "Other Windows", then click on "Code Coverage".

**Step 10.** From the Code Coverage pane, click the blue circular arrow and import the coverage file.

**Step 11.** Review the Code Coverage results and double click on the code in the "WebAPI.Web" project to see uncovered lines.


**Step 12.** Edit the pipeline, and click on the `dotnet test` task. Clear the arguments field.
