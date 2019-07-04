#region break
break
#endregion

#region output
#region brzydko
function Get-Data
{
    Get-ChildItem -Path C:\Windows | Format-List -Property *
}
Get-Data

function Get-OtherData
{
    Get-ChildItem -Path C:\Windows | Out-GridView
}
Get-OtherData

#endregion

#region ładnie
function Get-Data
{
    Get-ChildItem -Path C:\Windows
}
Get-Data | Format-List -Property *

function Get-OtherData
{
    Get-ChildItem -Path C:\Windows
}
Get-OtherData | Out-GridView

#endregion
#endregion

#region parametry
#region brzydko
function Write-Name
{
    $UserName = Read-Host -Prompt 'Enter your name'
    Write-Output -InputObject "Your name is $UserName"
}
#endregion

#region ładnie
function Write-Name
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.String]
        $UserName
    )
    Write-Output -InputObject "Your name is $UserName"
}
#endregion

#endregion

#region switch/whatif/confirm
#region brzydko
function Write-Name
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.String]
        $UserName,

        [Parameter()]
        [switch]
        $WhatIf,

        [Parameter()]
        [ValidateSet($True, $False)]
        [bool]
        $Confirm
    )
    if ($WhatIf)
    {
        return "Writes your name do default Output."
    }

    if ($Confirm -eq $true)
    {
        $AreYouSure = Read-Host "Are you sure you want to perform this action (Y/N)"
        if ($AreYouSure -eq 'N') { return }
    }
    Write-Output -InputObject "Your name is $UserName"
}
#endregion

#region ładnie
function Write-Name
{
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory)]
        [System.String]
        $UserName
    )
    if ($PSCmdlet.ShouldProcess('Writes your name do default Output'))
    {
        Write-Output -InputObject "Your name is $UserName"
    }
}
#endregion
#endregion

#region parametr path
#region brzydko
function Write-Path
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.String]
        $Path
    )
    Write-Output -InputObject "Path is $path"
}
Write-Path -Path "::::f"
#endregion

#region ładnie
function Write-Path
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [System.IO.FileInfo]
        $Path
    )
    Write-Output -InputObject "Path is $path"
}
Write-Path -Path "::::f"
#endregion

#endregion

#region przykład
#region brzydko

#10961C_Mod09_LabA_Ex2_LAK.txt
param(
    [string]$ComputerName=(Read-Host "Enter computer name"),
    [switch]$AlternateCredential
)

If ($AlternateCredential -eq $true) {
    $cred = Get-Credential
    $session = New-CimSession -ComputerName $ComputerName -Credential $cred
    Get-CimInstance Win32_LogicalDisk -CimSession $session -Filter "DriveType=3"
} Else {
    Get-CimInstance Win32_LogicalDisk -ComputerName $ComputerName -Filter "DriveType=3"
}

#endregion

#region ładnie
[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [System.String]
    $ComputerName,

    [Parameter()]
    [System.Management.Automation.PSCredential]
    $AlternateCredential
)

if ($AlternateCredential)
{
    $CIMSession = New-CimSession -ComputerName $ComputerName -Credential $AlternateCredential
    Get-CimInstance -ClassName Win32_LogicalDisk -CimSession $CIMSession -Filter 'DriveType=3'
}
else
{
    Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $ComputerName -Filter 'DriveType=3'
}
#endregion
#endregion