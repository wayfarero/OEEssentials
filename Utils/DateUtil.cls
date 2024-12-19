/*------------------------------------------------------------------------
   File        : DateUtil
   Purpose     : Main helper class to handle Date operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Fri Oct 18 13:54:46 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.DateUtil: 

    /*------------------------------------------------------------------------------
        Purpose: Return the week number of a given date
        Notes:
        @param ipdDate as date, the date to get the week number for
        @return integer, the week number
    ------------------------------------------------------------------------------*/
    method public static integer GetISOWeekNumber( input ipdDate as date ):
        define variable iWeeksInYear      as integer no-undo initial 52.
        define variable iWeekNumber       as integer no-undo.
        define variable dStartOfFirstWeek as date    no-undo.
        define variable dStartOfWeek      as date    no-undo.
        define variable iFirstDayWeekday  as integer no-undo.
 
        if ipdDate = ? then
            ipdDate = today.
            
        if GetISOWeekday(date(12, 31, year(ipdDate))) = 4 or GetISOWeekday(date(12, 31, year(ipdDate) - 1)) = 3 then
            iWeeksInYear = iWeeksInYear + 1.
        
        assign 
            dStartOfFirstWeek = date(1, 1, year(ipdDate))
            iFirstDayWeekday  = GetISOWeekday(dStartOfFirstWeek).

        if iFirstDayWeekday <= 4 then
            dStartOfFirstWeek = dStartOfFirstWeek - (iFirstDayWeekday - 1).
        else
            dStartOfFirstWeek = dStartOfFirstWeek + (8 - iFirstDayWeekday).
        
        assign     
            dStartOfWeek = ipdDate - GetISOWeekday(ipdDate) + 1
            iWeekNumber  = integer ((dStartOfWeek - dStartOfFirstWeek) / 7) + 1.
            
        if iWeekNumber = 0 then 
            iWeekNumber = GetISOWeekNumber(date(12, 31, year(ipdDate) - 1)).
        else 
            if iWeeksInYear < iWeekNumber then 
                iWeekNumber = 1.
        
        return iWeekNumber .
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Return the ISO weekday of a given date
        Notes:
        @param ipdDate as date, the date to get the weekday for
        @return integer, the ISO weekday
    ------------------------------------------------------------------------------*/
    method public static integer GetISOWeekday( input ipdDate as date ):
        define variable iWeekday as integer no-undo.
        
        if ipdDate = ? then
            ipdDate = today.
            
        iWeekday = weekday(ipdDate) - 1.
        
        if iWeekday = 0 then iWeekday = 7.
        
        return iWeekday.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Return the first day of the month of a given date
        Notes:
        @param ipdDate as date, the date to get the first day of the month for
        @return date, the first day of the month
    ------------------------------------------------------------------------------*/
    method public static date GetFirstDayOfMonth( input ipdDate as date ):
         
        if ipdDate = ? then
            ipdDate = today.
            
        return date(month(ipdDate), 1, year(ipdDate)).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Return the last day of the month of a given date
        Notes:
        @param ipdDate as date, the date to get the last day of the month for
        @return date, the last day of the month
    ------------------------------------------------------------------------------*/
    method public static date GetLastDayOfMonth( input ipdDate as date ):
         
        if ipdDate = ? then
            ipdDate = today.
            
        return date(month(ipdDate), NumDaysInMonth(month(ipdDate), year(ipdDate)), year(ipdDate)).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Return the first day of the year of a given date
        Notes:
        @param ipdDate as date, the date to get the first day of the year for
        @return date, the first day of the year
    ------------------------------------------------------------------------------*/
    method public static date GetFirstDayOfYear( input ipdDate as date ):
         
        if ipdDate = ? then
            ipdDate = today.
            
        return date(1, 1, year(ipdDate)).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Return the last day of the year of a given date
        Notes:
        @param ipdDate as date, the date to get the last day of the year for
        @return date, the last day of the year
    ------------------------------------------------------------------------------*/
    method public static date GetLastDayOfYear( input ipdDate as date ):
         
        if ipdDate = ? then
            ipdDate = today.
            
        return date(12, 31, year(ipdDate)).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Return the first day of the year of a given year
        Notes:
        @param ipiYear as integer, the year to get the first day of
        @return date, the first day of the year
    ------------------------------------------------------------------------------*/
    method public static date GetFirstDayOfYearByYear( input ipiYear as integer ):
         
        return date(1, 1, ipiYear).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Return the last day of the year of a given year
        Notes:
        @param ipiYear as integer, the year to get the last day of
        @return date, the last day of the year
    ------------------------------------------------------------------------------*/
    method public static date GetLastDayOfYearByYear( input ipiYear as integer ):
         
        return date(12, 31, ipiYear).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Return the number of days in a given month and year
        Notes:
        @param ipiMonth as integer, the month
        @param ipiYear as integer, the year
        @return integer, the number of days
    ------------------------------------------------------------------------------*/
    method public static integer NumDaysInMonth( input ipiMonth as integer, 
                                                 input ipiYear as integer ):
        define variable iDays as integer no-undo.

        case ipiMonth:
            when 1 then 
                iDays = 31. 
            when 2 then 
                do: 
                    if (ipiYear mod 4 = 0 and ipiYear mod 100 <> 0) or (ipiYear mod 400 = 0) then
                        iDays = 29.
                    else
                        iDays = 28.
                end.
            when 3 then 
                iDays = 31.
            when 4 then 
                iDays = 30.
            when 5 then 
                iDays = 31.
            when 6 then 
                iDays = 30.
            when 7 then 
                iDays = 31.
            when 8 then 
                iDays = 31.
            when 9 then 
                iDays = 30.
            when 10 then 
                iDays = 31.
            when 11 then 
                iDays = 30.
            when 12 then 
                iDays = 31.
            otherwise 
            iDays = 0. 
        end case.

        return iDays.

    end method.
    
end class.
