<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.191
	 Created on:   	28/06/2022 14:41
	 Created by:   	Dvir F
	 Organization: 	ITMS
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>

$vbsFile = "IE11.vbs"
$site = "about:blank"
$vbsFileContent = @"
Set oIE = CreateObject("InternetExplorer.Application")
oIE.Visible = True
oIE.Navigate "$site"
"@

if (!(Test-Path -Path "$env:TEMP\$vbsFile")) { New-Item -Path $env:TEMP -Name $vbsFile -ItemType "file" -Value $vbsFileContent -Force -Verbose | Out-Null }

cscript.exe //B //NoLogo `"$env:TEMP\$vbsFile`" | Out-Null