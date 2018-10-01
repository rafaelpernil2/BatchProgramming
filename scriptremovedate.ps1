Param(
 [string]$path,
 [string]$format
)
 
Get-ChildItem -Path $path -Filter $format | ForEach {
	$newName = "$($_.DirectoryName)\$($_.BaseName)"
	$newName= $newName -replace "(\d+)-(\d+)-(\d+)__(\d+)-(\d+)_"
	$newName = "$($newName)$($_.Extension)"
	Rename-Item -Path $_.FullName -NewName $newName
}