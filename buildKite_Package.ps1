﻿#Step 4: PACKAGE AND PUBLISH
Write-Host "Starting Package Creation"

#re-validate
$scriptsFolder = "C:\buildkite-agent\builds\red-sye3-01-1\dbkite-1\db-pipeline\redgate"
$validatedScriptsFolder = Invoke-DlmDatabaseSchemaValidation $scriptsFolder

Write-Output $latestFileNameSubstring1+$fileVersion

$latestFileName = Get-ChildItem -Path "C:\Rama" -Recurse | group directory | foreach {$_.group | sort LastWriteTime -Descending | select -First 1} | Select
$latestFileNameSubstring1 = $latestFileName.Name.Substring(0,11)
$fileVersion = $latestFileName.Name.Substring(11,1)
$fileVersion = [int]$fileVersion + 1
$fileVersion = ($latestFileNameSubstring1 + $fileVersion.ToString()).Replace("DBKite.","")
Write-Output $fileVersion

#create package
$databasePackage = New-DlmDatabasePackage $validatedScriptsFolder -PackageId "DBKite" -PackageVersion $fileVersion

Export-DlmDatabasePackage $databasePackage -Path "C:\buildkite-agent\packages"