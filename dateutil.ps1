Param(
 [string]$operation,
 [string]$path,
 [string]$format
)

if (!$format.StartsWith("*.")){

	$format = '*.' + $format

}


if (($path -eq "")){
	$path = "./"
}


if ($operation -eq "append"){
	
	

 
	Get-ChildItem -Path $path -Filter $format | ForEach {
		$DateStr = $_.CreationTime.ToString("yyyy-MM-dd__HH-mm")
		$newName = "$($_.DirectoryName)\$($DateStr)_$($_.BaseName)$($_.Extension)"
		Rename-Item -Path $_.FullName -NewName $newName
		write-host "The file " -nonewline  -ForegroundColor darkgreen 
		write-host "$($_.BaseName)" -nonewline -ForegroundColor darkgray 
		write-host " has been successfully renamed" -ForegroundColor darkgreen 
	}

}
ElseIf($operation -eq "fix"){

	$trigger = "0"
	Get-ChildItem -Path $path -Filter $format | ForEach {
		$newName = "$($_.BaseName)"
		$splittedName= $newName -split "_",2
		
		if ($splittedName[1] -match "^(\d+)-(\d+)-(\d+)__(\d+)-(\d+)"){
			$newName = "$($_.DirectoryName)\$($splittedName[1])_$($_.BaseName)$($_.Extension)"
			$newName= $newName -replace "_(\d+)-(\d+)-(\d+)__(\d+)-(\d+)"
			Rename-Item -Path $_.FullName -NewName $newName
			write-host "$($_.BaseName)" -nonewline -ForegroundColor darkgray 
			write-host " has been successfully renamed" -ForegroundColor darkgreen 
		}else {
			$trigger = "1"
			write-host "$($_.BaseName)" -nonewline -ForegroundColor darkgray 	
			write-host " does not have a date appendix or is already fixed. Make sure the main name of the file does not contain _" -ForegroundColor darkyellow
		}
	}
	if ($trigger -eq 1){
		write-host "Some files haven't been modified. Read the log and check the files. They should have the following format " -ForegroundColor yellow -nonewline
		write-host "filename_yyyy-MM-dd__HH-mm.format" -ForegroundColor gray
	}
	else{
		write-host "All files have been fixed successfully" -ForegroundColor green
	}

}ElseIf ($operation -eq "remove"){
	Get-ChildItem -Path $path -Filter $format | ForEach {
	$newName = "$($_.DirectoryName)\$($_.BaseName)"
	$newName= $newName -replace "(\d+)-(\d+)-(\d+)__(\d+)-(\d+)_"
	$newName = "$($newName)$($_.Extension)"
	Rename-Item -Path $_.FullName -NewName $newName
}
}ElseIf ($operation -eq "unfix"){
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


}ElseIf ($operation -eq "append-old"){

	write-host "WARNING: This method is deprecated"   -ForegroundColor darkred
	Get-ChildItem -Path $path -Filter $format | ForEach {
		$DateStrOld = $_.CreationTime.ToString("dd-MM-yyyy__HH-mm")
		$DateStr = $_.CreationTime.ToString("yyyy-MM-dd__HH-mm")
		$newName = "$($_.DirectoryName)\$($_.BaseName)_$($DateStr)$($_.Extension)"
		Rename-Item -Path $_.FullName -NewName $newName
		
		write-host "$($_.BaseName)" -nonewline -ForegroundColor darkgray 
		write-host " has been successfully renamed" -ForegroundColor darkgreen 
	}



}