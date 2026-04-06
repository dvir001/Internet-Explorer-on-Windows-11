$vbsFile = "IE11.vbs"
$site = "about:blank"
$vbsFileContent = @"
Set oIE = CreateObject("InternetExplorer.Application")
oIE.Visible = True
oIE.Navigate "$site"
"@

if (!(Test-Path -Path "$env:TEMP\$vbsFile")) { New-Item -Path $env:TEMP -Name $vbsFile -ItemType "file" -Value $vbsFileContent -Force -Verbose | Out-Null }

cscript.exe //B //NoLogo `"$env:TEMP\$vbsFile`" | Out-Null
