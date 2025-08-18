/*------------------------------------------------------------------------
   File        : MathUtil
   Purpose     : Main helper class to handle math operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Fri Oct 25 10:38:16 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

&IF OPSYS = "WIN32" &THEN
using System.*.
&ENDIF

class oeessentials.MathUtil: 

    /*------------------------------------------------------------------------------
        Purpose: Calculate the age in years based on a birthdate
        Notes:
        @param ipdBirthDate as date, the date of birth
        @return integer, the calculated age in years
    ------------------------------------------------------------------------------*/
    method public static integer CalculateAge( input ipdBirthDate as date ):

        return integer(interval(now, ipdBirthDate, "years")).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate the age in years, months, and days based on a birthdate
        Notes:
        @param ipdBirthDate as date, the date of birth
        @return character, a string with the detailed age in "X years, Y months, Z days" format
    ------------------------------------------------------------------------------*/
    method public static character CalculateDetailedAge( input ipdBirthDate as date ):
        define variable dCurrentDate as date    no-undo.
        define variable iYears       as integer no-undo.
        define variable iMonths      as integer no-undo.
        define variable iDays        as integer no-undo.
        
        assign 
            dCurrentDate = today
            iYears       = year(dCurrentDate) - year(ipdBirthDate).

        if month(ipdBirthDate) > month(dCurrentDate) or (month(ipdBirthDate) = month(dCurrentDate) and day(ipdBirthDate) > day(dCurrentDate)) then
            assign
                iYears  = iYears - 1
                iMonths = 12 - (month(ipdBirthDate) - month(dCurrentDate)).
        else
            iMonths = month(dCurrentDate) - month(ipdBirthDate).

        if day(dCurrentDate) >= day(ipdBirthDate) then
            iDays = day(dCurrentDate) - day(ipdBirthDate).
        else
            iDays = (day(dCurrentDate) + (30 - day(ipdBirthDate))).

        return string(iYears) + " years, " + string(iMonths) + " months, " + string(iDays) + " days".

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate age in years at a specific date
        Notes:
        @param ipdBirthDate as date, the date of birth
        @param dAtDate as date, the reference date to calculate the age at
        @return integer, the calculated age at the specified date
    ------------------------------------------------------------------------------*/
    method public static integer CalculateAgeAtDate( input ipdBirthDate as date, 
                                                     input dAtDate      as date ):
        define variable iAge as integer no-undo.

        iAge = year(dAtDate) - year(ipdBirthDate).

        if month(ipdBirthDate) > month(dAtDate) or (month(ipdBirthDate) = month(dAtDate) and day(ipdBirthDate) > day(dAtDate)) then
            iAge = iAge - 1.

        return iAge.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate the number of days until the next birthday from today
        Notes:
        @param ipdBirthDate as date, the date of birth
        @return integer, the number of days until the next birthday
    ------------------------------------------------------------------------------*/
    method public static integer TimeUntilBirthday( input ipdBirthDate as date ):
        define variable dCurrentDate  as date no-undo.
        define variable dNextBirthday as date no-undo.
        
        assign 
            dCurrentDate  = today
            dNextBirthday = date(month(ipdBirthDate), day(ipdBirthDate), year(dCurrentDate)).

        if dNextBirthday = dCurrentDate then
            return 0.

        if dNextBirthday < dCurrentDate then
            dNextBirthday = date(month(ipdBirthDate), day(ipdBirthDate), year(dCurrentDate) + 1).

        return dNextBirthday - dCurrentDate.

    end method.

&IF OPSYS = "WIN32" &THEN
    
    /*------------------------------------------------------------------------------
        Purpose: Calculate the sine of an angle in degrees
        Notes: Uses the 'Sin' method of System.Math
        @param ipdeDegrees as decimal, the angle in degrees
        @return decimal, the sine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal SinDegrees( input ipdeDegrees as decimal ):
        define variable ipdeRadians as decimal no-undo.
        define variable deResult    as decimal no-undo.
        define variable dePI        as decimal no-undo initial 3.1415926535897931.
        
        assign 
            ipdeRadians = ipdeDegrees * dePI / 180
            deResult    = Math:Sin(ipdeRadians).
        
        return deResult.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Calculate the sine of an angle in radians
        Notes: Uses the 'Sin' method of System.Math
        @param ipdeRadians as decimal, the angle in radians
        @return decimal, the sine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal SinRadians( input ipdeRadians as decimal ):
        define variable deResult as decimal no-undo.
        
        deResult = Math:Sin(ipdeRadians).
        
        return deResult.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Calculate the cosine of an angle in degrees
        Notes: Uses the 'Cos' method of System.Math
        @param ipdeDegrees as decimal, the angle in degrees
        @return decimal, the cosine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal CosDegrees( input ipdeDegrees as decimal ):
        define variable ipdeRadians as decimal no-undo.
        define variable deResult    as decimal no-undo.
        define variable dePI        as decimal no-undo initial 3.1415926535897931.

        assign 
            ipdeRadians = ipdeDegrees * dePI / 180
            deResult    = Math:Cos(ipdeRadians).

        return deResult.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate the cosine of an angle in radians
        Notes: Uses the 'Cos' method of System.Math
        @param ipdeRadians as decimal, the angle in radians
        @return decimal, the cosine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal CosRadians( input ipdeRadians as decimal ):
        define variable deResult as decimal no-undo.

        deResult = Math:Cos(ipdeRadians).

        return deResult.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate the tangent of an angle in degrees
        Notes: Uses the 'Tan' method of System.Math
        @param ipdeDegrees as decimal, the angle in degrees
        @return decimal, the tangent of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal TanDegrees( input ipdeDegrees as decimal ):
        define variable ipdeRadians as decimal no-undo.
        define variable deResult    as decimal no-undo.
        define variable dePI        as decimal no-undo initial 3.1415926535897931.

        assign 
            ipdeRadians = ipdeDegrees * dePI / 180
            deResult    = Math:Tan(ipdeRadians).

        return deResult.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate the tangent of an angle in radians
        Notes: Uses the 'Tan' method of System.Math
        @param ipdeRadians as decimal, the angle in radians
        @return decimal, the tangent of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal TanRadians( input ipdeRadians as decimal ):
        define variable deResult as decimal no-undo.

        deResult = Math:Tan(ipdeRadians).

        return deResult.
        
    end method.
&ELSE  
     /*------------------------------------------------------------------------------
        Purpose: Calculate the sine of an angle in degrees
        Notes:
        @param ipdeDegrees as decimal, the angle in degrees
        @return decimal, the sine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal SinDegrees( input ipdeDegrees as decimal ):
        define variable ipdeRadians as decimal no-undo.
        define variable deResult    as decimal no-undo.
        define variable dePI        as decimal no-undo initial 3.1415926535897931.
        
        assign 
            ipdeRadians = ipdeDegrees * dePI / 180
            deResult    = CalculateSin(ipdeRadians).
        
        return deResult.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Calculate the sine of an angle in radians
        Notes:
        @param ipdeRadians as decimal, the angle in radians
        @return decimal, the sine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal SinRadians( input ipdeRadians as decimal ):
        define variable deResult as decimal no-undo.
        
        deResult = CalculateSin(ipdeRadians).
        
        return deResult.

    end method.
    
     /*------------------------------------------------------------------------------
        Purpose: Calculate the cosine of an angle in degrees
        Notes:
        @param ipdeDegrees as decimal, the angle in degrees
        @return decimal, the cosine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal CosDegrees( input ipdeDegrees as decimal ):
        define variable ipdeRadians as decimal no-undo.
        define variable deResult    as decimal no-undo.
        define variable dePI        as decimal no-undo initial 3.1415926535897931.

        assign 
            ipdeRadians = ipdeDegrees * dePI / 180
            deResult    = CalculateCos(ipdeRadians).

        return deResult.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate the cosine of an angle in radians
        Notes:
        @param ipdeRadians as decimal, the angle in radians
        @return decimal, the cosine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal CosRadians( input ipdeRadians as decimal ):
        define variable deResult as decimal no-undo.

        deResult = CalculateCos(ipdeRadians).

        return deResult.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate the tangent of an angle in degrees
        Notes:
        @param ipdeDegrees as decimal, the angle in degrees
        @return decimal, the tangent of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal TanDegrees( input ipdeDegrees as decimal ):
        define variable ipdeRadians as decimal no-undo.
        define variable deResult    as decimal no-undo.
        define variable dePI        as decimal no-undo initial 3.1415926535897931.

        assign 
            ipdeRadians = ipdeDegrees * dePI / 180
            deResult    = CalculateTan(ipdeRadians).

        return deResult.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Calculate the tangent of an angle in radians
        Notes:
        @param ipdeRadians as decimal, the angle in radians
        @return decimal, the tangent of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal TanRadians( input ipdeRadians as decimal ):
        define variable deResult  as decimal no-undo.

        deResult = CalculateTan(ipdeRadians).

        return deResult.
        
    end method.
&ENDIF

    /*------------------------------------------------------------------------------
        Purpose: Define the external procedure for the sin function
        Notes: Uses the /lib/x86_64-linux-gnu/libm.so.6
        @param ipdblValue as double, the input angle in radians
        @return double, the sine of the angle
    ------------------------------------------------------------------------------*/
    procedure sin external "/lib/x86_64-linux-gnu/libm.so.6" cdecl:
        define input parameter ipdblValue as DOUBLE no-undo.
        define return parameter ipdblResult as DOUBLE no-undo.
    end procedure.

    /*------------------------------------------------------------------------------
        Purpose: Define the external procedure for the cos function
        Notes: Uses the /lib/x86_64-linux-gnu/libm.so.6
        @param ipdblValue as double, the input angle in radians
        @return double, the cosine of the angle
    ------------------------------------------------------------------------------*/
    procedure cos external "/lib/x86_64-linux-gnu/libm.so.6" cdecl:
        define input parameter ipdblValue as DOUBLE no-undo.
        define return parameter ipdblResult as DOUBLE no-undo.
    end procedure.
    
    /*------------------------------------------------------------------------------
        Purpose: Define the external procedure for the tan function
        Notes: Uses the /lib/x86_64-linux-gnu/libm.so.6
        @param ipdblValue as double, the input angle in radians
        @return double, the tangent of the angle
    ------------------------------------------------------------------------------*/
    procedure tan external "/lib/x86_64-linux-gnu/libm.so.6" cdecl:
        define input parameter ipdblValue as DOUBLE no-undo.
        define return parameter ipdblResult as DOUBLE no-undo.
    end procedure.
 
    /*------------------------------------------------------------------------------
        Purpose: Calculate the sine using libm.so.6:sin
        Notes:
        @param ipdeAngle as decimal, the angle in radians
        @return decimal, the sine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal CalculateSin( input ipdeAngle as decimal ):
        define variable deResult as decimal no-undo.
        
        run sin(input ipdeAngle, output deResult).
        return deResult.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Calculate the cosine using libm.so.6:cos
        Notes:
        @param ipdeAngle as decimal, the angle in radians
        @return decimal, the cosine of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal CalculateCos( input ipdeAngle as decimal ):
        define variable deResult as decimal no-undo.
        
        run cos(input ipdeAngle, output deResult).
        return deResult.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Calculate the tangent using libm.so.6:tan
        Notes:
        @param ipdeAngle as decimal, the angle in radians
        @return decimal, the tangent of the angle
    ------------------------------------------------------------------------------*/
    method public static decimal CalculateTan(input ipdeAngle as decimal):
        define variable deResult as decimal no-undo.
        
        run tan(input ipdeAngle, output deResult).
        return deResult.
        
    end method.    
    
    /*------------------------------------------------------------------------------
        Purpose: Rounds a decimal value to the nearest whole number
        Notes:
        @param ipdeValue as decimal, the value to round
        @return decimal, the rounded value
    ------------------------------------------------------------------------------*/
    method public static decimal RoundToWhole( input ipdeValue as decimal ):

        return round(ipdeValue, 0).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Rounds a decimal value to a specified number of decimal places
        Notes:
        @param ipdeValue as decimal, the value to round
        @param ipiDecimals as integer, the number of decimal places
        @return decimal, the rounded value
    ------------------------------------------------------------------------------*/
    method public static decimal RoundToDecimalPlaces( input ipdeValue   as decimal, 
                                                       input ipiDecimals as integer ):

        return round(ipdeValue, ipiDecimals).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Rounds a decimal value up to the nearest whole number (ceiling)
        Notes: Uses truncate and checks for fractional values to round up
        @param ipdeValue as decimal, the value to round up
        @return decimal, the rounded-up value
    ------------------------------------------------------------------------------*/
    method public static decimal RoundUp( input ipdeValue as decimal ):
        define variable deTruncated as decimal no-undo.

        deTruncated = truncate(ipdeValue, 0).

        if ipdeValue > deTruncated then
            return deTruncated + 1.
        else
            return deTruncated.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Rounds a decimal value down to the nearest whole number (floor)
        Notes: Uses truncate to achieve floor behavior for positive numbers, and adjusts for negative values
        @param ipdeValue as decimal, the value to round down
        @return decimal, the rounded-down value
    ------------------------------------------------------------------------------*/
    method public static decimal RoundDown( input ipdeValue as decimal ):
        define variable deTruncated as decimal no-undo.

        deTruncated = truncate(ipdeValue, 0).

        if ipdeValue < 0 and ipdeValue <> deTruncated then
            return deTruncated - 1.
        else
            return deTruncated.
    end method.

end class.
