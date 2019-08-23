$buildNumber = $env:BUILDKITE_BUILD_NUMBER
write-host $buildNumber
$datestring = (Get-Date).ToString("s").Replace(":","-") + $buildNumber
New-Item C:\Temp\$datestring.txt -type "file"

