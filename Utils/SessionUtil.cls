/*------------------------------------------------------------------------
   File        : SessionUtil
   Purpose     : Main helper class to handle session operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Tue Nov 05 15:39:22 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.SessionUtil:

    /*------------------------------------------------------------------------------
        Purpose: Retrieves the current session date format
        Notes: The format represents how dates are displayed, e.g., "mdy"
        @return character, the current date format of the session
    ------------------------------------------------------------------------------*/
    method public static character GetDateFormat( ):
        
        return session:date-format.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Sets the session date format to a specified format
        Notes: Accepted formats are: mdy, myd, dmy, dym, ymd, ydm
        @param ipcDateFormat as character, the desired date format for the session
    ------------------------------------------------------------------------------*/
    method public static void SetDateFormat( input ipcDateFormat as character ):
        
        session:date-format = ipcDateFormat.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Retrieves the current numeric separator
        Notes:
        @return character, the current numeric separator of the session
    ------------------------------------------------------------------------------*/
    method public static character GetNumericSeparator( ):
        
        return session:numeric-separator.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Retrieves the current numeric decimal point
        Notes:
        @return character, the current numeric decimal point of the session
    ------------------------------------------------------------------------------*/
    method public static character GetNumericDecimalPoint( ):
        
        return session:numeric-decimal-point.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Retrieves the current numeric format
        Notes:
        @return character, the current numeric format of the session
    ------------------------------------------------------------------------------*/
    method public static character GetNumericFormat( ):
        
        return session:numeric-format.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Sets the numeric format in the session
        Notes:
        @param ipcNumericFormat as character, the desired numeric format for the session
    ------------------------------------------------------------------------------*/
    method public static void SetNumericFormat( input ipcNumericFormat as character ):
        
        session:numeric-format = ipcNumericFormat.
        
    end method.
    
   /*------------------------------------------------------------------------------
        Purpose: Retrieves session startup parameters as a single character string
        Notes:
        @return character, the startup parameters of the session
    ------------------------------------------------------------------------------*/
    method public static character GetStartupParameters( ):
        
        return session:startup-parameters.

    end method.
    
end class.
