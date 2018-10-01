Param(
 [string]$path,
 [string]$format
)
$trigger = "0"
Get-ChildItem -Path $path -Filter $format | ForEach {
	$newName = "$($_.BaseName)"
	$splittedName= $newName -split "_",0
	$dateAppendix = -join ("$($splittedName[0])","__","$($splittedName[2])")
	if ($dateAppendix -match "(\d+)-(\d+)-(\d+)__(\d+)-(\d+)"){
		$newName = "$($_.DirectoryName)\$($_.BaseName)_$($dateAppendix)$($_.Extension)"
		$newName= $newName -replace "(\d+)-(\d+)-(\d+)__(\d+)-(\d+)_"
		Rename-Item -Path $_.FullName -NewName $newName
		write-host "$($_.BaseName)" -nonewline -ForegroundColor darkgray 
		write-host " has been successfully renamed" -ForegroundColor darkgreen 
	}else {
		$trigger = "1"
		write-host "$($_.BaseName)" -nonewline -ForegroundColor darkgray 	
		write-host " does not have a date appendix or is already fixed." -ForegroundColor darkyellow
	}
}
if ($trigger -eq 1){
	write-host "Some files haven't been modified. Read the log and check the files. They should have the following format " -ForegroundColor yellow -nonewline
	write-host "filename_yyyy-MM-dd__HH-mm.format" -ForegroundColor gray
}
else{
	write-host "All files have been fixed successfully" -ForegroundColor green
}