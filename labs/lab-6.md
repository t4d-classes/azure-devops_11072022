# Lab 6 - Multiple Job Pipeline

## Lab Objectives

- Explore how to create multiple jobs in a pipeline
- Configure dependencies between jobs

## Lab Steps

**Step 1.** Edit the WebAPI Build and Validate pipeline created in the previous lab exercises.

**Step 2.** In the left pane, near the top, click the three dot button on the `Pipeline` blade. Click the menu item `Add an agent job`.

**Step 3.** Update the `Display name input field for the new Agent Job to:

```text
Validate Code Coverage with Default Tool
```

**Step 4.** Scroll down to the `Dependencies` section, and select the "Build WebAPI" dependency. This will configure the new Agent Job to only run after the Build WebAPI Agent Job has completed.

**Step 5.** In the Build WebAPI Agent Job, right click on the "Use .NET Core sdk 3.1.x" task and click `Clone task(s)`.

**Step 6.** Click and drag the cloned task to the new Agent Job. Rename the task to remove the word "copy".

**Step 7.** Drag the `dotnet test` task from the Build WebAPI Agent Job to the new Agent Job.

**Step 8.** Save the pipeline changes with an appropriate comment.

**Step 9.** Queue up a run or commit a minor change to the code to verify the build completes successfully.
