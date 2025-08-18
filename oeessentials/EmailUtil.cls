/*------------------------------------------------------------------------
   File        : EmailUtil
   Purpose     : Main helper class to handle email operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Fri Oct 25 11:52:34 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class oeessentials.EmailUtil: 

    /*------------------------------------------------------------------------------
        Purpose: Return the domain of an email
        Notes:
        @param ipcEmail as character, the email string to get the domain from
        @return character, the domain
    ------------------------------------------------------------------------------*/
    method public static character GetDomain( input ipcEmail as character ):
        define variable iAtPosition as integer no-undo.
        
        if ipcEmail = ? or ipcEmail = "" then
            return "".
            
        iAtPosition = index(ipcEmail, "@").
        
        if iAtPosition > 0 then
            return substring(ipcEmail, iAtPosition + 1).
        else
            return "".
            
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Return the username of an email
        Notes:
        @param ipcEmail as character, the email string to get the username from
        @return character, the username
    ------------------------------------------------------------------------------*/
    method public static character GetUserName( input ipcEmail as character ):
        define variable iAtPosition as integer no-undo.
        
        if ipcEmail = ? or ipcEmail = "" then
            return "".
            
        iAtPosition = index(ipcEmail, "@").
        
        if iAtPosition > 0 then
            return substring(ipcEmail, 1, iAtPosition - 1).
        else
            return "".
            
    end method.
    
end class.
