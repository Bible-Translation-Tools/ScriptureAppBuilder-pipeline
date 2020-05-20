# Input bindings are passed in via param block.
param($QueueItem, $TriggerMetadata)

# Write out the queue message and insertion time to the information log.
Write-Host "PowerShell queue trigger function appbuilderrunner processed work item: $QueueItem"
Write-Host $QueueItem.AppName
Write-Host $QueueItem.RepoURL
Write-Host "Queue item insertion time: $($TriggerMetadata.InsertionTime)"

$secPW = ConvertTo-SecureString $env:STORAGEKEY -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($env:STORAGENAME, $secPW)

$AppName = $QueueItem.AppName
$RepoURL = $QueueItem.RepoURL
$JobId = $QueueItem.JobId

New-AzContainerGroup `
     -ResourceGroupName dansfunctions `
     -Name $JobId `
     -Image bibletranslationtools/appbuilder `
     -OsType Linux `
     -tag @{ “appname” = $AppName } `
     -AzureFileVolumeShareName acishare `
     -AzureFileVolumeAccountCredential $cred `
     -AzureFileVolumeMountPath "/root/App Builder/Scripture Apps/Apk Output" `
     -Command "/root/sab-run-build.sh $AppName $RepoURL $env:SIGNINGKEYPASS" `
     -RestartPolicy Never