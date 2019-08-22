#Step 2: RUN UNIT TESTS
TRY
{
Write-Host "Starting Run Unit Tests"

$scriptsFolder = "C:\buildkite-agent\builds\red-sye3-01-1\dbkite-1\db-pipeline\redgate"
$testOutputFile = "C:\buildkite-agent\builds\red-sye3-01-1\dbkite-1\db-pipeline\redgate\scripts.junit.xml"

$validatedScriptsFolder = $scriptsFolder

# Run tSQLt tests
$testResults = Invoke-DlmDatabaseTests $validatedScriptsFolder
Export-DlmDatabaseTestResults $testResults -OutputFile $testOutputFile

#check results of unit test
write-host "Checking unit test result"

$xml = [xml](Get-Content $testOutputFile)
$errorCount = $xml.testsuites.testsuite | Select failures
Write-output $errorCount.failures
if($errorCount.failures -gt 0)
{
exit 1
}
else 
{
exit 0
}

}
catch 
{
exit 1
}