param([Int32]$buildNumber)
$datestring = (Get-Date).ToString("s").Replace(":","-") + $buildNumber
New-Item C:\Temp\$datestring.txt -type "file"