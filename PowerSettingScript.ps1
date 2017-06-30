$target = "drt"
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
while (!($process))
{
	Write-Host "The game has not started, retrying in 5..."
	$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
	start-sleep -s 5
}
if ($process)
{
  # Now we can check the current powerplan using the next line
  # Get-CimInstance -Namespace root\cimv2\power -Class win32_PowerPlan | Select-Object -Property ElementName, IsActive | Format-Table -Property * -AutoSize
	Write-Host "Dirt Rally has started."
  # assign the powersetting to a variable
  $highperf = Get-CimInstance -Namespace root\cimv2\power -Class win32_PowerPlan -Filter "ElementName = 'High Performance'"
  # switch to the desired power setting
  Invoke-CimMethod -InputObject $highperf -MethodName Activate
	$process.WaitForExit()
	start-sleep -s 2
  Remove-Variable highperf
	Write-Host "Dirt Rally has exited."
  # assign the powersetting to a variable
  $bal = Get-CimInstance -Namespace root\cimv2\power -Class win32_PowerPlan -Filter "ElementName = 'Balanced'"
  # switch to the desired power setting
  Invoke-CimMethod -InputObject $bal -MethodName Activate
  Remove-Variable bal
}
