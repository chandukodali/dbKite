#Step 2: RUN UNIT TESTS
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
if($errorCount.failures -ge 0)
{
throw "Error - failure count greater than 0"
}
