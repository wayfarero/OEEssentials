/*------------------------------------------------------------------------
   File        : StringUtil
   Purpose     : Main helper class to handle character operations 
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Thu Oct 17 14:27:41 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.StringUtil:

    /*------------------------------------------------------------------------------
        Purpose: Check if string is empty
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string is empty, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsEmpty( input ipcString as character ):
        
        return ipcString = "".     

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if string is not empty
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string is not empty, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotEmpty( input ipcString as character ):
        
        return ipcString <> "".     

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if string is null
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string is null, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNull( input ipcString as character ):  
        
        return ipcString = ?.     

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if string is not null
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string is not null, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNull( input ipcString as character ):
        
        return ipcString <> ?.   

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if string is null or empty
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string is null or empty, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNullOrEmpty( input ipcString as character ):
        
        return ipcString = "" or ipcString = ?.   

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if string is not null nor empty
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string is not null nor empty, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNullOrEmpty( input ipcString as character ):
        
        return ipcString <> "" and ipcString <> ?. 

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if string is lowercase
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string is lowercase, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsLowercase( input ipcString as character ):
        define variable iCount as integer   no-undo.
        define variable cChar  as character no-undo.
        
        do iCount = 1 to length(ipcString):
            
            cChar = substring(ipcString, iCount, 1). 
            
            if asc(cChar) < 97 or asc(cChar) > 122 then 
                return false. 
        end.
        
        return true.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if string is uppercase
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string is uppercase, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsUppercase( input ipcString as character ):
        define variable iCount as integer   no-undo.
        define variable cChar  as character no-undo.
        
        do iCount = 1 to length(ipcString):
            
            cChar = substring(ipcString, iCount, 1). 
            
            if asc(cChar) < 65 or asc(cChar) > 90 then 
                return false. 
        end.
        
        return true.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if string contains a number
        Notes:
        @param ipcString as character, the string to check
        @return logical, TRUE if the string contains a number, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ContainsNumber( input ipcString as character ):
        define variable iCount as integer   no-undo.
        define variable cChar  as character no-undo.
        
        do iCount = 1 to length(ipcString):
            
            cChar = substring(ipcString, iCount, 1). 
            
            if asc(cChar) >= 48 and asc(cChar) <= 57 then 
                return true. 
        end.
        
        return false.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Capitalize the first letter of a string
        Notes:
        @param ipcString as character, the string to modify
        @return character, the modified string with the first letter capitalized
    ------------------------------------------------------------------------------*/
    method public static character StartWithCapital( input ipcString as character ):
        define variable cFirstLetter as character. 
        
        assign 
            cFirstLetter             = substring(ipcString, 1, 1) 
            overlay(ipcString, 1, 1) = upper(cFirstLetter).
        
        return ipcString.   

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Lowercase the first letter of a string
        Notes:
        @param ipcString as character, the string to modify
        @return character, the modified string with the first letter lowercased
    ------------------------------------------------------------------------------*/
    method public static character StartWithLowercase( input ipcString as character ):
        define variable cFirstLetter as character. 
        
        assign 
            cFirstLetter             = substring(ipcString, 1, 1)
            overlay(ipcString, 1, 1) = lower(cFirstLetter).
        
        return ipcString.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Format character to Pascal case
        Notes:
        @param ipcString as character, the string to modify
        @param ipcSeparator as character, the string separator
        @return character, the string formatted in Pascal case
    ------------------------------------------------------------------------------*/
    method public static character StringToPascalCase( input ipcString    as character, 
                                                       input ipcSeparator as character ):
        define variable iCount as integer   no-undo. 
        define variable cWord  as character no-undo.
        
        do iCount = 1 to num-entries(ipcString, ipcSeparator):
            assign 
                cWord     = entry(iCount, ipcString, ipcSeparator)
                ipcString = replace(ipcString, cWord, StartWithCapital(cWord)).
        end.
        
        ipcString = replace(ipcString, ipcSeparator, "").
        
        return ipcString.   

    end method.       
    
    /*------------------------------------------------------------------------------
        Purpose: Format character to camel case
        Notes:
        @param ipcString as character, the string to modify
        @param ipcSeparator as character, the string separator
        @return character, the string formatted in camel case
    ------------------------------------------------------------------------------*/
    method public static character StringToCamelCase( input ipcString    as character, 
                                                      input ipcSeparator as character ):
        define variable iCount as integer   no-undo. 
        define variable cWord  as character no-undo.
                
        cWord = entry(1, ipcString, ipcSeparator).
        
        ipcString = replace(ipcString, cWord, StartWithLowercase(cWord)).
        
        do iCount = 2 to num-entries(ipcString, ipcSeparator):
            assign 
                cWord     = entry(iCount, ipcString, ipcSeparator)
                ipcString = replace(ipcString, cWord, StartWithCapital(cWord)).
        end.
        
        ipcString = replace(ipcString, ipcSeparator, "").
        
        return ipcString.   

    end method.       

    /*------------------------------------------------------------------------------
        Purpose: Add quotes to a string.
        Notes:
        @param ipcString as character, the string to modify.
        @return character, the string with added quotes.
    ------------------------------------------------------------------------------*/
    method public static character Quote( input ipcString as character ):
        
        return quoter(ipcString).   

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Remove quotes from a string
        Notes:
        @param ipcString as character, the string to modify
        @return character, the string without quotes
    ------------------------------------------------------------------------------*/
    method public static character UnQuote( input ipcString as character ):
        
        return replace(ipcString, '"', "").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the token value of a token string
        Notes:
        @param ipcString as character, the string containing token values
        @param ipiPosition as integer, the position of the token value to return
        @return character, the token value at the specified position
    ------------------------------------------------------------------------------*/
    method public static character GetTokenValueFromString( input ipcString   as character, 
                                                            input ipiPosition as integer ):
        define variable cKeyValue as character no-undo.
                
        cKeyValue = entry(ipiPosition, ipcString, ",").
        
        return entry(2, cKeyValue, "=").
 
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Sets the token value in a token string
        Notes:
        @param ipcString as character, the string to modify
        @param ipcTokenValue as character, the token value to set
        @param ipiPosition as integer, the position of the token to modify
        @return character, the token string with the updated token value
    ------------------------------------------------------------------------------*/
    method public static character SetTokenValueInString( input ipcString     as character, 
                                                          input ipcTokenValue as character, 
                                                          input ipiPosition   as integer):
        define variable cKeyValue   as character no-undo.
        define variable cKey        as character no-undo.
        define variable iEqPosition as integer   no-undo.
        
        assign 
            cKeyValue   = entry(ipiPosition, ipcString, ",")
            iEqPosition = index(cKeyValue, "=")
            cKey        = substring(cKeyValue, 1, iEqPosition)
            ipcString   = replace(ipcString, cKeyValue, cKey + ipcTokenValue). 
        
        return ipcString.               
 
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes a token from a token string
        Notes:
        @param ipcString as character, the string to modify
        @param ipiPosition as integer, the position of the token to remove
        @return character, the token string without the removed token
    ------------------------------------------------------------------------------*/
    method public static character RemoveTokenFromString( input ipcString   as character, 
                                                          input ipiPosition as integer ):
        define variable cKeyValue as character no-undo.
        
        cKeyValue = entry(ipiPosition, ipcString, ",").
        
        if ipiPosition = 1 then         
            ipcString = replace(ipcString, cKeyValue + ",", ""). 
        else 
            ipcString = replace(ipcString, "," + cKeyValue, "").
        
        return ipcString.
 
    end method.
    
end class.
