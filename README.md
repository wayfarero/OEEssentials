# OEEssentialsUtils Documentation

## Overview
This documentation provides an overview of the utilities and classes available in the `OEEssentialsUtils` library.

---

## Packages

### Summary of Available Packages

- [`Utils`](#utils)

---

## Utils

### Classes in Utils

- [BufferUtil.cls](#bufferutil)
- [CharacterExtentUtil.cls](#characterextentutil)
- [DataConversionUtil.cls](#dataconversionutil)
- [DateUtil.cls](#dateutil)
- [DecimalExtentUtil.cls](#decimalextentutil)
- [DecimalUtil.cls](#decimalutil)
- [EmailSenderUnixUtil.cls](#emailsenderunixutil)
- [EmailSenderWindowsUtil.cls](#emailsenderwindowsutil)
- [EmailUtil.cls](#emailutil)
- [FileUtil.cls](#fileutil)
- [Int64Util.cls](#int64util)
- [Integer64ExtentUtil.cls](#integer64extentutil)
- [IntegerExtentUtil.cls](#integerextentutil)
- [IntegerUtil.cls](#integerutil)
- [ListUtil.cls](#listutil)
- [LogicalUtil.cls](#logicalutil)
- [LongcharUtil.cls](#longcharutil)
- [MathUtil.cls](#mathutil)
- [MeasurementUnitUtil.cls](#measurementunitutil)
- [MemptrUtil.cls](#memptrutil)
- [package](#utils-package)
- [QueryUtil.cls](#queryutil)
- [RegexLinuxUtil.cls](#regexlinuxutil)
- [SessionUtil.cls](#sessionutil)
- [StringUtil.cls](#stringutil)
- [ValidatorUtil.cls](#validatorutil)

---

## BufferUtil

**Package:** Utils: BufferUtil CLASS

### Purpose
Sets the value of a field in the buffer

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [CreateBuffer(INPUT:character):HANDLE](#createbuffer)
- [GetFieldNames(INPUT:handle):CHARACTER](#getfieldnames)
- [SetBufferFieldValue(INPUT:handle,INPUT:character,INPUT:character):LOGICAL](#setbufferfieldvalue)

---

<a id="createbuffer"></a>
#### CreateBuffer
- **Signature**: CreateBuffer(INPUT:character):HANDLE
- **Purpose**: Creates a buffer for the specified table
- **Return type**: HANDLE handle
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcTableName: CHARACTER as character, the name of the table for which the buffer is to be created

---

<a id="getfieldnames"></a>
#### GetFieldNames
- **Signature**: GetFieldNames(INPUT:handle):CHARACTER
- **Purpose**: Retrieves the names of all fields in the buffer
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iphBuffer: HANDLE as handle, the handle of the buffer

---

<a id="setbufferfieldvalue"></a>
#### SetBufferFieldValue
- **Signature**: SetBufferFieldValue(INPUT:handle,INPUT:character,INPUT:character):LOGICAL
- **Purpose**: Sets the value of a field in the buffer
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iphBuffer: HANDLE as handle, the handle of the buffer
  - ipcFieldName: CHARACTER as character, the name of the field
  - ipcValue: CHARACTER as character, the new value to set for the field

---


## CharacterExtentUtil

**Package:** Utils: CharacterExtentUtil CLASS

### Purpose
Removes the first element of an array

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [AddElement(INPUT:character[],INPUT:character):CHARACTER[]](#addelement)
- [GetFirstElement(INPUT:character[]):CHARACTER](#getfirstelement)
- [HasElement(INPUT:character[],INPUT:character):LOGICAL](#haselement)
- [RemoveFirstElement(INPUT:character[]):CHARACTER[]](#removefirstelement)

---

<a id="addelement"></a>
#### AddElement
- **Signature**: AddElement(INPUT:character[],INPUT:character):CHARACTER[]
- **Purpose**: Add element to the array at the last position
- **Return type**: CHARACTER character extent
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipceArray: CHARACTER as character extent, the array
  - ipcElement: CHARACTER as character, the element to add

---

<a id="getfirstelement"></a>
#### GetFirstElement
- **Signature**: GetFirstElement(INPUT:character[]):CHARACTER
- **Purpose**: Returns the first element of an array
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipceArray: CHARACTER as character extent, the array

---

<a id="haselement"></a>
#### HasElement
- **Signature**: HasElement(INPUT:character[],INPUT:character):LOGICAL
- **Purpose**: Checks if array contains an element
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipceArray: CHARACTER as character extent, the array
  - ipcElement: CHARACTER as character, the element to search for

---

<a id="removefirstelement"></a>
#### RemoveFirstElement
- **Signature**: RemoveFirstElement(INPUT:character[]):CHARACTER[]
- **Purpose**: Removes the first element of an array
- **Return type**: CHARACTER character extent
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipceArray: CHARACTER as character extent, the array

---


## DataConversionUtil

**Package:** Utils: DataConversionUtil CLASS

### Purpose
Converts a string to a LOGICAL

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [DateTimeToString(INPUT:datetime):CHARACTER](#datetimetostring)
- [DateToISOString(INPUT:date):CHARACTER](#datetoisostring)
- [DecimalToString(INPUT:decimal):CHARACTER](#decimaltostring)
- [FormatDateTime(INPUT:datetime,INPUT:character):CHARACTER](#formatdatetime)
- [FormatInputDate(INPUT:character,INPUT:integer,INPUT:integer,INPUT:integer,INPUT:integer,INPUT:integer,INPUT:integer,INPUT:character):CHARACTER](#formatinputdate)
- [IntegerToString(INPUT:integer):CHARACTER](#integertostring)
- [StringToDate(INPUT:character):DATE](#stringtodate)
- [StringToDateTimeTz(INPUT:character):DATETIME-TZ](#stringtodatetimetz)
- [StringToInt64(INPUT:character):INT64](#stringtoint64)
- [StringToLogical(INPUT:character):LOGICAL](#stringtological)

---

<a id="datetimetostring"></a>
#### DateTimeToString
- **Signature**: DateTimeToString(INPUT:datetime):CHARACTER
- **Purpose**: Converts a DATETIME to its string representation
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdtDateTime: DATETIME as datetime, the datetime to be converted

---

<a id="datetoisostring"></a>
#### DateToISOString
- **Signature**: DateToISOString(INPUT:date):CHARACTER
- **Purpose**: Converts a date to ISO 8601 format
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdDate: DATE as date, the date to be converted

---

<a id="decimaltostring"></a>
#### DecimalToString
- **Signature**: DecimalToString(INPUT:decimal):CHARACTER
- **Purpose**: Converts a DECIMAL to its string representation
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeValue: DECIMAL as decimal, the decimal to be converted

---

<a id="formatdatetime"></a>
#### FormatDateTime
- **Signature**: FormatDateTime(INPUT:datetime,INPUT:character):CHARACTER
- **Purpose**: Dynamically formats a datetime based on the format string passed
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdtDateTime: DATETIME as datetime, the datetime to be formatted
  - ipcFormat: CHARACTER as character, the format for the datetime (e.g., 'YYYY-MM-DD HH:MM:SS')

---

<a id="formatinputdate"></a>
#### FormatInputDate
- **Signature**: FormatInputDate(INPUT:character,INPUT:integer,INPUT:integer,INPUT:integer,INPUT:integer,INPUT:integer,INPUT:integer,INPUT:character):CHARACTER
- **Purpose**: Formats a date and time
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcFormat: CHARACTER as character, the format for the date and time (e.g., 'YYYY-MM-DD HH:MI:SS')
  - ipiYear: INTEGER as integer, the year component of the date
  - ipiMonth: INTEGER as integer, the month component of the date
  - ipiDay: INTEGER as integer, the day component of the date
  - ipiHour: INTEGER as integer, the hour component of the time (optional, pass ? if not used)
  - ipiMinute: INTEGER as integer, the minute component of the time (optional, pass ? if not used)
  - ipiSecond: INTEGER as integer, the second component of the time (optional, pass ? if not used)
  - ipcTZ: CHARACTER as character, the timezone string (optional, pass ? if not used)

---

<a id="integertostring"></a>
#### IntegerToString
- **Signature**: IntegerToString(INPUT:integer):CHARACTER
- **Purpose**: Converts an INTEGER to its string representation
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiValue: INTEGER as integer, the integer to be converted

---

<a id="stringtodate"></a>
#### StringToDate
- **Signature**: StringToDate(INPUT:character):DATE
- **Purpose**: Converts a string to a date
- **Return type**: DATE date
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcDateString: CHARACTER as character, the string representation of the date

---

<a id="stringtodatetimetz"></a>
#### StringToDateTimeTz
- **Signature**: StringToDateTimeTz(INPUT:character):DATETIME-TZ
- **Purpose**: Converts a string to a DATETIMETZ
- **Return type**: DATETIME
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcValue: CHARACTER as character, the string representation of the datetime with timezone

---

<a id="stringtoint64"></a>
#### StringToInt64
- **Signature**: StringToInt64(INPUT:character):INT64
- **Purpose**: Converts a string to an INT64
- **Return type**: INT64 int64
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcValue: CHARACTER as character, the string representation of the INT64

---

<a id="stringtological"></a>
#### StringToLogical
- **Signature**: StringToLogical(INPUT:character):LOGICAL
- **Purpose**: Converts a string to a LOGICAL
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcValue: CHARACTER as character, the string representation of the logical (e.g., "TRUE", "FALSE", "1", "0")

---


## DateUtil

**Package:** Utils: DateUtil CLASS

### Purpose
Return the number of days in a given month and year

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [GetFirstDayOfMonth(INPUT:date):DATE](#getfirstdayofmonth)
- [GetFirstDayOfYearByYear(INPUT:integer):DATE](#getfirstdayofyearbyyear)
- [GetISOWeekNumber(INPUT:date):INTEGER](#getisoweeknumber)
- [GetLastDayOfYear(INPUT:date):DATE](#getlastdayofyear)
- [NumDaysInMonth(INPUT:integer,INPUT:integer):INTEGER](#numdaysinmonth)

---

<a id="getfirstdayofmonth"></a>
#### GetFirstDayOfMonth
- **Signature**: GetFirstDayOfMonth(INPUT:date):DATE
- **Purpose**: Return the first day of the month of a given date
- **Return type**: DATE date
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdDate: DATE as date, the date to get the first day of the month for

---

<a id="getfirstdayofyearbyyear"></a>
#### GetFirstDayOfYearByYear
- **Signature**: GetFirstDayOfYearByYear(INPUT:integer):DATE
- **Purpose**: Return the first day of the year of a given year
- **Return type**: DATE date
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiYear: INTEGER as integer, the year to get the first day of

---

<a id="getisoweeknumber"></a>
#### GetISOWeekNumber
- **Signature**: GetISOWeekNumber(INPUT:date):INTEGER
- **Purpose**: Return the week number of a given date
- **Return type**: INTEGER integer
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdDate: DATE as date, the date to get the week number for

---

<a id="getlastdayofyear"></a>
#### GetLastDayOfYear
- **Signature**: GetLastDayOfYear(INPUT:date):DATE
- **Purpose**: Return the last day of the year of a given date
- **Return type**: DATE date
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdDate: DATE as date, the date to get the last day of the year for

---

<a id="numdaysinmonth"></a>
#### NumDaysInMonth
- **Signature**: NumDaysInMonth(INPUT:integer,INPUT:integer):INTEGER
- **Purpose**: Return the number of days in a given month and year
- **Return type**: INTEGER integer
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiMonth: INTEGER as integer, the month
  - ipiYear: INTEGER as integer, the year

---


## DecimalExtentUtil

**Package:** Utils: DecimalExtentUtil CLASS

### Purpose
Removes the first element of an array

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [AddElement(INPUT:decimal[],INPUT:decimal):DECIMAL[]](#addelement)
- [GetAverage(INPUT:decimal[]):DECIMAL](#getaverage)
- [GetLastElement(INPUT:decimal[]):DECIMAL](#getlastelement)
- [GetMinValue(INPUT:decimal[]):DECIMAL](#getminvalue)
- [HasElement(INPUT:decimal[],INPUT:decimal):LOGICAL](#haselement)
- [RemoveFirstElement(INPUT:decimal[]):DECIMAL[]](#removefirstelement)

---

<a id="addelement"></a>
#### AddElement
- **Signature**: AddElement(INPUT:decimal[],INPUT:decimal):DECIMAL[]
- **Purpose**: Add element to the array at the last position
- **Return type**: DECIMAL decimal extent
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeeArray: DECIMAL as decimal extent, the array
  - ipdeElement: DECIMAL as decimal, the element to add

---

<a id="getaverage"></a>
#### GetAverage
- **Signature**: GetAverage(INPUT:decimal[]):DECIMAL
- **Purpose**: Returns the average of all elements in an array
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeeArray: DECIMAL as decimal extent, the array

---

<a id="getlastelement"></a>
#### GetLastElement
- **Signature**: GetLastElement(INPUT:decimal[]):DECIMAL
- **Purpose**: Returns the last element of an array
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeeArray: DECIMAL as decimal extent, the array

---

<a id="getminvalue"></a>
#### GetMinValue
- **Signature**: GetMinValue(INPUT:decimal[]):DECIMAL
- **Purpose**: Returns the minimum value of an array
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeeArray: DECIMAL

---

<a id="haselement"></a>
#### HasElement
- **Signature**: HasElement(INPUT:decimal[],INPUT:decimal):LOGICAL
- **Purpose**: Checks if array contains an element
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeeArray: DECIMAL as decimal extent, the array
  - ipdeElement: DECIMAL as decimal, the element to search for

---

<a id="removefirstelement"></a>
#### RemoveFirstElement
- **Signature**: RemoveFirstElement(INPUT:decimal[]):DECIMAL[]
- **Purpose**: Removes the first element of an array
- **Return type**: DECIMAL decimal extent
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeeArray: DECIMAL as decimal extent, the array

---


## DecimalUtil

**Package:** Utils: DecimalUtil CLASS

### Purpose
Round a decimal to an integer value

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [Abs(INPUT:decimal):DECIMAL](#abs)
- [IsNegative(INPUT:decimal):LOGICAL](#isnegative)
- [IsNotNullOrZero(INPUT:decimal):LOGICAL](#isnotnullorzero)
- [IsNull(INPUT:decimal):LOGICAL](#isnull)
- [IsPositive(INPUT:decimal):LOGICAL](#ispositive)
- [RoundDecimal(INPUT:decimal):INTEGER](#rounddecimal)

---

<a id="abs"></a>
#### Abs
- **Signature**: Abs(INPUT:decimal):DECIMAL
- **Purpose**: Return the absolute value of a given decimal
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDecimal: DECIMAL as decimal, the decimal to convert

---

<a id="isnegative"></a>
#### IsNegative
- **Signature**: IsNegative(INPUT:decimal):LOGICAL
- **Purpose**: Check if a given decimal is negative
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDecimal: DECIMAL as decimal, the decimal to check

---

<a id="isnotnullorzero"></a>
#### IsNotNullOrZero
- **Signature**: IsNotNullOrZero(INPUT:decimal):LOGICAL
- **Purpose**: Check if a given decimal is different from null and zero
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDecimal: DECIMAL as decimal, the decimal to check

---

<a id="isnull"></a>
#### IsNull
- **Signature**: IsNull(INPUT:decimal):LOGICAL
- **Purpose**: Check if a given decimal is null
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDecimal: DECIMAL as decimal, the decimal to check

---

<a id="ispositive"></a>
#### IsPositive
- **Signature**: IsPositive(INPUT:decimal):LOGICAL
- **Purpose**: Check if a given decimal is positive
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDecimal: DECIMAL as decimal, the decimal to check

---

<a id="rounddecimal"></a>
#### RoundDecimal
- **Signature**: RoundDecimal(INPUT:decimal):INTEGER
- **Purpose**: Round a decimal to an integer value
- **Return type**: INTEGER integer
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDecimal: DECIMAL as decimal, the decimal to round

---


## EmailSenderUnixUtil

**Package:** Utils: EmailSenderUnixUtil CLASS

### Purpose
Send an email on Linux using curl

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [SendEmail(INPUT:character,INPUT:character,INPUT:character,INPUT:character,INPUT:character,INPUT:integer,INPUT:character,INPUT:character)](#sendemail)

---

<a id="sendemail"></a>
#### SendEmail
- **Signature**: SendEmail(INPUT:character,INPUT:character,INPUT:character,INPUT:character,INPUT:character,INPUT:integer,INPUT:character,INPUT:character)
- **Purpose**: Send an email on Linux using curl
- **Return type**: VOID
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcToEmails: CHARACTER as character, the list of recipient emails, separated by commas
  - ipcFromEmail: CHARACTER as character, the sender's email address
  - ipcSubject: CHARACTER as character, the email subject
  - ipcBody: CHARACTER as character, the email body
  - ipcSmtpHost: CHARACTER as character, the SMTP host
  - ipcSmtpPort: INTEGER as integer, the SMTP port
  - ipcSmtpUser: CHARACTER as character, the SMTP username
  - ipcSmtpPassword: CHARACTER as character, the SMTP password

---


## EmailSenderWindowsUtil

**Package:** Utils: EmailSenderWindowsUtil CLASS

### Purpose
Send an email on Windows

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [SendEmail(INPUT:character,INPUT:character,INPUT:character,INPUT:character,INPUT:character)](#sendemail)

---

<a id="sendemail"></a>
#### SendEmail
- **Signature**: SendEmail(INPUT:character,INPUT:character,INPUT:character,INPUT:character,INPUT:character)
- **Purpose**: Send an email on Windows
- **Return type**: VOID
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcToEmails: CHARACTER as character, the list of recipient emails separated by commas
  - ipcFromEmail: CHARACTER as character, the sender's email address
  - ipcFromUserName: CHARACTER as character, the sender's username
  - ipcSubject: CHARACTER as character, the subject of the email
  - ipcBody: CHARACTER as character, the body of the email

---


## EmailUtil

**Package:** Utils: EmailUtil CLASS

### Purpose
Return the domain of an email

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [GetDomain(INPUT:character):CHARACTER](#getdomain)

---

<a id="getdomain"></a>
#### GetDomain
- **Signature**: GetDomain(INPUT:character):CHARACTER
- **Purpose**: Return the domain of an email
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcEmail: CHARACTER as character, the email string to get the domain from

---


## FileUtil

**Package:** Utils: FileUtil CLASS

### Purpose
Normalize a path for Unix systems

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [CopyFile(INPUT:character,INPUT:character,INPUT:character):LOGICAL](#copyfile)
- [DeleteEmptyFolders(INPUT:character)](#deleteemptyfolders)
- [FindFile(INPUT:character):CHARACTER](#findfile)
- [GetFileExtension(INPUT:character):CHARACTER](#getfileextension)
- [GetParentFolder(INPUT:character):CHARACTER](#getparentfolder)
- [GetParentFolderWindows(INPUT:character):CHARACTER](#getparentfolderwindows)
- [NormalizePath(INPUT:character):CHARACTER](#normalizepath)

---

<a id="copyfile"></a>
#### CopyFile
- **Signature**: CopyFile(INPUT:character,INPUT:character,INPUT:character):LOGICAL
- **Purpose**: Copy a file from one location to another
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcSourcePath: CHARACTER as character, the path for the file to copy
  - ipcTargetPath: CHARACTER as character, the path where the file will be copied
  - ipcFileName: CHARACTER as character, the name for the copied file

---

<a id="deleteemptyfolders"></a>
#### DeleteEmptyFolders
- **Signature**: DeleteEmptyFolders(INPUT:character)
- **Purpose**: Delete all empty folders
- **Return type**: VOID
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcPath: CHARACTER as character, the path to start the delete process

---

<a id="findfile"></a>
#### FindFile
- **Signature**: FindFile(INPUT:character):CHARACTER
- **Purpose**: Get the full path for the file
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcPath: CHARACTER as character, the path

---

<a id="getfileextension"></a>
#### GetFileExtension
- **Signature**: GetFileExtension(INPUT:character):CHARACTER
- **Purpose**: Get the file extension
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcPath: CHARACTER as character, the path to the file

---

<a id="getparentfolder"></a>
#### GetParentFolder
- **Signature**: GetParentFolder(INPUT:character):CHARACTER
- **Purpose**: Get the parent folder
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcPath: CHARACTER as character, the path to the folder

---

<a id="getparentfolderwindows"></a>
#### GetParentFolderWindows
- **Signature**: GetParentFolderWindows(INPUT:character):CHARACTER
- **Purpose**: Get the parent folder for Windows
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcPath: CHARACTER as character, the path to the folder

---

<a id="normalizepath"></a>
#### NormalizePath
- **Signature**: NormalizePath(INPUT:character):CHARACTER
- **Purpose**: Normalize a path for Unix systems
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcPath: CHARACTER as character, the path to be normalized

---


## Int64Util

**Package:** Utils: Int64Util CLASS

### Purpose
Check if a given int64 is zero

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [GenerateRandomInt64(INPUT:int64,INPUT:int64):INT64](#generaterandomint64)
- [IsNotNullOrZero(INPUT:int64):LOGICAL](#isnotnullorzero)
- [IsNull(INPUT:int64):LOGICAL](#isnull)
- [IsZero(INPUT:int64):LOGICAL](#iszero)

---

<a id="generaterandomint64"></a>
#### GenerateRandomInt64
- **Signature**: GenerateRandomInt64(INPUT:int64,INPUT:int64):INT64
- **Purpose**: Generate a random int64 within a specified range
- **Return type**: INT64 int64
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64RangeStart: INT64 as int64, the start of the range
  - ipi64RangeEnd: INT64 as int64, the end of the range

---

<a id="isnotnullorzero"></a>
#### IsNotNullOrZero
- **Signature**: IsNotNullOrZero(INPUT:int64):LOGICAL
- **Purpose**: Check if a given int64 is different from null and zero
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64Element: INT64 as int64, the int64 to check

---

<a id="isnull"></a>
#### IsNull
- **Signature**: IsNull(INPUT:int64):LOGICAL
- **Purpose**: Check if a given int64 is null
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64Element: INT64 as int64, the int64 to check

---

<a id="iszero"></a>
#### IsZero
- **Signature**: IsZero(INPUT:int64):LOGICAL
- **Purpose**: Check if a given int64 is zero
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64Element: INT64 as int64, the int64 to check

---


## Integer64ExtentUtil

**Package:** Utils: Integer64ExtentUtil CLASS

### Purpose
Removes the first element of an array

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [AddElement(INPUT:int64[],INPUT:int64):INT64[]](#addelement)
- [GetAverage(INPUT:int64[]):DECIMAL](#getaverage)
- [GetLastElement(INPUT:int64[]):INT64](#getlastelement)
- [GetMinValue(INPUT:int64[]):INT64](#getminvalue)
- [HasElement(INPUT:int64[],INPUT:int64):LOGICAL](#haselement)
- [RemoveFirstElement(INPUT:int64[]):INT64[]](#removefirstelement)

---

<a id="addelement"></a>
#### AddElement
- **Signature**: AddElement(INPUT:int64[],INPUT:int64):INT64[]
- **Purpose**: Add an element to the array at the last position
- **Return type**: INT64 int64 extent
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64eArray: INT64 as int64 extent, the array
  - ipi64Element: INT64 as int64, the element to add

---

<a id="getaverage"></a>
#### GetAverage
- **Signature**: GetAverage(INPUT:int64[]):DECIMAL
- **Purpose**: Returns the average of all elements in an array
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64eArray: INT64 as int64 extent, the array

---

<a id="getlastelement"></a>
#### GetLastElement
- **Signature**: GetLastElement(INPUT:int64[]):INT64
- **Purpose**: Returns the last element of an array
- **Return type**: INT64 int64
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64eArray: INT64 as int64 extent, the array

---

<a id="getminvalue"></a>
#### GetMinValue
- **Signature**: GetMinValue(INPUT:int64[]):INT64
- **Purpose**: Returns the minimum value of an array
- **Return type**: INT64 int64
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64eArray: INT64 as int64 extent, the array

---

<a id="haselement"></a>
#### HasElement
- **Signature**: HasElement(INPUT:int64[],INPUT:int64):LOGICAL
- **Purpose**: Checks if an array contains a specific element
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64eArray: INT64 as int64 extent, the array
  - ipi64Element: INT64 as int64, the element to search for

---

<a id="removefirstelement"></a>
#### RemoveFirstElement
- **Signature**: RemoveFirstElement(INPUT:int64[]):INT64[]
- **Purpose**: Removes the first element of an array
- **Return type**: INT64 int64 extent
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipi64eArray: INT64 as int64 extent, the array

---


## IntegerExtentUtil

**Package:** Utils: IntegerExtentUtil CLASS

### Purpose
Removes the first element of an array

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [AddElement(INPUT:integer[],INPUT:integer):INTEGER[]](#addelement)
- [GetAverage(INPUT:integer[]):DECIMAL](#getaverage)
- [GetLastElement(INPUT:integer[]):INTEGER](#getlastelement)
- [GetMinValue(INPUT:integer[]):INTEGER](#getminvalue)
- [HasElement(INPUT:integer[],INPUT:integer):LOGICAL](#haselement)
- [RemoveFirstElement(INPUT:integer[]):INTEGER[]](#removefirstelement)

---

<a id="addelement"></a>
#### AddElement
- **Signature**: AddElement(INPUT:integer[],INPUT:integer):INTEGER[]
- **Purpose**: Add an element to the array at the last position
- **Return type**: INTEGER integer extent
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipieArray: INTEGER as integer extent, the array
  - ipiElement: INTEGER as integer, the element to add

---

<a id="getaverage"></a>
#### GetAverage
- **Signature**: GetAverage(INPUT:integer[]):DECIMAL
- **Purpose**: Returns the average of all elements in an array
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipieArray: INTEGER as integer extent, the array

---

<a id="getlastelement"></a>
#### GetLastElement
- **Signature**: GetLastElement(INPUT:integer[]):INTEGER
- **Purpose**: Returns the last element of an array
- **Return type**: INTEGER integer
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipieArray: INTEGER as integer extent, the array

---

<a id="getminvalue"></a>
#### GetMinValue
- **Signature**: GetMinValue(INPUT:integer[]):INTEGER
- **Purpose**: Returns the minimum value of an array
- **Return type**: INTEGER integer
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipieArray: INTEGER as integer extent, the array

---

<a id="haselement"></a>
#### HasElement
- **Signature**: HasElement(INPUT:integer[],INPUT:integer):LOGICAL
- **Purpose**: Checks if an array contains a specific element
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipieArray: INTEGER as integer extent, the array
  - ipiElement: INTEGER as integer, the element to search for

---

<a id="removefirstelement"></a>
#### RemoveFirstElement
- **Signature**: RemoveFirstElement(INPUT:integer[]):INTEGER[]
- **Purpose**: Removes the first element of an array
- **Return type**: INTEGER integer extent
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipieArray: INTEGER as integer extent, the array

---


## IntegerUtil

**Package:** Utils: IntegerUtil CLASS

### Purpose
Converts a given integer to its string representation

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [Abs(INPUT:integer):INTEGER](#abs)
- [IsEven(INPUT:integer):LOGICAL](#iseven)
- [IsNotNull(INPUT:integer):LOGICAL](#isnotnull)
- [IsNotZero(INPUT:integer):LOGICAL](#isnotzero)
- [IsNullOrZero(INPUT:integer):LOGICAL](#isnullorzero)
- [IsPositive(INPUT:integer):LOGICAL](#ispositive)
- [ToString(INPUT:integer):CHARACTER](#tostring)

---

<a id="abs"></a>
#### Abs
- **Signature**: Abs(INPUT:integer):INTEGER
- **Purpose**: Returns the absolute value of a given integer
- **Return type**: INTEGER integer
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiInteger: INTEGER as integer, the integer to check

---

<a id="iseven"></a>
#### IsEven
- **Signature**: IsEven(INPUT:integer):LOGICAL
- **Purpose**: Checks if a given integer is even
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiInteger: INTEGER as integer, the integer to check

---

<a id="isnotnull"></a>
#### IsNotNull
- **Signature**: IsNotNull(INPUT:integer):LOGICAL
- **Purpose**: Checks if a given integer is not null
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiInteger: INTEGER as integer, the integer to check

---

<a id="isnotzero"></a>
#### IsNotZero
- **Signature**: IsNotZero(INPUT:integer):LOGICAL
- **Purpose**: Checks if a given integer is not zero
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiInteger: INTEGER as integer, the integer to check

---

<a id="isnullorzero"></a>
#### IsNullOrZero
- **Signature**: IsNullOrZero(INPUT:integer):LOGICAL
- **Purpose**: Checks if a given integer is either null or zero
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiInteger: INTEGER as integer, the integer to check

---

<a id="ispositive"></a>
#### IsPositive
- **Signature**: IsPositive(INPUT:integer):LOGICAL
- **Purpose**: Checks if a given integer is positive
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiInteger: INTEGER as integer, the integer to check

---

<a id="tostring"></a>
#### ToString
- **Signature**: ToString(INPUT:integer):CHARACTER
- **Purpose**: Converts a given integer to its string representation
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipiInteger: INTEGER as integer, the integer to be converted

---


## ListUtil

**Package:** Utils: ListUtil CLASS

### Purpose
Sorts the elements in the list using the default comparer

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [AddElement(INPUT:character,INPUT:character):CHARACTER](#addelement)
- [AddElement(INPUT:List,INPUT:string)](#addelement)
- [AddElementByPosition(INPUT:character,INPUT:character,INPUT:integer):CHARACTER](#addelementbyposition)
- [GetFirstElement(INPUT:character):CHARACTER](#getfirstelement)
- [GetFirstElement(INPUT:List):CHARACTER](#getfirstelement)
- [GetLastElement(INPUT:character,INPUT:character):CHARACTER](#getlastelement)
- [HasDuplicates(INPUT:character):LOGICAL](#hasduplicates)
- [HasDuplicates(INPUT:List):LOGICAL](#hasduplicates)
- [HasElement(INPUT:List,INPUT:string):LOGICAL](#haselement)
- [HasEmptyElements(INPUT:character,INPUT:character):LOGICAL](#hasemptyelements)
- [RemoveElement(INPUT:character,INPUT:character):CHARACTER](#removeelement)
- [RemoveElement(INPUT:List,INPUT:string)](#removeelement)
- [RemoveElementByPosition(INPUT:character,INPUT:integer,INPUT:character):CHARACTER](#removeelementbyposition)
- [RemoveEmptyElements(INPUT:character):CHARACTER](#removeemptyelements)
- [RemoveEmptyElements(INPUT:List)](#removeemptyelements)
- [SortList(INPUT:character,INPUT:character):CHARACTER](#sortlist)

---

<a id="addelement"></a>
#### AddElement
- **Signature**: AddElement(INPUT:character,INPUT:character):CHARACTER
- **Purpose**: Adds a new element at the end of the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to add the element to
  - ipcElement: CHARACTER as character, the element to add

---

<a id="addelement"></a>
#### AddElement
- **Signature**: AddElement(INPUT:List,INPUT:string)
- **Purpose**: Adds a new element at the end of the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to add the element to
  - ipcElement: CHARACTER as character, the element to add

---

<a id="addelementbyposition"></a>
#### AddElementByPosition
- **Signature**: AddElementByPosition(INPUT:character,INPUT:character,INPUT:integer):CHARACTER
- **Purpose**: Adds a new list element at the specified position
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to add the element to
  - ipcElement: CHARACTER as character, the element to add
  - ipcSeparator: CHARACTER as character, the list separator
  - ipiPosition: INTEGER as integer, the position to add the element to

---

<a id="getfirstelement"></a>
#### GetFirstElement
- **Signature**: GetFirstElement(INPUT:character):CHARACTER
- **Purpose**: Returns the first element from the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list

---

<a id="getfirstelement"></a>
#### GetFirstElement
- **Signature**: GetFirstElement(INPUT:List):CHARACTER
- **Purpose**: Returns the first element from the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list

---

<a id="getlastelement"></a>
#### GetLastElement
- **Signature**: GetLastElement(INPUT:character,INPUT:character):CHARACTER
- **Purpose**: Returns the last element from the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list

---

<a id="hasduplicates"></a>
#### HasDuplicates
- **Signature**: HasDuplicates(INPUT:character):LOGICAL
- **Purpose**: Checks if the list has any duplicate elements
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to check

---

<a id="hasduplicates"></a>
#### HasDuplicates
- **Signature**: HasDuplicates(INPUT:List):LOGICAL
- **Purpose**: Checks if the list has any duplicate elements
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to check

---

<a id="haselement"></a>
#### HasElement
- **Signature**: HasElement(INPUT:List,INPUT:string):LOGICAL
- **Purpose**: Checks if the list contains a specific element
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to search in
  - ipcElement: CHARACTER as character, the element to search for

---

<a id="hasemptyelements"></a>
#### HasEmptyElements
- **Signature**: HasEmptyElements(INPUT:character,INPUT:character):LOGICAL
- **Purpose**: Checks if the list has any empty elements
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to check

---

<a id="removeelement"></a>
#### RemoveElement
- **Signature**: RemoveElement(INPUT:character,INPUT:character):CHARACTER
- **Purpose**: Removes an element from the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to remove the element from
  - ipcElement: CHARACTER as character, the element to remove

---

<a id="removeelement"></a>
#### RemoveElement
- **Signature**: RemoveElement(INPUT:List,INPUT:string)
- **Purpose**: Removes an element from the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to remove the element from
  - ipcElement: CHARACTER as character, the element to remove

---

<a id="removeelementbyposition"></a>
#### RemoveElementByPosition
- **Signature**: RemoveElementByPosition(INPUT:character,INPUT:integer,INPUT:character):CHARACTER
- **Purpose**: Removes an element at the specified position
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to remove the element from
  - ipiPosition: INTEGER as integer, the position of the element to remove

---

<a id="removeemptyelements"></a>
#### RemoveEmptyElements
- **Signature**: RemoveEmptyElements(INPUT:character):CHARACTER
- **Purpose**: Removes all empty elements from the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to clean

---

<a id="removeemptyelements"></a>
#### RemoveEmptyElements
- **Signature**: RemoveEmptyElements(INPUT:List)
- **Purpose**: Removes all empty elements from the list
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to clean

---

<a id="sortlist"></a>
#### SortList
- **Signature**: SortList(INPUT:character,INPUT:character):CHARACTER
- **Purpose**: Sorts the elements in the list using the default comparer
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcList: CHARACTER as character, the list to sort

---


## LogicalUtil

**Package:** Utils: LogicalUtil CLASS

### Purpose
Converts a logical value to its string representation

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [IsFalse(INPUT:logical):LOGICAL](#isfalse)
- [IsNull(INPUT:logical):LOGICAL](#isnull)
- [LogicalAnd(INPUT:logical,INPUT:logical):LOGICAL](#logicaland)
- [LogicalOr(INPUT:logical,INPUT:logical):LOGICAL](#logicalor)
- [ToString(INPUT:logical):CHARACTER](#tostring)

---

<a id="isfalse"></a>
#### IsFalse
- **Signature**: IsFalse(INPUT:logical):LOGICAL
- **Purpose**: Checks if a logical value is explicitly FALSE
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplValue: LOGICAL as logical, the logical value to check

---

<a id="isnull"></a>
#### IsNull
- **Signature**: IsNull(INPUT:logical):LOGICAL
- **Purpose**: Checks if a logical value is null
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplValue: LOGICAL as logical, the logical value to check

---

<a id="logicaland"></a>
#### LogicalAnd
- **Signature**: LogicalAnd(INPUT:logical,INPUT:logical):LOGICAL
- **Purpose**: Performs a logical AND operation between two logical values
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplValue1: LOGICAL as logical, the first logical value
  - iplValue2: LOGICAL as logical, the second logical value

---

<a id="logicalor"></a>
#### LogicalOr
- **Signature**: LogicalOr(INPUT:logical,INPUT:logical):LOGICAL
- **Purpose**: Performs a logical OR operation between two logical values
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplValue1: LOGICAL as logical, the first logical value
  - iplValue2: LOGICAL as logical, the second logical value

---

<a id="tostring"></a>
#### ToString
- **Signature**: ToString(INPUT:logical):CHARACTER
- **Purpose**: Converts a logical value to its string representation
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplValue: LOGICAL as logical, the logical value to convert

---


## LongcharUtil

**Package:** Utils: LongcharUtil CLASS

### Purpose
Format a string to PascalCase

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [ContainsNumber(INPUT:longchar):LOGICAL](#containsnumber)
- [IsEmpty(INPUT:longchar):LOGICAL](#isempty)
- [IsNotEmpty(INPUT:longchar):LOGICAL](#isnotempty)
- [IsNotNullOrEmpty(INPUT:longchar):LOGICAL](#isnotnullorempty)
- [IsNullOrEmpty(INPUT:longchar):LOGICAL](#isnullorempty)
- [Quote(INPUT:longchar):LONGCHAR](#quote)
- [SetTokenValueInString(INPUT:longchar,INPUT:longchar,INPUT:integer):LONGCHAR](#settokenvalueinstring)
- [StartWithLowercase(INPUT:longchar):LONGCHAR](#startwithlowercase)
- [StringToPascalCase(INPUT:longchar,INPUT:character):LONGCHAR](#stringtopascalcase)

---

<a id="containsnumber"></a>
#### ContainsNumber
- **Signature**: ContainsNumber(INPUT:longchar):LOGICAL
- **Purpose**: Check if a string contains a number
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the string to check

---

<a id="isempty"></a>
#### IsEmpty
- **Signature**: IsEmpty(INPUT:longchar):LOGICAL
- **Purpose**: Check if a string is empty
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the string to check

---

<a id="isnotempty"></a>
#### IsNotEmpty
- **Signature**: IsNotEmpty(INPUT:longchar):LOGICAL
- **Purpose**: Check if a string is not empty
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the string to check

---

<a id="isnotnullorempty"></a>
#### IsNotNullOrEmpty
- **Signature**: IsNotNullOrEmpty(INPUT:longchar):LOGICAL
- **Purpose**: Check if a string is not null or empty
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the string to check

---

<a id="isnullorempty"></a>
#### IsNullOrEmpty
- **Signature**: IsNullOrEmpty(INPUT:longchar):LOGICAL
- **Purpose**: Check if a string is null or empty
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the string to check

---

<a id="quote"></a>
#### Quote
- **Signature**: Quote(INPUT:longchar):LONGCHAR
- **Purpose**: Add quotes to a string
- **Return type**: LONGCHAR longchar
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the string to modify

---

<a id="settokenvalueinstring"></a>
#### SetTokenValueInString
- **Signature**: SetTokenValueInString(INPUT:longchar,INPUT:longchar,INPUT:integer):LONGCHAR
- **Purpose**: Set the value of a token in a tokenized string
- **Return type**: LONGCHAR longchar
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the tokenized string
  - iplcTokenValue: LONGCHAR as longchar, the token value to set
  - ipiPosition: INTEGER as integer, the position of the token

---

<a id="startwithlowercase"></a>
#### StartWithLowercase
- **Signature**: StartWithLowercase(INPUT:longchar):LONGCHAR
- **Purpose**: Lowercase the first letter of a string
- **Return type**: LONGCHAR longchar
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the string to modify

---

<a id="stringtopascalcase"></a>
#### StringToPascalCase
- **Signature**: StringToPascalCase(INPUT:longchar,INPUT:character):LONGCHAR
- **Purpose**: Format a string to PascalCase
- **Return type**: LONGCHAR longchar
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iplcString: LONGCHAR as longchar, the string to modify
  - ipcSeparator: CHARACTER as character, the string separator

---


## MathUtil

**Package:** Utils: MathUtil CLASS

### Purpose
Calculate the number of days until the next birthday from today

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [CalculateAge(INPUT:date):INTEGER](#calculateage)
- [CalculateCos(INPUT:decimal):DECIMAL](#calculatecos)
- [CalculateSin(INPUT:decimal):DECIMAL](#calculatesin)
- [CosDegrees(INPUT:decimal):DECIMAL](#cosdegrees)
- [RoundDown(INPUT:decimal):DECIMAL](#rounddown)
- [RoundToWhole(INPUT:decimal):DECIMAL](#roundtowhole)
- [SinDegrees(INPUT:decimal):DECIMAL](#sindegrees)
- [TanDegrees(INPUT:decimal):DECIMAL](#tandegrees)
- [TimeUntilBirthday(INPUT:date):INTEGER](#timeuntilbirthday)

---

<a id="calculateage"></a>
#### CalculateAge
- **Signature**: CalculateAge(INPUT:date):INTEGER
- **Purpose**: Calculate the age in years based on a birthdate
- **Return type**: INTEGER integer
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdBirthDate: DATE as date, the date of birth

---

<a id="calculatecos"></a>
#### CalculateCos
- **Signature**: CalculateCos(INPUT:decimal):DECIMAL
- **Purpose**: Calculate the cosine using libm
- **Return type**: System
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeAngle: System.Decimal as decimal, the angle in radians

---

<a id="calculatesin"></a>
#### CalculateSin
- **Signature**: CalculateSin(INPUT:decimal):DECIMAL
- **Purpose**: Calculate the sine using libm
- **Return type**: System
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeAngle: System.Decimal as decimal, the angle in radians

---

<a id="cosdegrees"></a>
#### CosDegrees
- **Signature**: CosDegrees(INPUT:decimal):DECIMAL
- **Purpose**: Calculate the cosine of an angle in degrees
- **Return type**: System
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDegrees: System.Decimal as decimal, the angle in degrees

---

<a id="rounddown"></a>
#### RoundDown
- **Signature**: RoundDown(INPUT:decimal):DECIMAL
- **Purpose**: Rounds a decimal value down to the nearest whole number
- **Return type**: System
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeValue: System.Decimal as decimal, the value to round down

---

<a id="roundtowhole"></a>
#### RoundToWhole
- **Signature**: RoundToWhole(INPUT:decimal):DECIMAL
- **Purpose**: Rounds a decimal value to the nearest whole number
- **Return type**: System
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeValue: System.Decimal as decimal, the value to round

---

<a id="sindegrees"></a>
#### SinDegrees
- **Signature**: SinDegrees(INPUT:decimal):DECIMAL
- **Purpose**: Calculate the sine of an angle in degrees
- **Return type**: System
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDegrees: System.Decimal as decimal, the angle in degrees

---

<a id="tandegrees"></a>
#### TanDegrees
- **Signature**: TanDegrees(INPUT:decimal):DECIMAL
- **Purpose**: Calculate the tangent of an angle in degrees
- **Return type**: System
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeDegrees: System.Decimal as decimal, the angle in degrees

---

<a id="timeuntilbirthday"></a>
#### TimeUntilBirthday
- **Signature**: TimeUntilBirthday(INPUT:date):INTEGER
- **Purpose**: Calculate the number of days until the next birthday from today
- **Return type**: INTEGER integer
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdBirthDate: DATE as date, the date of birth

---


## MeasurementUnitUtil

**Package:** Utils: MeasurementUnitUtil CLASS

### Purpose
Convert US Gallons to Liters

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [CelsiusToFahrenheit(INPUT:decimal):DECIMAL](#celsiustofahrenheit)
- [FahrenheitToCelsius(INPUT:decimal):DECIMAL](#fahrenheittocelsius)
- [GramsToOunces(INPUT:decimal):DECIMAL](#gramstoounces)
- [KilogramsToPounds(INPUT:decimal):DECIMAL](#kilogramstopounds)
- [KilometersToMiles(INPUT:decimal):DECIMAL](#kilometerstomiles)
- [LitersToQuarts(INPUT:decimal):DECIMAL](#literstoquarts)
- [MetersToFeet(INPUT:decimal):DECIMAL](#meterstofeet)
- [MilesToKilometers(INPUT:decimal):DECIMAL](#milestokilometers)
- [PintsToLiters(INPUT:decimal):DECIMAL](#pintstoliters)
- [QuartsToLiters(INPUT:decimal):DECIMAL](#quartstoliters)
- [USGallonsToLiters(INPUT:decimal):DECIMAL](#usgallonstoliters)

---

<a id="celsiustofahrenheit"></a>
#### CelsiusToFahrenheit
- **Signature**: CelsiusToFahrenheit(INPUT:decimal):DECIMAL
- **Purpose**: Convert Celsius to Fahrenheit
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeCelsius: DECIMAL as decimal, the temperature in Celsius

---

<a id="fahrenheittocelsius"></a>
#### FahrenheitToCelsius
- **Signature**: FahrenheitToCelsius(INPUT:decimal):DECIMAL
- **Purpose**: Convert Fahrenheit to Celsius
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeFahrenheit: DECIMAL as decimal, the temperature in Fahrenheit

---

<a id="gramstoounces"></a>
#### GramsToOunces
- **Signature**: GramsToOunces(INPUT:decimal):DECIMAL
- **Purpose**: Convert Grams to Ounces
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeGrams: DECIMAL as decimal, the value in grams

---

<a id="kilogramstopounds"></a>
#### KilogramsToPounds
- **Signature**: KilogramsToPounds(INPUT:decimal):DECIMAL
- **Purpose**: Convert Kilograms to Pounds
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeKilograms: DECIMAL as decimal, the value in kilograms

---

<a id="kilometerstomiles"></a>
#### KilometersToMiles
- **Signature**: KilometersToMiles(INPUT:decimal):DECIMAL
- **Purpose**: Convert Kilometers to Miles
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeKilometers: DECIMAL as decimal, the value in kilometers

---

<a id="literstoquarts"></a>
#### LitersToQuarts
- **Signature**: LitersToQuarts(INPUT:decimal):DECIMAL
- **Purpose**: Convert Liters to Quarts
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeLiters: DECIMAL as decimal, the value in liters

---

<a id="meterstofeet"></a>
#### MetersToFeet
- **Signature**: MetersToFeet(INPUT:decimal):DECIMAL
- **Purpose**: Convert Meters to Feet
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeMeters: DECIMAL as decimal, the value in meters

---

<a id="milestokilometers"></a>
#### MilesToKilometers
- **Signature**: MilesToKilometers(INPUT:decimal):DECIMAL
- **Purpose**: Convert Miles to Kilometers
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeMiles: DECIMAL as decimal, the value in miles

---

<a id="pintstoliters"></a>
#### PintsToLiters
- **Signature**: PintsToLiters(INPUT:decimal):DECIMAL
- **Purpose**: Convert Pints to Liters
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdePints: DECIMAL as decimal, the value in pints

---

<a id="quartstoliters"></a>
#### QuartsToLiters
- **Signature**: QuartsToLiters(INPUT:decimal):DECIMAL
- **Purpose**: Convert Quarts to Liters
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeQuarts: DECIMAL as decimal, the value in quarts

---

<a id="usgallonstoliters"></a>
#### USGallonsToLiters
- **Signature**: USGallonsToLiters(INPUT:decimal):DECIMAL
- **Purpose**: Convert US Gallons to Liters
- **Return type**: DECIMAL decimal
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipdeGallons: DECIMAL as decimal, the value in US gallons

---


## MemptrUtil

**Package:** Utils: MemptrUtil CLASS

### Purpose
Converts the contents of a memptr to a string

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [AllocateMemory(INPUT-OUTPUT:memptr,INPUT:integer)](#allocatememory)
- [CopyMemory(INPUT:memptr,INPUT-OUTPUT:memptr,INPUT:integer)](#copymemory)
- [FromString(INPUT:character,INPUT-OUTPUT:memptr)](#fromstring)
- [IsNotNull(INPUT:memptr):LOGICAL](#isnotnull)
- [ToString(INPUT:memptr):CHARACTER](#tostring)

---

<a id="allocatememory"></a>
#### AllocateMemory
- **Signature**: AllocateMemory(INPUT-OUTPUT:memptr,INPUT:integer)
- **Purpose**: Allocates memory for a memptr with the specified size
- **Return type**: VOID
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iopmptrPointer: MEMPTR as memptr, the memptr to allocate memory for
  - ipiSize: INTEGER as integer, the size in bytes to allocate

---

<a id="copymemory"></a>
#### CopyMemory
- **Signature**: CopyMemory(INPUT:memptr,INPUT-OUTPUT:memptr,INPUT:integer)
- **Purpose**: Copies data from one memptr to another
- **Return type**: VOID
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipmptrSource: MEMPTR as memptr, the source memptr
  - iopmptrTarget: MEMPTR as memptr, the target memptr
  - ipiSize: INTEGER as integer, the number of bytes to copy

---

<a id="fromstring"></a>
#### FromString
- **Signature**: FromString(INPUT:character,INPUT-OUTPUT:memptr)
- **Purpose**: Converts a string into a memptr
- **Return type**: VOID
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcData: CHARACTER as character, the string to convert
  - iopmptrPointer: MEMPTR as memptr, the memptr to populate with string data

---

<a id="isnotnull"></a>
#### IsNotNull
- **Signature**: IsNotNull(INPUT:memptr):LOGICAL
- **Purpose**: Determines if the given memptr is not null
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipmptrPointer: MEMPTR as memptr, the memptr to check

---

<a id="tostring"></a>
#### ToString
- **Signature**: ToString(INPUT:memptr):CHARACTER
- **Purpose**: Converts the contents of a memptr to a string
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipmptrPointer: MEMPTR as memptr, the memptr to convert

---


## Utils PACKAGE

**Package:** Unknown Package

### Purpose
No purpose provided

### Author(s)
Unknown author

### Created
Unknown date

### Super Class
`Unknown superclass`

---

### Methods

#### Summary of Available Methods

- [BufferUtil.cls](#bufferutilcls)
- [CharacterExtentUtil.cls](#characterextentutilcls)
- [DataConversionUtil.cls](#dataconversionutilcls)
- [DateUtil.cls](#dateutilcls)
- [DecimalExtentUtil.cls](#decimalextentutilcls)
- [DecimalUtil.cls](#decimalutilcls)
- [EmailSenderUnixUtil.cls](#emailsenderunixutilcls)
- [EmailSenderWindowsUtil.cls](#emailsenderwindowsutilcls)
- [EmailUtil.cls](#emailutilcls)
- [FileUtil.cls](#fileutilcls)
- [Int64Util.cls](#int64utilcls)
- [Integer64ExtentUtil.cls](#integer64extentutilcls)
- [IntegerExtentUtil.cls](#integerextentutilcls)
- [IntegerUtil.cls](#integerutilcls)
- [ListUtil.cls](#listutilcls)
- [LogicalUtil.cls](#logicalutilcls)
- [LongcharUtil.cls](#longcharutilcls)
- [MathUtil.cls](#mathutilcls)
- [MeasurementUnitUtil.cls](#measurementunitutilcls)
- [MemptrUtil.cls](#memptrutilcls)
- [QueryUtil.cls](#queryutilcls)
- [RegexLinuxUtil.cls](#regexlinuxutilcls)
- [SessionUtil.cls](#sessionutilcls)
- [StringUtil.cls](#stringutilcls)
- [ValidatorUtil.cls](#validatorutilcls)

---


## QueryUtil

**Package:** Utils: QueryUtil CLASS

### Purpose
Appends the sorting expression to the query string

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [AddBuffer(INPUT:handle,INPUT:character):HANDLE](#addbuffer)
- [GetExpressionForField(INPUT:character,INPUT:character):CHARACTER](#getexpressionforfield)
- [GetQuerySort(INPUT:character):CHARACTER](#getquerysort)
- [PrepareQuery(INPUT:character,INPUT:character,INPUT:character):CHARACTER](#preparequery)
- [SetQuerySort(INPUT:character,INPUT:character):CHARACTER](#setquerysort)

---

<a id="addbuffer"></a>
#### AddBuffer
- **Signature**: AddBuffer(INPUT:handle,INPUT:character):HANDLE
- **Purpose**: Adds a buffer to an existing query
- **Return type**: HANDLE handle
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - iphQuery: HANDLE as handle, the existing query handle
  - ipcTableName: CHARACTER as character, the name of the table to add

---

<a id="getexpressionforfield"></a>
#### GetExpressionForField
- **Signature**: GetExpressionForField(INPUT:character,INPUT:character):CHARACTER
- **Purpose**: Retrieves the expression for a specified field in the WHERE clause of the query
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcQuery: CHARACTER as character, the existing query string
  - ipcField: CHARACTER as character, the field to locate

---

<a id="getquerysort"></a>
#### GetQuerySort
- **Signature**: GetQuerySort(INPUT:character):CHARACTER
- **Purpose**: Retrieves the sort criteria from a given query string
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcQuery: CHARACTER as character, the full query string

---

<a id="preparequery"></a>
#### PrepareQuery
- **Signature**: PrepareQuery(INPUT:character,INPUT:character,INPUT:character):CHARACTER
- **Purpose**: Prepares the query with sorting and filtering expressions
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcTableName: CHARACTER as character, the table name
  - ipcFilterExpression: CHARACTER as character, the filter expression to add
  - ipcSortExpression: CHARACTER as character, the sorting expression to add

---

<a id="setquerysort"></a>
#### SetQuerySort
- **Signature**: SetQuerySort(INPUT:character,INPUT:character):CHARACTER
- **Purpose**: Appends the sorting expression to the query string
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcQuery: CHARACTER as character, the existing query string
  - ipcSortExpression: CHARACTER as character, the sorting expression to add

---


## RegexLinuxUtil

**Package:** Utils: RegexLinuxUtil CLASS

### Purpose
Matches a string against a regex pattern using a Linux command

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [MatchRegex(INPUT:character,INPUT:character):LOGICAL](#matchregex)

---

<a id="matchregex"></a>
#### MatchRegex
- **Signature**: MatchRegex(INPUT:character,INPUT:character):LOGICAL
- **Purpose**: Matches a string against a regex pattern using a Linux command
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcPattern: CHARACTER as character, the regex pattern to use for matching
  - ipcTestString: CHARACTER as character, the string to test against the regex

---


## SessionUtil

**Package:** Utils: SessionUtil CLASS

### Purpose
Sets the numeric format in the session

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [GetDateFormat():CHARACTER](#getdateformat)
- [GetNumericFormat():CHARACTER](#getnumericformat)
- [GetStartupParameters():CHARACTER](#getstartupparameters)
- [SetNumericFormat(INPUT:character)](#setnumericformat)

---

<a id="getdateformat"></a>
#### GetDateFormat
- **Signature**: GetDateFormat():CHARACTER
- **Purpose**: Retrieves the current session date format
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC

---

<a id="getnumericformat"></a>
#### GetNumericFormat
- **Signature**: GetNumericFormat():CHARACTER
- **Purpose**: Retrieves the current numeric format
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC

---

<a id="getstartupparameters"></a>
#### GetStartupParameters
- **Signature**: GetStartupParameters():CHARACTER
- **Purpose**: Retrieves session startup parameters as a single character string
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC

---

<a id="setnumericformat"></a>
#### SetNumericFormat
- **Signature**: SetNumericFormat(INPUT:character)
- **Purpose**: Sets the numeric format in the session
- **Return type**: VOID
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcNumericFormat: CHARACTER as character, the desired numeric format for the session

---


## StringUtil

**Package:** Utils: StringUtil CLASS

### Purpose
Format character to Pascal case

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [ContainsNumber(INPUT:character):LOGICAL](#containsnumber)
- [IsEmpty(INPUT:character):LOGICAL](#isempty)
- [IsNotEmpty(INPUT:character):LOGICAL](#isnotempty)
- [IsNotNullOrEmpty(INPUT:character):LOGICAL](#isnotnullorempty)
- [IsNullOrEmpty(INPUT:character):LOGICAL](#isnullorempty)
- [Quote(INPUT:character):CHARACTER](#quote)
- [SetTokenValueInString(INPUT:character,INPUT:character,INPUT:integer):CHARACTER](#settokenvalueinstring)
- [StartWithLowercase(INPUT:character):CHARACTER](#startwithlowercase)
- [StringToPascalCase(INPUT:character,INPUT:character):CHARACTER](#stringtopascalcase)

---

<a id="containsnumber"></a>
#### ContainsNumber
- **Signature**: ContainsNumber(INPUT:character):LOGICAL
- **Purpose**: Check if string contains a number
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to check

---

<a id="isempty"></a>
#### IsEmpty
- **Signature**: IsEmpty(INPUT:character):LOGICAL
- **Purpose**: Check if string is empty
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to check

---

<a id="isnotempty"></a>
#### IsNotEmpty
- **Signature**: IsNotEmpty(INPUT:character):LOGICAL
- **Purpose**: Check if string is not empty
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to check

---

<a id="isnotnullorempty"></a>
#### IsNotNullOrEmpty
- **Signature**: IsNotNullOrEmpty(INPUT:character):LOGICAL
- **Purpose**: Check if string is not null nor empty
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to check

---

<a id="isnullorempty"></a>
#### IsNullOrEmpty
- **Signature**: IsNullOrEmpty(INPUT:character):LOGICAL
- **Purpose**: Check if string is null or empty
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to check

---

<a id="quote"></a>
#### Quote
- **Signature**: Quote(INPUT:character):CHARACTER
- **Purpose**: Add quotes to a string
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to modify.

---

<a id="settokenvalueinstring"></a>
#### SetTokenValueInString
- **Signature**: SetTokenValueInString(INPUT:character,INPUT:character,INPUT:integer):CHARACTER
- **Purpose**: Sets the token value in a token string
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to modify
  - ipcTokenValue: CHARACTER as character, the token value to set
  - ipiPosition: INTEGER as integer, the position of the token to modify

---

<a id="startwithlowercase"></a>
#### StartWithLowercase
- **Signature**: StartWithLowercase(INPUT:character):CHARACTER
- **Purpose**: Lowercase the first letter of a string
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to modify

---

<a id="stringtopascalcase"></a>
#### StringToPascalCase
- **Signature**: StringToPascalCase(INPUT:character,INPUT:character):CHARACTER
- **Purpose**: Format character to Pascal case
- **Return type**: CHARACTER character
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcString: CHARACTER as character, the string to modify
  - ipcSeparator: CHARACTER as character, the string separator

---


## ValidatorUtil

**Package:** Utils: ValidatorUtil CLASS

### Purpose
Validates if a URL is in a standard format

### Author(s)
Notes

### Created
Progress.Lang.Object

### Super Class
`Progress.Lang.Object`

---

### Methods

#### Summary of Available Methods

- [CalculateLuhnChecksum(INPUT:character):LOGICAL](#calculateluhnchecksum)
- [ValidateCreditCardNumber(INPUT:character):LOGICAL](#validatecreditcardnumber)
- [ValidateEmailAddress(INPUT:character):LOGICAL](#validateemailaddress)
- [ValidateIPv4Address(INPUT:character):LOGICAL](#validateipv4address)
- [ValidateIPv6AddressUnixLibrary(INPUT:character):LOGICAL](#validateipv6addressunixlibrary)
- [ValidatePhoneNumberUnixLibrary(INPUT:character):LOGICAL](#validatephonenumberunixlibrary)
- [ValidateURLUnixLibrary(INPUT:character):LOGICAL](#validateurlunixlibrary)

---

<a id="calculateluhnchecksum"></a>
#### CalculateLuhnChecksum
- **Signature**: CalculateLuhnChecksum(INPUT:character):LOGICAL
- **Purpose**: Calculates if a credit card number is valid based on the Luhn algorithm
- **Return type**: LOGICAL logical
- **Modifiers**: PRIVATE STATIC
- **Parameters**:
  - ipcCardNumber: CHARACTER as character, the credit card number to validate

---

<a id="validatecreditcardnumber"></a>
#### ValidateCreditCardNumber
- **Signature**: ValidateCreditCardNumber(INPUT:character):LOGICAL
- **Purpose**: Validates a credit card number using the Luhn algorithm
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcCardNumber: CHARACTER as character, the credit card number to validate

---

<a id="validateemailaddress"></a>
#### ValidateEmailAddress
- **Signature**: ValidateEmailAddress(INPUT:character):LOGICAL
- **Purpose**: Validates if an email address is in a standard format
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcEmail: CHARACTER as character, the email address to validate

---

<a id="validateipv4address"></a>
#### ValidateIPv4Address
- **Signature**: ValidateIPv4Address(INPUT:character):LOGICAL
- **Purpose**: Validates if an IP address is in a valid IPv4 format
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcIPAddress: CHARACTER as character, the IP address to validate

---

<a id="validateipv6addressunixlibrary"></a>
#### ValidateIPv6AddressUnixLibrary
- **Signature**: ValidateIPv6AddressUnixLibrary(INPUT:character):LOGICAL
- **Purpose**: Validates if an IP address is in a valid IPv6 format
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcIPAddress: CHARACTER as character, the IPv6 address to validate

---

<a id="validatephonenumberunixlibrary"></a>
#### ValidatePhoneNumberUnixLibrary
- **Signature**: ValidatePhoneNumberUnixLibrary(INPUT:character):LOGICAL
- **Purpose**: Validates if a phone number is in a standard format
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcPhoneNumber: CHARACTER as character, the phone number to validate

---

<a id="validateurlunixlibrary"></a>
#### ValidateURLUnixLibrary
- **Signature**: ValidateURLUnixLibrary(INPUT:character):LOGICAL
- **Purpose**: Validates if a URL is in a standard format
- **Return type**: LOGICAL logical
- **Modifiers**: PUBLIC STATIC
- **Parameters**:
  - ipcURL: CHARACTER as character, the URL to validate

---

