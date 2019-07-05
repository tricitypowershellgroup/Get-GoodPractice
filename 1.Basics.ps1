#region break
break
#endregion

#region aliasy

#region brzydko
gsv | ? s*s -like R* | % n*
gsv | ? s*s -like R* | spsv -wh
#endregion

#region ładnie
Get-Service | Where-Object -Property Status -EQ Running | ForEach-Object -MemberName Name
Get-Service | Where-Object -Property Status -EQ Running | Stop-Service -WhatIf
#endregion

#endregion

#region parametry pozycyjne

#region brzydko
Compare-Object @('a', 'b') @('a', 'c')
#endregion

#region ładnie
Compare-Object -DifferenceObject @('a', 'c') -ReferenceObject @('a', 'b')
#endregion

#endregion

#region nazewnictwo

#region nazwy zmiennych
#region brzydko
$x = $y + $z
$dluganazwazmiennej
$strName
$intSum
#endregion

#region ladnie
$LongVariableName
#endregion
#endregion

#region nazwy funkcji

#region brzydko
TerminateProgram
CombineString
Open-Programs
#endregion

#region ładnie
Stop-Program
Join-String
Open-Program

Get-Verb
#endregion

#endregion

#endregion

#region backtick (grawis)
#region brzydko
Get-ChildItem -Path C:\Windows `
    -Filter *mgr* `
    -Recurse `
    -Depth 1 `
    -File `
    -ErrorAction SilentlyContinue

Get-ChildItem C:\Windows -Include *.txt -Recurse -ErrorAction SilentlyContinue `
| Select-Object -First 1

if ($Var1 -eq $True -and $Var2 -ne 'ABC' -and $Var3 -contains 'D' -or $null -ne $Var4 -or $Var5 -eq $false)
{
    Get-Something
}

if ($Var1 -eq $True `
        -and $Var2 -ne 'ABC' `
        -and $Var3 -contains 'D' `
        -or $null -ne $Var4 `
        -or $Var5 -eq $false)
{
    Get-Something
}
#endregion

#region ładnie

$GetChildItemParameters = @{
    Path        = 'C:\Windows'
    Filter      = 'mgr'
    Recurse     = $true
    Depth       = 1
    File        = $true
    ErrorAction = 'SilentlyContinue'
}
Get-ChildItem @GetChildItemParameters

Get-ChildItem C:\Windows -Include *.txt -Recurse -ErrorAction SilentlyContinue |
Select-Object -First 1

if ($Var1 -eq $True -and
    $Var2 -ne 'ABC' -and
    $Var3 -contains 'D' -or
    $null -ne $Var4 -or
    $Var5 -eq $false)
{
    Get-Something
}
#endregion

#endregion

#region Filter Left, Format Right
#region filter
#region brzydko
Measure-Command { Get-ADUser -filter * | Where-Object samaccountname -eq 'adamm' }
Measure-Command { Get-ChildItem -Path C:\Windows -Depth 1 -Recurse -ErrorAction SilentlyContinue | Where-Object Name -eq 'cleanmgr.exe' }
#endregion

#region ładnie
Measure-Command { Get-ADUser -filter "samaccountname -eq 'adamm'" }
Measure-Command { Get-ChildItem -Path C:\Windows -Depth 1 -Recurse -Filter 'cleanmgr.exe' -ErrorAction SilentlyContinue }
#endregion
#endregion

#region format
#region brzydko
Get-Process | Format-List | Select-Object -Property Name
#endregion

#region ładnie
Get-Process | Select-Object -Property Name | Format-List
#endregion
#endregion

#endregion

#region ilość atrybutów
#region brzydko
Measure-Command { Get-ADComputer -filter * -Properties * | Select-Object -First 100 | Where-Object operatingsystem -like *2003* }
#endregion

#region ładnie
Measure-Command { Get-ADComputer -filter * -Properties operatingsystem | Select-Object -First 100 | Where-Object operatingsystem -like *2003* }
#endregion
#endregion
