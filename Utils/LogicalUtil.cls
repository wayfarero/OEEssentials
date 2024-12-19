/*------------------------------------------------------------------------
   File        : LogicalUtil
   Purpose     : Main helper class to handle logical operations 
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Tue Nov 26 10:35:54 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.LogicalUtil:

    /*------------------------------------------------------------------------------
        Purpose: Checks if a logical value is null (?)
        Notes:
        @param iplValue as logical, the logical value to check
        @return logical, TRUE if null, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNull( input iplValue as logical ):
        
        return iplValue = ?.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a logical value is not null (?)
        Notes:
        @param iplValue as logical, the logical value to check
        @return logical, TRUE if not null, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNull( input iplValue as logical ):
        
        return iplValue <> ?.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a logical value to its string representation
        Notes:
        @param iplValue as logical, the logical value to convert
        @return character, "TRUE", "FALSE", or "NULL" based on the input value
    ------------------------------------------------------------------------------*/
    method public static character ToString( input iplValue as logical ):
        
        return if iplValue = true then 
                   "TRUE"
               else 
                   if iplValue = false then 
                       "FALSE"
                   else 
                       "NULL".
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Performs a logical AND operation between two logical values
        Notes:
        @param iplValue1 as logical, the first logical value
        @param iplValue2 as logical, the second logical value
        @return logical, the result of the AND operation
    ------------------------------------------------------------------------------*/    
    method public static logical LogicalAnd( input iplValue1 as logical,
                                             input iplValue2 as logical ):
        
        return iplValue1 and iplValue2.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Performs a logical OR operation between two logical values
        Notes:
        @param iplValue1 as logical, the first logical value
        @param iplValue2 as logical, the second logical value
        @return logical, the result of the OR operation
    ------------------------------------------------------------------------------*/
    method public static logical LogicalOr( input iplValue1 as logical,
                                            input iplValue2 as logical ):
        
        return iplValue1 or iplValue2.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Performs a logical XOR (exclusive OR) operation between two logical values
        Notes:
        @param iplValue1 as logical, the first logical value
        @param iplValue2 as logical, the second logical value
        @return logical, TRUE if exactly one of the inputs is TRUE, otherwise FALSE
    ------------------------------------------------------------------------------*/
    method public static logical LogicalXor( input iplValue1 as logical,
                                             input iplValue2 as logical ):
        
        return (iplValue1 and not iplValue2) or (not iplValue1 and iplValue2).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Performs a logical NOT operation on a logical value
        Notes:
        @param iplValue as logical, the logical value to negate
        @return logical, the result of the NOT operation
    ------------------------------------------------------------------------------*/
    method public static logical LogicalNot( input iplValue as logical ):
        
        return not iplValue.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a logical value is explicitly TRUE
        Notes:
        @param iplValue as logical, the logical value to check
        @return logical, TRUE if the value is TRUE, otherwise FALSE
    ------------------------------------------------------------------------------*/
    method public static logical IsTrue( input iplValue as logical ):
        
        return iplValue = true.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if a logical value is explicitly FALSE
        Notes:
        @param iplValue as logical, the logical value to check
        @return logical, TRUE if the value is FALSE, otherwise FALSE
    ------------------------------------------------------------------------------*/
    method public static logical IsFalse( input iplValue as logical ):
        
        return iplValue = false.
        
    end method.

end class.
