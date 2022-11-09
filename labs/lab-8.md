# Lab 8 - Configure Pipeline Task with Custom Variables

## Lab Objectives

- Configure the Test Project name with a variable.
- Write an expression to selectively execute an Agent Job.

## Lab Steps

**Step 1.** Edit the WebAPI Build and Validate pipeline created in the previous lab exercises.

**Step 2.** Click on the `Variables` top menu item. Add the following variable

- Name: codeCoverageTool
- Value: Default
- Settable as queue time: Checked

**Step 3.** Edit the Validate Code Coverage with Default Tool Agent Job. Modify the variable expression to be the following expression:

```text
eq(variables.codeCoverageTool, 'Default')
```

This will utilize the newly configured variable to determine whether or not to run the Agent Job.

**Step 4.** Edit the Validate Code Coverage with Coverlet Agent Job. Modify the variable expression to be the following expression:

```text
eq(variables.codeCoverageTool, 'Coverlet')
```

This will utilize the newly configured variable to determine whether or not to run the Agent Job.

**Step 5.** Save the pipeline with an appropriate comment.

**Step 6.** Click the `Queue` button in the top menu of the edit pipeline page, then click `Variables` under `Advanced Options`.

**Step 7.** Click on the "codeCoverageTool" variable, Set the value to either "Default" or "Coverlet", then click the `Update` button.

**Step 8.** Click the back arrow button in the upper left-hand corner of the `Variables` panel.

**Step 9.** Click the `Run` button and review the results of the build. Did the Agent Job you specified run? The build will fail when running the Validate Code Coverage with Coverlet Agent Job. Repeat the process with the other possible value for the "codeCoverageTool" variable.
