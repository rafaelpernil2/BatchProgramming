Param(
 [string]$path,
 [string]$format
)
 
Get-ChildItem -Path $path -Filter $format | ForEach {
    $DateStr = $_.CreationTime.ToString("dd-MM-yyyy__HH-mm")
	$newName = "$($_.DirectoryName)\$($_.BaseName)_$($DateStr)$($_.Extension)"
	Rename-Item -Path $_.FullName -NewName $newName
}