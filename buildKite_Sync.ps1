#Step 3: SYNC
TRY
{
Write-Host "Starting DB Sync"

$scriptsFolder = "C:\buildkite-agent\builds\red-sye3-01-1\dbkite-1\db-pipeline\redgate"
$validatedScriptsFolder = $scriptsFolder

# Sync a test database
$testdb = New-DlmDatabaseConnection -ServerInstance "RED-SYE3-01,5026" -Database "Build_DBKite" # Update this to use the blank database you created earlier
Test-DlmDatabaseConnection $testdb
Sync-DlmDatabaseSchema -Source $validatedScriptsFolder -Target $testdb

exit 0
}
catch
{
exit 1
}