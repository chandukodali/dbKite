#Step 4: PACKAGE AND PUBLISH
Write-Host "Starting Package Creation"

#re-validate
$scriptsFolder = "C:\buildkite-agent\builds\red-sye3-01-1\dbkite-1\db-pipeline\redgate"
$validatedScriptsFolder = Invoke-DlmDatabaseSchemaValidation $scriptsFolder

#create package
$databasePackage = New-DlmDatabasePackage $validatedScriptsFolder -PackageId "DBKite" -PackageVersion "1.0.0"

Export-DlmDatabasePackage $databasePackage -Path "C:\buildkite-agent\packages"