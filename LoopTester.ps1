$target = "firefox"
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
while (!($process))
{
	Write-Host "Process not found, retrying in 5"
	$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
	start-sleep -s 5
}

if ($process)
{
	Write-Host "Place action on process start here"
	$process.WaitForExit()
	start-sleep -s 2
	$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
	Write-Host "Place action on process exit here"
}
