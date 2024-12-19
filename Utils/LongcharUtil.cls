/*------------------------------------------------------------------------
   File        : LongcharUtils
   Purpose     : Main helper class to handle longchar operations 
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Fri Nov 22 12:41:52 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.LongcharUtil: 
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string is empty
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if empty, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsEmpty( input iplcString as longchar ):
        
        return iplcString = "".     

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string is not empty
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if not empty, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotEmpty( input iplcString as longchar ):
        
        return iplcString <> "".     

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string is null
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if null, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNull( input iplcString as longchar ):  
        
        return iplcString = ?.     

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string is not null
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if not null, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNull( input iplcString as longchar ):
        
        return iplcString <> ?.   

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string is null or empty
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if null or empty, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNullOrEmpty( input iplcString as longchar ):
        
        return iplcString = "" or iplcString = ?.   

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string is not null or empty
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if not null or empty, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNullOrEmpty( input iplcString as longchar ):
        
        return iplcString <> "" and iplcString <> ?. 

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string is lowercase
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if lowercase, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsLowercase( input iplcString as longchar ):
        define variable iCount as integer   no-undo.
        define variable cChar  as character no-undo.
        
        do iCount = 1 to length(iplcString):
            
            cChar = substring(iplcString, iCount, 1). 
            
            if asc(cChar) < 97 or asc(cChar) > 122 then 
                return false. 
        end.
        
        return true.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string is uppercase
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if uppercase, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsUppercase( input iplcString as longchar ):
        define variable iCount as integer   no-undo.
        define variable cChar  as character no-undo.
        
        do iCount = 1 to length(iplcString):
            
            cChar = substring(iplcString, iCount, 1). 
            
            if asc(cChar) < 65 or asc(cChar) > 90 then 
                return false. 
        end.
        
        return true.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a string contains a number
        Notes:
        @param iplcString as longchar, the string to check
        @return logical, TRUE if contains a number, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ContainsNumber( input iplcString as longchar ):
        define variable iCount as integer   no-undo.
        define variable cChar  as character no-undo.
        
        do iCount = 1 to length(iplcString):
            
            cChar = substring(iplcString, iCount, 1). 
            
            if asc(cChar) >= 48 and asc(cChar) <= 57 then 
                return true. 
        end.
        
        return false.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Capitalize the first letter of a string
        Notes:
        @param iplcString as longchar, the string to modify
        @return longchar, the string with the first letter capitalized
    ------------------------------------------------------------------------------*/
    method public static longchar StartWithCapital( input iplcString as longchar ):
        define variable cFirstLetter as character. 
        
        assign 
            cFirstLetter              = substring(iplcString, 1, 1) 
            overlay(iplcString, 1, 1) = upper(cFirstLetter).
        
        return iplcString.   

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Lowercase the first letter of a string
        Notes:
        @param iplcString as longchar, the string to modify
        @return longchar, the string with the first letter lowercased
    ------------------------------------------------------------------------------*/
    method public static longchar StartWithLowercase( input iplcString as longchar ):
        define variable cFirstLetter as character. 
        
        assign 
            cFirstLetter              = substring(iplcString, 1, 1)
            overlay(iplcString, 1, 1) = lower(cFirstLetter).
        
        return iplcString.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Format a string to PascalCase
        Notes:
        @param iplcString as longchar, the string to modify
        @param ipcSeparator as character, the string separator
        @return longchar, the string in PascalCase format
    ------------------------------------------------------------------------------*/
    method public static longchar StringToPascalCase( input iplcString   as longchar, 
                                                      input ipcSeparator as character ):
        define variable iCount as integer   no-undo. 
        define variable cWord  as character no-undo.
        
        do iCount = 1 to num-entries(iplcString, ipcSeparator):
            assign 
                cWord      = entry(iCount, iplcString, ipcSeparator)
                iplcString = replace(iplcString, cWord, StartWithCapital(cWord)).
        end.
        
        iplcString = replace(iplcString, ipcSeparator, "").
        
        return iplcString.   

    end method.       
    
    /*------------------------------------------------------------------------------
        Purpose: Format a string to camelCase
        Notes:
        @param iplcString as longchar, the string to modify
        @param ipcSeparator as character, the string separator
        @return longchar, the string in camelCase format
    ------------------------------------------------------------------------------*/
    method public static longchar StringToCamelCase( input iplcString   as longchar, 
                                                     input ipcSeparator as character ):
        define variable iCount as integer  no-undo. 
        define variable lcWord as longchar no-undo.
                
        lcWord = entry(1, iplcString, ipcSeparator).
        
        iplcString = replace(iplcString, lcWord, StartWithLowercase(lcWord)).
        
        do iCount = 2 to num-entries(iplcString, ipcSeparator):
            assign 
                lcWord     = entry(iCount, iplcString, ipcSeparator)
                iplcString = replace(iplcString, lcWord, StartWithCapital(lcWord)).
        end.
        
        iplcString = replace(iplcString, ipcSeparator, "").
        
        return iplcString.   

    end method.       

    /*------------------------------------------------------------------------------
        Purpose: Add quotes to a string
        Notes:
        @param iplcString as longchar, the string to modify
        @return longchar, the string with quotes added
    ------------------------------------------------------------------------------*/
    method public static longchar Quote( input iplcString as longchar ):
        
        return quoter(iplcString).   

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Remove quotes from a string
        Notes:
        @param iplcString as longchar, the string to modify
        @return longchar, the string without quotes
    ------------------------------------------------------------------------------*/
    method public static longchar UnQuote( input iplcString as longchar ):
        
        return replace(iplcString, '"', "").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Get the value of a token from a tokenized string
        Notes:
        @param iplcString as longchar, the tokenized string
        @param ipiPosition as integer, the position of the token
        @return longchar, the value of the token
    ------------------------------------------------------------------------------*/
    method public static longchar GetTokenValueFromString( input iplcString  as longchar, 
                                                           input ipiPosition as integer ):
        define variable lcKeyValue as longchar no-undo.
                
        lcKeyValue = entry(ipiPosition, iplcString, ",").
        
        return entry(2, lcKeyValue, "=").
 
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Set the value of a token in a tokenized string
        Notes:
        @param iplcString as longchar, the tokenized string
        @param iplcTokenValue as longchar, the token value to set
        @param ipiPosition as integer, the position of the token
        @return longchar, the updated tokenized string
    ------------------------------------------------------------------------------*/
    method public static longchar SetTokenValueInString( input iplcString     as longchar, 
                                                         input iplcTokenValue as longchar, 
                                                         input ipiPosition    as integer):
        define variable lcKeyValue  as longchar no-undo.
        define variable lcKey       as longchar no-undo.
        define variable iEqPosition as integer  no-undo.
        
        assign 
            lcKeyValue  = entry(ipiPosition, iplcString, ",")
            iEqPosition = index(lcKeyValue, "=")
            lcKey       = substring(lcKeyValue, 1, iEqPosition)
            iplcString  = replace(iplcString, lcKeyValue, lcKey + iplcTokenValue). 
        
        return iplcString.               
 
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Remove a token from a tokenized string
        Notes:
        @param iplcString as longchar, the tokenized string
        @param ipiPosition as integer, the position of the token to remove
        @return longchar, the tokenized string without the removed token
    ------------------------------------------------------------------------------*/
    method public static longchar RemoveTokenFromString( input iplcString  as longchar, 
                                                         input ipiPosition as integer ):
        define variable lcKeyValue as longchar no-undo.
        
        lcKeyValue = entry(ipiPosition, iplcString, ",").
        
        if ipiPosition = 1 then         
            iplcString = replace(iplcString, lcKeyValue + ",", ""). 
        else 
            iplcString = replace(iplcString, "," + lcKeyValue, "").
        
        return iplcString.
 
    end method.    

end class.
