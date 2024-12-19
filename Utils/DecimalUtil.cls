/*------------------------------------------------------------------------
   File        : DecimalUtil
   Purpose     : Main helper class to handle Decimal operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Thu Oct 17 12:29:43 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.DecimalUtil: 
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is zero
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @return logical, true if it is zero and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsZero( input ipdeDecimal as decimal ):
        
        return ipdeDecimal = 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is different from zero
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @return logical, true if it is not zero and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotZero( input ipdeDecimal as decimal ):
        
        return ipdeDecimal <> 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is null
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @return logical, true if it is null and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNull( input ipdeDecimal as decimal ):
        
        return ipdeDecimal = ?.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is different from null
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @return logical, true if it is not null and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNull( input ipdeDecimal as decimal ):
        
        return ipdeDecimal <> ?.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is null or zero
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @return logical, true if it is null or zero and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNullOrZero( input ipdeDecimal as decimal ):
        
        return ipdeDecimal = ? or ipdeDecimal = 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is different from null and zero
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @return logical, true if it is not null or zero and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNullOrZero( input ipdeDecimal as decimal ):
        
        return ipdeDecimal <> ? and ipdeDecimal <> 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Round a decimal to an integer value
        Notes:
        @param ipdeDecimal as decimal, the decimal to round
        @return integer, the rounded value
    ------------------------------------------------------------------------------*/
    method public static integer RoundDecimal( input ipdeDecimal as decimal ):
        
        return integer(round(ipdeDecimal, 0)).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is positive
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @return logical, true if it is positive and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsPositive( input ipdeDecimal as decimal ):
        
        return ipdeDecimal >= 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is negative
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @return logical, true if it is negative and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNegative( input ipdeDecimal as decimal ):
        
        return ipdeDecimal < 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given decimal is in a specified range
        Notes:
        @param ipdeDecimal as decimal, the decimal to check
        @param ipdeMin as decimal, the lower bound of the range
        @param ipdeMax as decimal, the upper bound of the range
        @return logical, true if it is in the range and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical InRange( input ipdeDecimal as decimal, 
                                          input ipdeMin     as decimal, 
                                          input ipdeMax     as decimal ):
        
        return ipdeDecimal >= ipdeMin and ipdeDecimal <= ipdeMax.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Return the absolute value of a given decimal
        Notes:
        @param ipdeDecimal as decimal, the decimal to convert
        @return decimal, the absolute value
    ------------------------------------------------------------------------------*/
    method public static decimal Abs( input ipdeDecimal as decimal ):
        
        if ipdeDecimal < 0 then
            return ipdeDecimal * -1.
        else
            return ipdeDecimal.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Convert a given decimal to string
        Notes:
        @param ipdeDecimal as decimal, the decimal to convert
        @return character, the string value of the decimal
    ------------------------------------------------------------------------------*/
    method public static character ToString( input ipdeDecimal as decimal ):
        
        return string(ipdeDecimal).
        
    end method.
    
end class.
