# BatchProgramming
Batch scripts for productivity optimization programmed using PowerShell

# DateUtil
A **Powershell script** for **appending the creation date to the name of each file in a folder**. Useful for organizing files
## Operations
This script contains the following operations, specified through the `operation` argument:
### append
For each file in the specified path, it appends the creation date of each file to its name.
##### Input:
`filename.format`
##### Output:
`yyyy-MM-dd__HH-mm_filename.format`

### append-old
For each file in the specified path, it appends the creation date of each file to its name. The output has a different format than `append`.
##### Input:
`filename.format`
##### Output:
`filename_yyyy-MM-dd__HH-mm.format`

### fix
For each file in the specified path, it swaps the name format from `append-old` output format to `append`
##### Input:
`filename_yyyy-MM-dd__HH-mm.format`
##### Output:
`yyyy-MM-dd__HH-mm_filename.format`
### unfix
For each file in the specified path, it swaps the name format from `append` output format to `append-old`
##### Input:
`yyyy-MM-dd__HH-mm_filename.format`
##### Output:
`filename_yyyy-MM-dd__HH-mm.format`
### remove
For each file in the specified path, it removes the date from the file name added using the `append` operation
##### Input:
`yyyy-MM-dd__HH-mm_filename.format`
##### Output:
`filename.format`


## Usage
### Arguments:
* `-operation`: Specify what operation to use
* `-format`: Specify the file extension of the files to modify
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


PS C:\BatchProgramming\DateUtil> ./dateutil.ps1 -operation append -format flac -path ./
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
