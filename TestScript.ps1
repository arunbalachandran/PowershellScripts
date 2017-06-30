$firefox = Get-Process drt -ErrorAction SilentlyContinue
if ($firefox) {
  Write-Host "Dirt Racing has been started"
}
Remove-Variable firefox
