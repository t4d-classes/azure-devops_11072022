# Lab 11 - Create a Release Pipeline

## Lab Objectives

- Create a release pipeline to deploy artifacts from the build pipeline
- Deployed a zipped archive to a folder

## Lab Steps

**Step 1.** On the far left-hand menu, click the `Pipelines` sudmenu item under the `Releases` menu.

**Step 2.** Click the `New pipeline` button.

**Step 3.** In the upper right-hand corner, click the `Empty job` link.

**Step 4.** Click the `X` button on the upper right-hand corner of the `Stage` panel.

**Step 5.** At the top, click on the name of the Release Pipeline. The name is located to the right of `All pipelines >`. Name the Release Pipeline: "WebAPI Release". When you click off the input field, the name will update.

**Step 6.** The Release Pipeline UI is more graphical in nature than the Build Pipelines UI. Review the two steps listed: the `Artifacts` and `Stages`. The `Artifacts` will be the output the Build Pipeline and the `Stages` will be the steps to deploy to the various execution environments.

**Step 7.** Within the `Artifacts` step, click on `Add an artifact`.

**Step 8.** Select `Build` for the `Source Type`.

**Step 9.** For `Project`, select "WebAPI".

**Step 10.** For `Source`, select "WebAPI Build and Validate".

**Step 11.** For the `Default version`, select "Latest".

**Step 12.** For the `Source alias`, type "_WebAPI".

**Step 13.** Click the `Add` button.

**Step 14.** Click the `Lightning` button, and enable the continuous deployment trigger. Then, click the `X` in the upper right-hand corner of the `Continuous deployment trigger` panel.

**Step 15.** Within `Stages` step, click the `1 job, 0 task` link within `Stage 1`.

**Step 16.** Update the `Stage name` input field to:

```text
Manual Deploy
```

**Step 17.** In the left pane, click the `Agent job` blade, update the `Display name` input field to: 

```text
Archive and Copy
```

**Step 18.** In the left pane, click the `+` button on the right-hand side of the `Archive and Copy` blade to add a new task.

**Step 19.** Using the Search input field on the right, search for the task named "Archive files", then add the `Archive files` task to the Agent Job.

**Step 20.** Update the `Root folder or file to archive` input field to:

```text
$(System.ArtifactsDirectory)/_WebAPI
```

**Step 21.** Update the `Archive file to create` input field to:

```text
$(Agent.TempDirectory)/WebAPI_$(Build.BuildId).zip
```


**Step 22.** In the left pane, click the `+` button on the right-hand side of the `Archive and Copy` blade to add a new task.

**Step 23.** Using the Search input field on the right, search for the task named "Copy files", then add the `Copy files` task to the Agent Job.

**Step 24.** Update the `Source Folder` input field to:

```text
$(Agent.TempDirectory)/
```

**Step 25.** Update the `Contents` input field to:

```text
WebAPI_$(Build.BuildId).zip
```

**Step 26.** Update the `Target Folder` input field to:

```text
C:\Output\WebAPI
```

**Step 27.** At the top of the Release Pipeline Editor, click the `Save` button. Leave the `Folder` set to "\", and type in a reasonable comment such as "add archive and copy for manual deploy stage". Then, click `Ok`.

**Step 28.** At the top of the Release Pipeline Editor, click the `Release` button and select `Create release`.

**Step 29.** Do not click on the `Manual Deploy` stage. Also, do not select a stage from the `Stages for a trigger change from automated to manual.` drop down. Update the `Release description` input field to contain:

```text
test release pipeline configuration
```

**Step 30.** Click the `Create` button.

**Step 31.** At the top of the Release Pipeline Editor, click the `View releases` button. The list of releases including the release just create should be displayed.

**Step 32.** Click on the release just created. The release will take a few moments to complete. If it is not already complete, you should be able to watch the Manual Deploy Stage go through its processing steps.

**Step 33.** Once the release has been successfully completed, examine the `C:\Output\WebAPI` folder on the Azure DevOps server. You may need to remote desktop into the server if you are not already logged in. The zip file for the WebAPI build should be located in the folder.

**Step 34.** Make a minor change to the WebAPI source code and check in the code. Verify the entire build and release pipeline process completes successfully.
