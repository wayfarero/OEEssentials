/*------------------------------------------------------------------------
   File        : RegexLinuxUtil
   Purpose     : Utility class for regex matching on Linux
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Mon Nov 11 17:01:35 EET 2024
   Notes       :
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.RegexLinuxUtil:
    
    /*------------------------------------------------------------------------------
        Purpose: Matches a string against a regex pattern using a Linux command
        Notes: This method uses 'perl' with command-line execution to perform regex matching
        @param ipcPattern as character, the regex pattern to use for matching
        @param ipcTestString as character, the string to test against the regex
        @return logical, TRUE if the pattern matches, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical MatchRegex( input  ipcPattern    as character, 
                                             input  ipcTestString as character ):
        define variable cCommand    as character no-undo.
        define variable cOutputFile as character no-undo.
        define variable cResultLine as character no-undo.
        define variable lIsMatch    as logical   no-undo.
        
        /* Temporary output file */
        cOutputFile = "/tmp/grep_output.txt".
        
        /* Construct command */
        cCommand = substitute( "echo '&1' | perl -ne 'print if /&2/' > &3",
                               ipcTestString, 
                               ipcPattern, 
                               cOutputFile ).
        
        /* Execute command */
        os-command silent value(cCommand).
        
        /* import unformatted will not read the line in there is not new line feed */
        output to value(cOutputFile) append .
          put unformatted "~n" skip.
        output close .           
        
        /* Read result from output file */
        input from value(cOutputFile).
            import unformatted cResultLine.
        input close.
        
        /* Determine if there was a match */
        if (cResultLine <> "") and (cResultLine <> ?) then 
            lIsMatch = yes.
        else 
            lIsMatch = no.
        
        return lIsMatch.

        finally:
            /* Cleanup */
            os-command silent value(substitute("rm -f &1", cOutputFile)).
        end finally.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Matches a string against a regex pattern using a C library
        Notes: This method uses a C library ('regm.so' wrapper for 'pcre.h') to perform regex matching
        @param ipcPattern as character, the regex pattern to use for matching
        @param ipcTestString as character, the string to test against the regex
        @return long, match offset (0 or greater if match found), -1 if no match, -2 if pattern error
    ------------------------------------------------------------------------------*/
    procedure regex_match external "./regm.so" cdecl:
        define input parameter ipcPattern    as character no-undo.
        define input parameter ipcTestString as character no-undo.
        define return parameter dblResult as long no-undo.
    end procedure.    
    
    /*------------------------------------------------------------------------------
        Purpose: Matches a string against a regex pattern using a C library function
        Notes: This method calls the 'regex_match' function from the 'regm.so' library (based on 'regex.h')
        @param ipcPattern as character, the regex pattern to use for matching
        @param ipcTestString as character, the string to test against the regex
        @return logical, TRUE if the pattern matches, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical MatchRegexWithLib( input ipcPattern    as character, 
                                                    input ipcTestString as character ):
        define variable result as int no-undo.     
        run regex_match( input ipcPattern, 
                         input ipcTestString,
                         output result ).
                         
        return result eq 0.
                                                        
    end method.

end class.
