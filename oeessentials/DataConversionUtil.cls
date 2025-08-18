/*------------------------------------------------------------------------
   File        : DataConversionUtil
   Purpose     : Main helper class to handle data conversion operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Mon Oct 18 11:55:04 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class oeessentials.DataConversionUtil: 
    
    /*------------------------------------------------------------------------------
        Purpose: Converts a DATETIME to its string representation
        Notes:
        @param ipdtDateTime as datetime, the datetime to be converted
        @return character, string representation of the DATETIME
    ------------------------------------------------------------------------------*/
    method public static character DateTimeToString( input ipdtDateTime as datetime ):
        
        return string(ipdtDateTime).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a DATETIMETZ to its string representation
        Notes:
        @param ipdtzDateTimeTz as datetime-tz, the datetime with timezone to be converted
        @return character, string representation of the DATETIMETZ
    ------------------------------------------------------------------------------*/
    method public static character DateTimeTzToString( input ipdtzDateTimeTz as datetime-tz ):
        
        return string(ipdtzDateTimeTz).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a date to ISO 8601 format (YYYY-MM-DD)
        Notes:
        @param ipdDate as date, the date to be converted
        @return character, ISO formatted date string (YYYY-MM-DD)
    ------------------------------------------------------------------------------*/
    method public static character DateToISOString( input ipdDate as date ):
        
        return string(year(ipdDate), "9999") + "-" + 
               string(month(ipdDate), "99")  + "-" + 
               string(day(ipdDate), "99").
            
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a DATE to its string representation
        Notes:
        @param ipdDate as date, the date to be converted
        @return character, string representation of the DATE
    ------------------------------------------------------------------------------*/
    method public static character DateToString( input ipdDate as date ):
        
        return string(ipdDate).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a DECIMAL to its string representation
        Notes:
        @param ipdeValue as decimal, the decimal to be converted
        @return character, string representation of the decimal
    ------------------------------------------------------------------------------*/
    method public static character DecimalToString( input ipdeValue as decimal ):
        
        return string(ipdeValue).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Formats a date to a specified format
        Notes:
        @param ipdDate as date, the date to be formatted
        @param ipcFormat as character, the date format (e.g., 'YYYY-MM-DD')
        @return character, formatted date string
    ------------------------------------------------------------------------------*/
    method public static character FormatDate( input ipdDate   as date, 
                                               input ipcFormat as character ):

        return FormatInputDate(ipcFormat, year(ipdDate), month(ipdDate), day(ipdDate), ?, ?, ?, ?).
    
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Dynamically formats a datetime based on the format string passed (e.g., 'YYYY-MM-DD HH:MM:SS')
        Notes:
        @param ipdtDateTime as datetime, the datetime to be formatted
        @param ipcFormat as character, the format for the datetime (e.g., 'YYYY-MM-DD HH:MM:SS')
        @return character, formatted datetime string
    ------------------------------------------------------------------------------*/
    method public static character FormatDateTime( input ipdtDateTime as datetime, 
                                                   input ipcFormat    as character ):
        define variable iTime   as integer no-undo.
        define variable iHour   as integer no-undo.
        define variable iMinute as integer no-undo.
        define variable iSecond as integer no-undo.
        
        assign
            iTime   = mtime(ipdtDateTime)
            iHour   = truncate(iTime / (1000 * 60 * 60), 0) mod 24
            iMinute = truncate((iTime mod (1000 * 60 * 60)) / (1000 * 60), 0)
            iSecond = truncate((iTime mod (1000 * 60)) / 1000, 0).

        return FormatInputDate(ipcFormat, year(ipdtDateTime), month(ipdtDateTime), day(ipdtDateTime), iHour, iMinute, iSecond, ?).
    
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Dynamically formats a datetime with timezone based on the format string passed (e.g., 'YYYY-MM-DDTHH:MI:SS±TZ')
        Notes:
        @param ipdtzDateTimeTz as datetime-tz, the datetime with timezone to be formatted
        @param ipcFormat as character, the format for the datetime (e.g., 'YYYY-MM-DDTHH:MI:SS±TZ')
        @return character, formatted datetime string
    ------------------------------------------------------------------------------*/
    method public static character FormatDateTimeTz( input ipdtzDateTimeTz as datetime-tz, 
                                                     input ipcFormat       as character ):
        define variable iTime   as integer   no-undo.
        define variable iHour   as integer   no-undo.
        define variable iMinute as integer   no-undo.
        define variable iSecond as integer   no-undo.
        define variable cTZ     as character no-undo.
        
        assign
            iTime   = mtime(ipdtzDateTimeTz)
            iHour   = truncate(iTime / (1000 * 60 * 60), 0) mod 24
            iMinute = truncate((iTime mod (1000 * 60 * 60)) / (1000 * 60), 0)
            iSecond = truncate((iTime mod (1000 * 60)) / 1000, 0)
            cTZ = string(timezone(ipdtzDateTimeTz) / 60, "-99") + ":" + string(abs(timezone(ipdtzDateTimeTz)) mod 60, "99").

        return FormatInputDate(ipcFormat, year(ipdtzDateTimeTz), month(ipdtzDateTimeTz), day(ipdtzDateTimeTz), iHour, iMinute, iSecond, cTZ).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Formats a date and time (including timezone if applicable) based on the input format string and components provided
        Notes:
        @param ipcFormat as character, the format for the date and time (e.g., 'YYYY-MM-DD HH:MI:SS')
        @param ipiYear as integer, the year component of the date
        @param ipiMonth as integer, the month component of the date
        @param ipiDay as integer, the day component of the date
        @param ipiHour as integer, the hour component of the time (optional, pass ? if not used)
        @param ipiMinute as integer, the minute component of the time (optional, pass ? if not used)
        @param ipiSecond as integer, the second component of the time (optional, pass ? if not used)
        @param ipcTZ as character, the timezone string (optional, pass ? if not used)
        @return character, formatted date and time string based on the provided format
    ------------------------------------------------------------------------------*/
    method public static character FormatInputDate( input ipcFormat as character, 
                                                    input ipiYear   as integer,
                                                    input ipiMonth  as integer, 
                                                    input ipiDay    as integer,
                                                    input ipiHour   as integer, 
                                                    input ipiMinute as integer, 
                                                    input ipiSecond as integer, 
                                                    input ipcTZ     as character ):
        define variable cResult as character no-undo.
        
        assign
            cResult = ipcFormat
            cResult = replace(cResult, "YYYY", string(ipiYear, "9999"))
            cResult = replace(cResult, "MM", string(ipiMonth, "99"))
            cResult = replace(cResult, "DD", string(ipiDay, "99")).

        if ipiHour <> ? then 
            cResult   = replace(cResult, "HH", string(ipiHour, "99")).
            
        if ipiMinute <> ? then 
            cResult = replace(cResult, "MI", string(ipiMinute, "99")).
            
        if ipiSecond <> ? then 
            cResult = replace(cResult, "SS", string(ipiSecond, "99")).

        if ipcTZ <> ? then 
            cResult = replace(cResult, "TZ", ipcTZ).

        return cResult.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts an INT64 to its string representation
        Notes:
        @param ipi64Value as int64, the INT64 to be converted
        @return character, string representation of the INT64
    ------------------------------------------------------------------------------*/
    method public static character Int64ToString( input ipi64Value as int64 ):
        
        return string(ipi64Value).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts an INTEGER to its string representation
        Notes:
        @param ipiValue as integer, the integer to be converted
        @return character, string representation of the integer
    ------------------------------------------------------------------------------*/
    method public static character IntegerToString( input ipiValue as integer ):
        
        return string(ipiValue).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a LOGICAL to its string representation (either "TRUE"/"FALSE" or "1"/"0")
        Notes:
        @param iplValue as logical, the logical to be converted
        @param iplUseNumeric as logical, indicating whether to return "1"/"0" or "TRUE"/"FALSE"
        @return character, string representation of the logical ("TRUE"/"FALSE" or "1"/"0")
    ------------------------------------------------------------------------------*/
    method public static character LogicalToString( input iplValue      as logical, 
                                                    input iplUseNumeric as logical ):
    
        return if iplUseNumeric then (if iplValue then "1" else "0") 
               else (if iplValue then "TRUE" else "FALSE").
    
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a string to a date
        Notes:
        @param ipcDateString as character, the string representation of the date
        @return date, date object
    ------------------------------------------------------------------------------*/
    method public static date StringToDate( input ipcDateString as character ):
        
        return date(ipcDateString).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a string to a DATETIME
        Notes:
        @param ipcValue as character, the string representation of the datetime
        @return datetime, datetime value
    ------------------------------------------------------------------------------*/
    method public static datetime StringToDateTime( input ipcValue as character ):
        
        return datetime(ipcValue).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a string to a DATETIMETZ
        Notes:
        @param ipcValue as character, the string representation of the datetime with timezone
        @return datetime-tz, DATETIMETZ value
    ------------------------------------------------------------------------------*/
    method public static datetime-tz StringToDateTimeTz( input ipcValue as character ):
        
        return datetime-tz(ipcValue).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a string to a DECIMAL
        Notes:
        @param ipcValue as character, the string representation of the decimal
        @return decimal, decimal value
    ------------------------------------------------------------------------------*/
    method public static decimal StringToDecimal( input ipcValue as character ):
        
        return decimal(ipcValue).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a string to an INT64
        Notes:
        @param ipcValue as character, the string representation of the INT64
        @return int64, INT64 value
    ------------------------------------------------------------------------------*/
    method public static int64 StringToInt64( input ipcValue as character ):
        
        return int64(ipcValue).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a string to an INTEGER
        Notes:
        @param ipcValue as character, the string representation of the integer
        @return integer, integer value
    ------------------------------------------------------------------------------*/
    method public static integer StringToInteger( input ipcValue as character ):
        
        return integer(ipcValue).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a string to a LOGICAL
        Notes:
        @param ipcValue as character, the string representation of the logical (e.g., "TRUE", "FALSE", "1", "0")
        @return logical, logical value (true or false)
    ------------------------------------------------------------------------------*/
    method public static logical StringToLogical( input ipcValue as character ):
        define variable lResult as logical   no-undo.
        define variable cValue  as character no-undo.

        cValue = caps(ipcValue).

        case cValue:
            when "TRUE" then
                lResult = true.
            when "1" then
                lResult = true.
            when "FALSE" then
                lResult = false.
            when "0" then
                lResult = false.
        end case.

        return lResult.

    end method.
    
end class.
