/*------------------------------------------------------------------------
   File        : ValidatorUtil
   Purpose     : Main helper class for validation
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Nov 06 11:04:44 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.
&IF OPSYS = "WIN32" &THEN
using System.Text.RegularExpressions.Regex.
&ENDIF

&IF OPSYS = "UNIX" &THEN
using oeessentials.RegexLinuxUtil.
&ENDIF

class oeessentials.ValidatorUtil:

    /*------------------------------------------------------------------------------
        Purpose: Validates if an email address is in a standard format
        Notes: On UNIX, this method uses the 'perl' command for regex matching
        @param ipcEmail as character, the email address to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateEmailAddress( input ipcEmail as character ):
        define variable cPattern      as character no-undo initial "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]&12,&2$".
        define variable cLinuxPattern as character no-undo initial "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]&12,&2$".
        
        return MatchPattern(cPattern, cLinuxPattern, ipcEmail, false).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Validates if an email address is in a standard format
        Notes: On UNIX, this method uses the C library 'regm.so' for regex matching
        @param ipcEmail as character, the email address to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateEmailAddressUnixLibrary( input ipcEmail as character ):
        define variable cPattern      as character no-undo initial "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]&12,&2$".
        define variable cLinuxPattern as character no-undo initial "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]&12,&2$".
        
        return MatchPattern(cPattern, cLinuxPattern, ipcEmail, true).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Validates a credit card number using the Luhn algorithm
        Notes: On UNIX, this method uses the 'perl' command for regex matching
        @param ipcCardNumber as character, the credit card number to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateCreditCardNumber( input ipcCardNumber as character ):
        define variable cPattern as character no-undo initial "^[0-9]&113,19&2$".
        
        if not MatchPattern(cPattern, "", ipcCardNumber, false) then return false.

        return CalculateLuhnChecksum(ipcCardNumber).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Validates a credit card number using the Luhn algorithm
        Notes: On UNIX, this method uses the C library 'regm.so' for regex matching
        @param ipcCardNumber as character, the credit card number to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateCreditCardNumberUnixLibrary( input ipcCardNumber as character ):
        define variable cPattern as character no-undo initial "^[0-9]&113,19&2$".

        if not MatchPattern(cPattern, "", ipcCardNumber, true) then return false.

        return CalculateLuhnChecksum(ipcCardNumber).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Validates if an IP address is in a valid IPv4 format
        Notes: On UNIX, this method uses the 'perl' command for regex matching
        @param ipcIPAddress as character, the IP address to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateIPv4Address( input ipcIPAddress as character ):
        define variable iCount   as integer   no-undo.
        define variable iSegment as integer   no-undo.
        define variable cSegment as character no-undo.

        if num-entries(trim (ipcIPAddress), ".") <> 4 then
            return false.

        do iCount = 1 to 4:
            cSegment = entry(iCount, ipcIPAddress, ".").

            if integer(cSegment) = ? then
                return false.

            iSegment = integer(cSegment).

            if iSegment < 0 or iSegment > 255 then
                return false.
        end.

        return true.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Validates if an IP address is in a valid IPv6 format
        Notes: Accepts standard and shorthand IPv6 notations. On UNIX, this method uses the 'perl' command for regex matching
        @param ipcIPAddress as character, the IPv6 address to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateIPv6Address( input ipcIPAddress as character ):
        define variable cPattern as character no-undo initial "^((([0-9A-Fa-f]&11,4&2:)&17&2([0-9A-Fa-f]&11,4&2|:))|(([0-9A-Fa-f]&11,4&2:)&11,7&2:)|(([0-9A-Fa-f]&11,4&2:)&11,6&2:[0-9A-Fa-f]&11,4&2)|(([0-9A-Fa-f]&11,4&2:)&11,5&2(:[0-9A-Fa-f]&11,4&2)&11,2&2)|(([0-9A-Fa-f]&11,4&2:)&11,4&2(:[0-9A-Fa-f]&11,4&2)&11,3&2)|(([0-9A-Fa-f]&11,4&2:)&11,3&2(:[0-9A-Fa-f]&11,4&2)&11,4&2)|(([0-9A-Fa-f]&11,4&2:)&11,2&2(:[0-9A-Fa-f]&11,4&2)&11,5&2)|([0-9A-Fa-f]&11,4&2:((:[0-9A-Fa-f]&11,4&2)&11,6&2))|(:((:[0-9A-Fa-f]&11,4&2)&11,7&2|:))|(fe80:(:[0-9A-Fa-f]&10,4&2)&10,4&2%[0-9A-Za-z]&11,&2)|(::(ffff(:0&11,4&2)&10,1&2:)&10,1&2((25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?)\.)&13&2(25[0-5]|2[0-4][0-9]|[0-1]?[0-9][0-9]?))|([0-9A-Fa-f]&11,4&2:(:[0-9A-Fa-f]&11,4&2)&11,7&2))$".

        return MatchPattern(cPattern, "", ipcIPAddress, false).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Validates if an IP address is in a valid IPv6 format
        Notes: Accepts standard and shorthand IPv6 notations. On UNIX, this method uses the C library 'regm.so' for regex matching
        @param ipcIPAddress as character, the IPv6 address to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateIPv6AddressUnixLibrary( input ipcIPAddress as character ):
        define variable cPattern as character no-undo initial "^((?:[A-Fa-f0-9]&11,4&2:)&17&2[A-Fa-f0-9]&11,4&2|(?:[A-Fa-f0-9]&11,4&2:)&11,7&2:|(?:[A-Fa-f0-9]&11,4&2:)&11,6&2:[A-Fa-f0-9]&11,4&2|(?:[A-Fa-f0-9]&11,4&2:)&11,5&2:(?:[A-Fa-f0-9]&11,4&2:)&11,4&2|(?:[A-Fa-f0-9]&11,4&2:)&11,4&2:(?:[A-Fa-f0-9]&11,4&2:)&11,3&2:[A-Fa-f0-9]&11,4&2|(?:[A-Fa-f0-9]&11,4&2:)&11,3&2:(?:[A-Fa-f0-9]&11,4&2:)&11,2&2:[A-Fa-f0-9]&11,4&2|(?:[A-Fa-f0-9]&11,4&2:)&11,2&2:[A-Fa-f0-9]&11,4&2:[A-Fa-f0-9]&11,4&2|[A-Fa-f0-9]&11,4&2:(?::[A-Fa-f0-9]&11,4&2)&11,7&2)$".

        return MatchPattern(cPattern, "", ipcIPAddress, true).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Validates if a URL is in a standard format
        Notes: On UNIX, this method uses the 'perl' command for regex matching
        @param ipcURL as character, the URL to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateURL( input ipcURL as character ):
        define variable cPattern      as character no-undo initial "^(https?://)?(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]&12,&2)+$".
        define variable cLinuxPattern as character no-undo initial "^(https?\\:\\/\\/)?(www\\.)?[a-zA-Z0-9-]+(\\.[a-zA-Z]&12,&2)+$".

        return MatchPattern(cPattern, cLinuxPattern, ipcURL, false).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Validates if a URL is in a standard format
        Notes: On UNIX, this method uses the C library 'regm.so' for regex matching
        @param ipcURL as character, the URL to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidateURLUnixLibrary( input ipcURL as character ):
        define variable cPattern      as character no-undo initial "^(https?://)?(www\.)?[a-zA-Z0-9-]+(\.[a-zA-Z]&12,&2)+$".
        define variable cLinuxPattern as character no-undo initial "^(https?\\:\\/\\/)?(www\\.)?[a-zA-Z0-9-]+(\\.[a-zA-Z]&12,&2)+$".

        return MatchPattern(cPattern, cLinuxPattern, ipcURL, true).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Validates if a phone number is in a standard format
        Notes: On UNIX, this method uses the 'perl' command for regex matching
        @param ipcPhoneNumber as character, the phone number to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidatePhoneNumber( input ipcPhoneNumber as character ):
        define variable cPattern      as character no-undo initial "^\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\W*\d)&10,13&2\d$".
        define variable cLinuxPattern as character no-undo initial "^\\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\\W*\\d)&10,13&2\\d$".

        return MatchPattern(cPattern, cLinuxPattern, ipcPhoneNumber, false).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Validates if a phone number is in a standard format
        Notes: On UNIX, this method uses the C library 'regm.so' for regex matching
        @param ipcPhoneNumber as character, the phone number to validate
        @return logical, TRUE if valid, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical ValidatePhoneNumberUnixLibrary( input ipcPhoneNumber as character ):
        define variable cPattern      as character no-undo initial "^\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\W*\d)&10,13&2\d$".
        define variable cLinuxPattern as character no-undo initial "^\\+((?:9[679]|8[035789]|6[789]|5[90]|42|3[578]|2[1-689])|9[0-58]|8[1246]|6[0-6]|5[1-8]|4[013-9]|3[0-469]|2[70]|7|1)(?:\\W*\\d)&10,13&2\\d$".

        return MatchPattern(cPattern, cLinuxPattern, ipcPhoneNumber, true).

    end method.
    
    method private static logical MatchPattern( input ipcPattern      as character,
                                                input ipcLinuxPattern as character,
                                                input ipcTestString   as character,
                                                input useLib          as logical ):
        ipcPattern = substitute(ipcPattern, chr(123), chr(125)).
        ipcLinuxPattern = substitute(ipcLinuxPattern, chr(123), chr(125)).

        &IF OPSYS = "WIN32" &THEN
            return Regex:IsMatch(ipcTestString, ipcPattern).
        &ENDIF

        &IF OPSYS = "UNIX" &THEN
            define variable activePattern as character no-undo.
            
            activePattern = if ipcLinuxPattern <> "" then ipcLinuxPattern else ipcPattern.

            if useLib then
                return RegexLinuxUtil:MatchRegexWithLib(activePattern, ipcTestString).
            else
                return RegexLinuxUtil:MatchRegex(activePattern, ipcTestString).
        &ENDIF

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Calculates if a credit card number is valid based on the Luhn algorithm
        Notes: This method is used internally by the credit card validation methods
        @param ipcCardNumber as character, the credit card number to validate
        @return logical, TRUE if the number is valid per Luhn algorithm, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method private static logical CalculateLuhnChecksum(input ipcCardNumber as character):
        define variable iSum    as integer no-undo.
        define variable iPos    as integer no-undo.
        define variable iDigit  as integer no-undo.
        define variable iLength as integer no-undo.

        iLength = length(ipcCardNumber).
        do iPos = 1 to iLength:
            iDigit = integer(substring(ipcCardNumber, iLength - iPos + 1, 1)).
            if iPos mod 2 = 0 then 
            do:
                iDigit = iDigit * 2.
                if iDigit > 9 then iDigit = iDigit - 9.
            end.
            iSum = iSum + iDigit.
        end.

        return iSum mod 10 = 0.
    end method.
    
end class.
