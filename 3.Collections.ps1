#region break
break
#endregion

#region tworzenie tablicy
#region brzydko
Measure-Command {
    $FileInfo = @()
    foreach ($File in (Get-ChildItem -File -Path 'C:\Program Files' -Recurse -ErrorAction SilentlyContinue))
    {
        $FileInfo += [PSCustomObject]@{
            Name              = $File.Name
            HoursFromCreation = ((Get-Date) - $File.CreationTime).TotalHours
        }
    }
}
#endregion

#region ładnie
Measure-Command {
    $FileInfo = foreach ($File in (Get-ChildItem -File -Path 'C:\Program Files' -Recurse -ErrorAction SilentlyContinue))
    {
        [PSCustomObject]@{
            Name              = $File.Name
            HoursFromCreation = ((Get-Date) - $File.CreationTime).TotalHours
        }
    }
}

Measure-Command {
    $FileInfo = [System.Collections.Generic.List[PSObject]]::new()
    foreach ($File in (Get-ChildItem -File -Path 'C:\Program Files' -Recurse -ErrorAction SilentlyContinue))
    {
        $FileInfo.add([PSCustomObject]@{
                Name              = $File.Name
                HoursFromCreation = ((Get-Date) - $File.CreationTime).TotalHours
            })
    }
}
#endregion
#endregion