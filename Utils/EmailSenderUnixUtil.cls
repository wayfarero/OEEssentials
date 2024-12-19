/*------------------------------------------------------------------------
   File        : EmailSenderUnixUtil
   Purpose     : Main helper class for sending email on Unix
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Thu Dec 05 11:43:32 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.EmailSenderUnixUtil:

    /*------------------------------------------------------------------------------
        Purpose: Send an email on Linux using curl
        Notes:
        @param ipcToEmails as character, the list of recipient emails, separated by commas
        @param ipcFromEmail as character, the sender's email address
        @param ipcSubject as character, the email subject
        @param ipcBody as character, the email body
        @param ipcSmtpHost as character, the SMTP host
        @param ipcSmtpPort as integer, the SMTP port
        @param ipcSmtpUser as character, the SMTP username
        @param ipcSmtpPassword as character, the SMTP password
    ------------------------------------------------------------------------------*/
    method public static void SendEmail( input ipcToEmails     as character,
                                         input ipcFromEmail    as character,
                                         input ipcSubject      as character,
                                         input ipcBody         as character,
                                         input ipcSmtpHost     as character,
                                         input ipcSmtpPort     as integer,
                                         input ipcSmtpUser     as character,
                                         input ipcSmtpPassword as character ):
        define variable cToEmailList  as character no-undo.
        define variable cTempFileName as character no-undo.
        define variable cCurlCommand  as character no-undo.

        /* Validate inputs */
        if ipcToEmails = "" or ipcFromEmail = "" or ipcSubject = "" or ipcBody = "" or
            ipcSmtpHost = "" or ipcSmtpPort = 0 or ipcSmtpUser = "" or ipcSmtpPassword = "" then do:
                
            undo, throw new Progress.Lang.AppError("One or more required parameters are empty.").
        end.
        
        assign 
            cToEmailList  = ipcToEmails
            cTempFileName = "email_content_" + string(random(1, 1000000)) + ".txt".
        
        output to value(cTempFileName).
        
        put unformatted substitute(
            'From: &1~nTo: &2~nSubject: &3~n~n&4',
            ipcFromEmail,
            cToEmailList,
            ipcSubject,
            ipcBody
            ) skip.
            
        output close.

        /* Construct the curl command using the temporary file */
        cCurlCommand = substitute(
            'curl --verbose --url "smtp://&1:&2" ' +
            '--ssl ' +
            '--mail-from "&3" ' +
            '--mail-rcpt "&4" ' +
            '--user "&5:&6" ' +
            '--upload-file "&7"',
            ipcSmtpHost,
            string(ipcSmtpPort),
            ipcFromEmail,
            cToEmailList,
            ipcSmtpUser,
            ipcSmtpPassword,
            cTempFileName
            ).

        /* Execute the curl command */
        os-command silent value(cCurlCommand).

        /* Clean up the temporary file */
        if search(cTempFileName) <> ? then do:
            os-command silent value("rm -f " + cTempFileName).
        end.

    end method.

end class.
