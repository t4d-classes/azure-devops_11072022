# Lab 10 - Save a Pipeline as a Template

## Lab Objectives

- Save an existing pipeline as a template
- Utilize the template to create a new pipeline

## Lab Steps

**Step 1.** On the far left-hand menu, click the `Pipelines` sudmenu item under the `Pipelines` menu.

**Step 2.** Click the WebAPI Build and Validate Pipeline.

**Step 3.** In the upper-right hand corner, click the three dot button that follows the `Edit` and `Run pipeline` buttons.

**Step 4.** Click `Export to JSON`. This will export the definition of the pipeline to a JSON file. This exported JSON definition of the pipeline can be imported into Azure DevOps. Open the JSON file and review it. You will not be importing it, but review the content of the file.

**Step 5.** Click the three dot button again, and click `Save as template`.

**Step 6.** Give the template the following name, then click the `Save` button.

```text
.NET Core Project Pipeline
```

**Step 7.** Create a new pipeline using the WebAPI project as the source.

**Step 8.** After selecting the source, the `Select a template` panel will appear. Earlier in the course, the `Empty Job` option was selected. For this pipeline, scroll to the bottom to review the custom templates previously created.

**Step 9.** Mouse over the templare you just created and observe an `Apply` button appears so the template can selected. Also, there is a trash can to delete a template. It's awkward, but this is where templates can be deleted. Click the `Apply` button.

**Step 10.** Give the new pipeline a reasonable name, and select the Default Agent Pool.

**Step 11.** Review the variable and variable groups, as well as, the tasks. How does it look? Try saving the pipeline and queuing up a pipeline run. What is the result?

**Step 12.** The pipeline run should have been successful. If it failed review the settings again and make any needed adjustments.

**Step 13.** On the far left-hand menu, click the `Pipelines` sudmenu item under the `Pipelines` menu.

**Step 14.** Click the new pipeline created from the template.

**Step 15.** In the upper-right hand corner, click the three dot button that follows the `Edit` and `Run pipeline` buttons. Select `Delete`

**Step 16.** Copy and paste the name of the pipeline into the `Please type the name of the pipeline to confirm.` input field, then click the `Delete` button. Review the pipeline list to confirm the pipeline was deleted.
