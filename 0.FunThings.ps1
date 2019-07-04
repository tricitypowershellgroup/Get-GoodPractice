#region break
break
#endregion

#region kolejność parametrów
#region
$Test1 = 'test' + 1
$Test2 = 1 + 'test'

$Test3 = (Get-Date) + 100000000000000000
$Test4 = 100000000000000000 + (Get-Date)
#endregion

#region
#region
if (@() -eq $null) { 'true' }else { 'false' }
if (@() -ne $null) { 'true' }else { 'false' }

#region
if ($null -eq @()) { 'true' }else { 'false' }
if ($null -eq @()) { 'true' }else { 'false' }
#endregion
#endregion
#endregion
#endregion

#region pipeline'y
#region
@(1, 2, 3) | Measure-Object
Measure-Object -InputObject @(1, 2, 3)
#endregion

#region
Get-Process | Get-Member
Get-Member -InputObject (Get-Process)
#endregion
#endregion