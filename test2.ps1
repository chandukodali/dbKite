param([string]$buildNumber)
$datestring = (Get-Date).ToString("s").Replace(":","-") + $BUILDKITE_BUILD_NUMBER
New-Item C:\Temp\$datestring.txt -type "file"