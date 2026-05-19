Write-Output "Cleaning compiled class files..."
Get-ChildItem -Path . -Filter 'ControlIntensidad*.class' -ErrorAction SilentlyContinue | Remove-Item -Force -ErrorAction SilentlyContinue
Write-Output "Done."
