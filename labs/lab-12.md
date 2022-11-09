# Lab 12 - Create a Multi-Stage Release Pipeline

## Lab Objectives

- Setup multiple stages
- Configure one to be automated and the other stages to be manual

## Lab Steps

**Step 1.** On the far left-hand menu, click the `Pipelines` sudmenu item under the `Releases` menu.

**Step 2.** On the left page, click the WebAPI Release pipeline. Then, click the `Edit` button in the upper right-hand corner of the page.

**Step 3.** Mouse over the `Manual Deploy` stage, click the `Clone` button. Name the clone stage "Production". Rename the "Manual Deploy" Stage to "Test".

**Step 4.** For the Test Stage, update the `Target Folder` of the Copy Files Task to "C:\Output\WebAPI\Test".

**Step 5.** For the Production Stage, update the `Target Folder` of the Copy Files Task to "C:\Output\WebAPI\Production".

**Step 6.** On the top menu of the Release Pipeline Editor, click the `Pipeline` menu item.

**Step 7.** On the `Test` Stage, click the `Person` icon on the right side of the stage. Enable `Post-deployment approvals`. Add the "devopsuser" as the approver. Close the `Post-deployment conditions` panel.

**Step 8.** Save the Release Pipeline and create a new release.

**Step 9.** Review the progress of the release. Once the `Test` stage is complete, click the `Approve` button. An approve panel will appear. Enter a comment and then click `Approve`.

**Step 10.** Check the output folders on the Azure DevOps server to make sure there is a zip file for both test and production. You will need to be logged into the Azure DevOps server via a remote desktop session to view the file system.
