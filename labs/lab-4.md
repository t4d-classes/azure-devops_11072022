# Lab 4 - Validate a Build with Unit Tests

## Lab Objectives

- Fail a build if the unit tests fail

## Lab Steps

**Step 1.** In the Azure DevOps web portal, view the list of pipelines.

**Step 2.** Mouse over the "WebAPI Build and Validate" pipeline created in the previous lab, click the three buttons icon, and select `Edit`.

**Step 3.** Add a new `dotnet` task and update the parameters:

- Display name: dotnet test
- Command: test
- Publish test results and code coverage: Checked

**Step 4.** Select `Save & queue` from the `Save` drop down button. Enter the following comment into the `Save Comment` input field: "Add unit testing", then click `Save and run`.

**Step 5.** Observe the steps of the job until the job completes.

**Step 6.** On the far left side menu, mouse over the `Pipelines` link, and click the `Pipelines` submenu link. Click on the pipeline and its most recent run.

**Step 7.** On the top menu, click the `Tests` link. Review the results of running the tests.

**Step 8.** Next, on the far left side menu, mouse over the `Test Plans"` and click the `Runs` submenu item.

**Step 9.** Double click the completed VSTest Test Run to view the results of the unit tests from the build pipeline.

**Step 10.** From Visual Studio, open the "UnitTest1.cs" file in the "WebAPI.Tests" project.

**Step 11.** Update the `Test1` method with the following code:

```csharp
[Fact]
public void Test1()
{
  Assert.True(false);
}
```

**Step 12.** Review the pending changes and check in the code. Review the results of the pipeline and specifically the results of the unit test.

**Step 13.** From the Pipeline's `Test` link, which test failed? Can you see the details?

**Step 14.** Review the results in the `Test Plans`, `Runs` section.

**Step 15.** For the failed test run, download the attachment and view it in Visual Studio 2019.

**Step 16.** Fix the unit test, check in the code and ensure the build passes successfully.
