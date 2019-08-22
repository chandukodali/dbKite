#DEPLOY
TRY
{
$destination = New-DlmDatabaseConnection -ServerInstance "172.22.52.53,5026" -Database "DBKite" -Username "build_admin" -Password "HomeTrack123!!"
$dbRelease = New-DlmDatabaseRelease -Source "C:\buildkite-agent\packages\DBKite.1.0.5.nupkg" -Target $destination

#Export scripts
write-host "Exporting deployment scripts"
Export-DlmDatabaseRelease $dbRelease -Path "C:\buildkite-agent\releaseScripts" 

#Do the deployment
write-host "Beginning deployment"
Use-DlmDatabaseRelease $dbRelease -DeployTo $destination
write-host "Deployment Complete"
exit 0
}
catch
{
$ErrorMessage = $_.Exception.Message
write-host $ErrorMessage
exit 1
}