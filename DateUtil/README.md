# DateUtil
A Powershell script for appending the creation date of your files to their names. Useful for organizing files
## Table of Contents
- [DateUtil](#dateutil)
- [Operations](#operations)
    - [append](#append)
    - [append-old](#append-old)
    - [fix](#fix)
    - [unfix](#unfix)
    - [remove](#remove)
- [Installation](#installation)
- [Usage](#usage)
- [Arguments](#arguments)
- [Example](#example)
## Operations
This script contains the following operations, specified through the `operation` argument:
### append
For each file in the specified path, it appends the creation date of each file to its name.

##### Input format:
`filename.extension`
##### Output format:
`yyyy-MM-dd__HH-mm_filename.extension`

### append-old
It does the same as the above method but with a different format.
##### Input format:
`filename.extension`
##### Output format:
`filename_yyyy-MM-dd__HH-mm.extension`

### fix
For each file in the specified path, it swaps the name format from `append-old` output format to the one of `append`
##### Input format:
`filename_yyyy-MM-dd__HH-mm.extension`
##### Output format:
`yyyy-MM-dd__HH-mm_filename.extension`
### unfix
For each file in the specified path, it swaps the name format from `append`output format to the one of `append-old` 
##### Input format:
`yyyy-MM-dd__HH-mm_filename.extension`
##### Output format:
`filename_yyyy-MM-dd__HH-mm.extension`
### remove
For each file in the specified path, it removes the date from the file name added using the `append` operation
##### Input format:
`yyyy-MM-dd__HH-mm_filename.extension`
##### Output format:
`filename.extension`


## Usage
### Arguments:
* `-operation`: Specify what operation to use
* `-extension`: Specify the file extension of the files to modify
* `-path`: Specify the folder of the files to modify
### Example:


```powershell
PS C:\BatchProgramming\DateUtil>dir

    Directorio: C:\BatchProgramming\DateUtil


Mode                LastWriteTime     Length Name
----                -------------     ------ ----
-a---        09/02/2019     21:46        105 dateutil.bat
-a---        09/02/2019     22:28       3876 dateutil.ps1
-a---        09/02/2019     21:45        107 dateutil_custom.bat
-a---        09/02/2019     21:45        111 dateutil_flac.bat
-a---        09/02/2019     21:47        105 dateutil_here.bat
-a---        09/02/2019     20:34        108 README.md
-a---        09/02/2019     20:53  172077697 test.flac


PS C:\BatchProgramming\DateUtil> ./dateutil.ps1 -operation append -extension flac -path ./
PS C:\BatchProgramming\DateUtil> The file test has been successfully renamed
PS C:\BatchProgramming\DateUtil> dir

    Directorio: C:\BatchProgramming\DateUtil


Mode                LastWriteTime     Length Name
----                -------------     ------ ----
-a---        09/02/2019     20:53  172077697 2019-02-09__22-38_test.flac
-a---        09/02/2019     21:46        105 dateutil.bat
-a---        09/02/2019     22:28       3876 dateutil.ps1
-a---        09/02/2019     21:45        107 dateutil_custom.bat
-a---        09/02/2019     21:45        111 dateutil_flac.bat
-a---        09/02/2019     21:47        105 dateutil_here.bat
-a---        09/02/2019     20:34        108 README.md


PS C:\BatchProgramming\DateUtil>
```