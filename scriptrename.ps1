Param(
 [string]$path,
 [string]$format
)
write-host "WARNING: This method is deprecated"   -ForegroundColor darkred
Get-ChildItem -Path $path -Filter $format | ForEach {
	$DateStrOld = $_.CreationTime.ToString("dd-MM-yyyy__HH-mm")
    $DateStr = $_.CreationTime.ToString("yyyy-MM-dd__HH-mm")
	$newName = "$($_.DirectoryName)\$($_.BaseName)_$($DateStr)$($_.Extension)"
	Rename-Item -Path $_.FullName -NewName $newName
	
	write-host "$($_.BaseName)" -nonewline -ForegroundColor darkgray 
	write-host " has been successfully renamed" -ForegroundColor darkgreen 
}