/*------------------------------------------------------------------------
   File        : IntegerUtil
   Purpose     : Main helper class to handle Integer operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Thu Oct 17 10:21:37 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class oeessentials.IntegerUtil:
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the absolute value of a given integer
        Notes:
        @param ipiInteger as integer, the integer to check
        @return integer, the absolute value of the integer
    ------------------------------------------------------------------------------*/
    method public static integer Abs( input ipiInteger as integer ):
        define variable iResult as integer no-undo.

        if ipiInteger < 0 then
            iResult = ipiInteger * -1.
        else
            iResult = ipiInteger.

        return iResult.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is within a specified range (inclusive)
        Notes:
        @param ipiInteger as integer, the integer to check
        @param ipiMin as integer, the lower bound of the range
        @param ipiMax as integer, the upper bound of the range
        @return logical, true if the integer is within the range, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical InRange( input ipiInteger as integer, 
                                          input ipiMin     as integer, 
                                          input ipiMax     as integer ):
        
        return ipiInteger >= ipiMin and ipiInteger <= ipiMax.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is even
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is even, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsEven( input ipiInteger as integer ):
        
        return ipiInteger mod 2 = 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is negative
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is negative, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNegative( input ipiInteger as integer ):
        
        return ipiInteger < 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is not null
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is not null, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNull( input ipiInteger as integer ):
        
        return ipiInteger <> ?.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is not null or zero
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is not null or zero, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNullOrZero( input ipiInteger as integer ):
        
        return ipiInteger <> ? and ipiInteger <> 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is not zero
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is not zero, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotZero( input ipiInteger as integer ):
        
        return ipiInteger <> 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is null
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is null, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNull( input ipiInteger as integer ):
        
        return ipiInteger = ?.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is either null or zero
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is either null or zero, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNullOrZero( input ipiInteger as integer ):
        
        return ipiInteger = ? or ipiInteger = 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is odd
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is odd, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsOdd( input ipiInteger as integer ):
        
        return ipiInteger mod 2 <> 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is positive (greater than zero)
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is positive, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsPositive( input ipiInteger as integer ):
        
        return ipiInteger > 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a given integer is zero
        Notes:
        @param ipiInteger as integer, the integer to check
        @return logical, true if the integer is zero, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsZero( input ipiInteger as integer ):
        
        return ipiInteger = 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a given integer to its string representation
        Notes:
        @param ipiInteger as integer, the integer to be converted
        @return character, the string representation of the integer
    ------------------------------------------------------------------------------*/
    method public static character ToString( input ipiInteger as integer ):
        
        return string(ipiInteger).
        
    end method.

end class.
