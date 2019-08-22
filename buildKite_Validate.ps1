#Step 1: VALIDATE
TRY
{
$errorActionPreference = "stop"

Write-Host "Starting Script Validation"
 
# Validate the scripts folder
$scriptsFolder = "C:\buildkite-agent\builds\red-sye3-01-1\dbkite-1\db-pipeline\redgate" # The scripts folder to validate, test and sync
$validatedScriptsFolder = Invoke-DlmDatabaseSchemaValidation $scriptsFolder

exit 0
}
CATCH
{
$ErrorMessage = $_.Exception.Message
write-host $ErrorMessage
exit 1
}
