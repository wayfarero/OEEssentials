/*------------------------------------------------------------------------
    File        : EmailSenderWindowsUtil
    Purpose     : Main helper class for sending email on Windows
    Syntax      : 
    Description : 
    Author(s)   : Wayfare
    Created     : Thu Nov 07 13:53:11 EET 2024
    Notes       : 
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using oeessentials.StringUtil.

&IF OPSYS = "WIN32" &THEN
using System.Net.Mail.MailAddress.
using System.Net.Mail.MailMessage.
using System.Net.Mail.SmtpClient.
using System.Net.Mail.SmtpDeliveryMethod.
using System.Net.SecurityProtocolType.
using System.Net.ServicePointManager.
&ENDIF

class oeessentials.EmailSenderWindowsUtil: 
    
    /*------------------------------------------------------------------------------
        Purpose: Send an email on Windows
        Notes:
        @param ipcToEmails as character, the list of recipient emails separated by commas
        @param ipcFromEmail as character, the sender's email address
        @param ipcFromUserName as character, the sender's username
        @param ipcSubject as character, the subject of the email
        @param ipcBody as character, the body of the email
    ------------------------------------------------------------------------------*/
    method public static void SendEmail( input ipcToEmails     as character,
                                         input ipcFromEmail    as character,
                                         input ipcFromUserName as character,
                                         input ipcSubject      as character,
                                         input ipcBody         as character ):
        &IF opsys = "WIN32" &THEN
        define variable msg                  as MailMessage         no-undo.
        define variable vSmtpClient          as SmtpClient          no-undo.
        define variable vServicePointManager as ServicePointManager no-undo.
        define variable toEmail              as MailAddress         no-undo.
        define variable fromEmail            as MailAddress         no-undo.
        define variable cEmail               as character           no-undo.
        define variable iIndex               as integer             no-undo.
       
        msg = new MailMessage().
               
        if StringUtil:IsNotEmpty(ipcFromEmail) then 
        do:
            assign
                fromEmail      = new MailAddress(ipcFromEmail, ipcFromUserName)
                msg:From       = fromEmail
                msg:Subject    = ipcSubject
                msg:Body       = ipcBody
                msg:IsBodyHtml = true.
            
            do iIndex = 1 to num-entries(ipcToEmails, ","):
                assign 
                    cEmail  = entry(iIndex,ipcToEmails, ",")
                    toEmail = new MailAddress(cEmail, cEmail).
                
                msg:To:Add(toEmail).
            end.
            
            assign 
                vSmtpClient                       = new SmtpClient()
                vSmtpclient:UseDefaultCredentials = false
                vSmtpclient:Credentials           = new System.Net.NetworkCredential(os-getenv("SMTP_USER"), os-getenv("SMTP_PASSWORD"))
                vSmtpclient:Port                  = integer(os-getenv("SMTP_PORT"))
                vSmtpclient:Host                  = os-getenv("SMTP_HOST")
                vSmtpclient:DeliveryMethod        = SmtpDeliveryMethod:Network
                vSmtpclient:EnableSsl             = true.
            
            ServicePointManager:SecurityProtocol = SecurityProtocolType:Tls12.

            vSmtpclient:send(msg).
        end.
        else 
            message substitute("SendEmailWindows: Email could not be sent, user's email is empty").
            
        finally:
            delete object msg no-error.
            delete object vSmtpClient no-error.
            delete object vServicePointManager no-error.
            delete object toEmail no-error.
            delete object fromEmail no-error.
        end finally.
        &ENDIF   
        
    end method.
    
end class.
