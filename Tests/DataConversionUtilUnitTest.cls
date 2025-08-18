/*------------------------------------------------------------------------
   File        : DataConversionUtilUnitTest
   Purpose     : Unit Test class for DataConversionUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Thu Oct 21 18:29:57 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using OpenEdge.Core.Session.
using oeessentials.DataConversionUtil.

class Tests.DataConversionUtilUnitTest: 

    /*------------------------------------------------------------------------------
        Purpose: Saves current session settings and applies test-specific settings.
    ------------------------------------------------------------------------------*/
    method private character SaveAndApplySessionSettings( input ipcDateFormat as character,
                                                          input ipcNumericSeparator as character,
                                                          input ipcDecimalPoint as character ):
        define variable cOriginalSession as character no-undo.

        cOriginalSession = substitute("&1|&2|&3", session:date-format, session:numeric-separator, session:numeric-decimal-point).

        assign
            session:date-format           = ipcDateFormat
            session:numeric-separator     = ipcNumericSeparator
            session:numeric-decimal-point = ipcDecimalPoint.

        return cOriginalSession.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Restores the original session settings.
    ------------------------------------------------------------------------------*/
    method private void RestoreSessionSettings( input ipcOriginalSession as character ):
        define variable iSettingsCount    as integer   no-undo.
        define variable cDateFormat       as character no-undo.
        define variable cNumericSeparator as character no-undo.
        define variable cDecimalPoint     as character no-undo.

        iSettingsCount = num-entries(ipcOriginalSession, "|").
        if iSettingsCount >= 1 then cDateFormat = entry(1, ipcOriginalSession, "|").
        if iSettingsCount >= 2 then cNumericSeparator = entry(2, ipcOriginalSession, "|").
        if iSettingsCount >= 3 then cDecimalPoint = entry(3, ipcOriginalSession, "|").

        assign
            session:date-format           = cDateFormat
            session:numeric-separator     = cNumericSeparator
            session:numeric-decimal-point = cDecimalPoint.
            
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the DateTimeToString method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestDateTimeToString(  ):
        define variable cOriginalSession as character no-undo.
        define variable cResult          as character no-undo.
        define variable dtValue          as datetime  no-undo.

        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", ".").

        do on error undo, throw:
            dtValue = datetime("10/22/2024 10:00:00").
            cResult = DataConversionUtil:DateTimeToString(dtValue).
            Assert:Equals(cResult, substitute("10/22/2024 10:00:00&1000", session:numeric-decimal-point)).
        end.

        this-object:RestoreSessionSettings(cOriginalSession).
        
    end method.
    
    /*------------------------------------------------------------------------------ 
        Purpose: Test the DateTimeTzToString method for correct conversion. 
    ------------------------------------------------------------------------------*/ 
    @Test. 
    method public void TestDateTimeTzToString(  ): 
        define variable cOriginalSession as character   no-undo. 
        define variable cResult          as character   no-undo. 
        define variable dtzValue         as datetime-tz no-undo. 

        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", "."). 

        do on error undo, throw: 
            dtzValue = datetime-tz("10/22/2024 10:00:00-05:00"). 
            cResult = DataConversionUtil:DateTimeTzToString(dtzValue). 
            Assert:Equals(cResult, substitute("10/22/2024 10:00:00&1000-05:00", session:numeric-decimal-point)). 
        end. 

        this-object:RestoreSessionSettings(cOriginalSession). 
        
    end method.

    /*------------------------------------------------------------------------------ 
        Purpose: Test the DateToISOString method for correct ISO format conversion. 
    ------------------------------------------------------------------------------*/ 
    @Test. 
    method public void TestDateToISOString(  ): 
        define variable cOriginalSession as character no-undo. 
        define variable cResult          as character no-undo. 
        define variable dValue           as date      no-undo. 

        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", "."). 

        do on error undo, throw: 
            dValue = date("10/22/2024"). 
            cResult = DataConversionUtil:DateToISOString(dValue). 
            Assert:IsTrue(cResult = "2024-10-22", "DateToISOString should return '2024-10-22'"). 
        end. 

        this-object:RestoreSessionSettings(cOriginalSession). 
        
    end method. 

    /*------------------------------------------------------------------------------
        Purpose: Test the DateToString method for correct date conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestDateToString(  ):
        define variable cOriginalSession as character no-undo. 
        define variable cResult          as character no-undo.
        define variable dValue           as date      no-undo.
        
        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", "."). 
        
        dValue = date("10/22/2024").
        
        do on error undo, throw: 
            cResult = DataConversionUtil:DateToString(dValue).
            Assert:IsTrue(cResult = "10/22/24", "DateToString should return '10/22/24'").
        end. 
        
        this-object:RestoreSessionSettings(cOriginalSession). 
        
    end method.

    /*------------------------------------------------------------------------------ 
        Purpose: Test the DecimalToString method for correct decimal conversion. 
    ------------------------------------------------------------------------------*/ 
    @Test. 
    method public void TestDecimalToString(  ): 
        define variable cOriginalSession as character no-undo. 
        define variable cResult          as character no-undo. 
        define variable deValue          as decimal   no-undo. 

        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", "."). 

        do on error undo, throw: 
            deValue = 12345.67. 
            cResult = DataConversionUtil:DecimalToString(deValue). 
            Assert:Equals(cResult, substitute("12345&167", session:numeric-decimal-point)). 
        end. 

        this-object:RestoreSessionSettings(cOriginalSession). 
        
    end method.

    /*------------------------------------------------------------------------------ 
        Purpose: Test the FormatDate method for correct formatting. 
    ------------------------------------------------------------------------------*/ 
    @Test. 
    method public void TestFormatDate(  ): 
        define variable cOriginalSession as character no-undo. 
        define variable cResult          as character no-undo. 
        define variable dValue           as date      no-undo. 

        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", "."). 

        do on error undo, throw: 
            dValue = date("10/22/2024"). 

            cResult = DataConversionUtil:FormatDate(dValue, "DD/MM/YYYY"). 
            Assert:IsTrue(cResult = "22/10/2024", "FormatDate should return '22/10/2024'"). 

            cResult = DataConversionUtil:FormatDate(dValue, "YYYY-MM-DD"). 
            Assert:IsTrue(cResult = "2024-10-22", "FormatDate should return '2024-10-22'"). 

            cResult = DataConversionUtil:FormatDate(dValue, "MM/DD/YYYY"). 
            Assert:IsTrue(cResult = "10/22/2024", "FormatDate should return '10/22/2024'"). 

            cResult = DataConversionUtil:FormatDate(dValue, "YYYY/MM/DD"). 
            Assert:IsTrue(cResult = "2024/10/22", "FormatDate should return '2024/10/22'"). 
        end. 

        this-object:RestoreSessionSettings(cOriginalSession). 
        
    end method.

    /*------------------------------------------------------------------------------ 
        Purpose: Test the FormatDateTime method for correct formatting. 
    ------------------------------------------------------------------------------*/ 
    @Test. 
    method public void TestFormatDateTime(  ): 
        define variable cOriginalSession as character no-undo. 
        define variable cResult          as character no-undo. 
        define variable dtValue          as datetime  no-undo. 

        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", "."). 

        do on error undo, throw: 
            dtValue = datetime(10, 22, 2024, 14, 35, 45). 

            cResult = DataConversionUtil:FormatDateTime(dtValue, "YYYY-MM-DD HH:MI:SS"). 
            Assert:IsTrue(cResult = "2024-10-22 14:35:45", "FormatDateTime should return '2024-10-22 14:35:45'"). 

            cResult = DataConversionUtil:FormatDateTime(dtValue, "DD/MM/YYYY HH:MI"). 
            Assert:IsTrue(cResult = "22/10/2024 14:35", "FormatDateTime should return '22/10/2024 14:35'"). 
        end. 

        this-object:RestoreSessionSettings(cOriginalSession). 
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the FormatDateTimeTz method for correct formatting.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestFormatDateTimeTz(  ):
        define variable cOriginalSession as character   no-undo.
        define variable cResult          as character   no-undo.
        define variable dtzValueTz       as datetime-tz no-undo.

        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", ".").

        do on error undo, throw:
            dtzValueTz = datetime-tz("10/22/24 14:35:45.000 -05:00").

            cResult = DataConversionUtil:FormatDateTimeTz(dtzValueTz, "YYYY-MM-DDTHH:MI:SSTZ").
            Assert:IsTrue(cResult = "2024-10-22T14:35:45-05:00", "FormatDateTimeTz should return '2024-10-22T14:35:45-05:00'").

            cResult = DataConversionUtil:FormatDateTimeTz(dtzValueTz, "DD/MM/YYYY HH:MI TZ").
            Assert:IsTrue(cResult = "22/10/2024 14:35 -05:00", "FormatDateTimeTz should return '22/10/2024 14:35 -05:00'").
        end.

        this-object:RestoreSessionSettings(cOriginalSession).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the Int64ToString method for correct INT64 conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestInt64ToString():
        define variable cResult  as character no-undo.
        define variable i64Value as int64     no-undo.
        
        i64Value = 9223372036854775807.

        cResult = DataConversionUtil:Int64ToString(i64Value).
        Assert:IsTrue(cResult = "9223372036854775807", "Int64ToString should return '9223372036854775807'").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IntegerToString method for correct INTEGER conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIntegerToString():
        define variable cResult as character no-undo.
        define variable iValue  as integer   no-undo.
        
        iValue = 12345.

        cResult = DataConversionUtil:IntegerToString(iValue).
        Assert:IsTrue(cResult = "12345", "IntegerToString should return '12345'").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the LogicalToString method for "TRUE"/"FALSE" conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLogicalToStringTrueFalse():
        define variable cResult as character no-undo.

        cResult = DataConversionUtil:LogicalToString(true, false).
        Assert:IsTrue(cResult = "TRUE", "LogicalToString should return 'TRUE' for true value").

        cResult = DataConversionUtil:LogicalToString(false, false).
        Assert:IsTrue(cResult = "FALSE", "LogicalToString should return 'FALSE' for false value").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the LogicalToString method for "1"/"0" conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLogicalToStringNumeric():
        define variable cResult as character no-undo.

        cResult = DataConversionUtil:LogicalToString(true, true).
        Assert:IsTrue(cResult = "1", "LogicalToString should return '1' for true value in numeric format").

        cResult = DataConversionUtil:LogicalToString(false, true).
        Assert:IsTrue(cResult = "0", "LogicalToString should return '0' for false value in numeric format").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the StringToDate method for correct string-to-date conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestStringToDate():
        define variable cOriginalSession as character no-undo.
        define variable dResult          as date      no-undo.
        
        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", ".").
        
        do on error undo, throw:
            dResult = DataConversionUtil:StringToDate("10/22/2024").
            Assert:IsTrue(dResult = date("10/22/2024"), "StringToDate should return the correct date").
        end.
         
        this-object:RestoreSessionSettings(cOriginalSession).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the StringToDateTime method for correct string-to-datetime conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestStringToDateTime():
        define variable cOriginalSession as character no-undo.
        define variable dtResult         as datetime  no-undo.
        
        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", ".").
        
        do on error undo, throw:
            dtResult = DataConversionUtil:StringToDateTime("10/22/2024 10:00:00").
            Assert:IsTrue(dtResult = datetime("10/22/2024 10:00:00"), "StringToDateTime should return the correct datetime").
        end.
         
        this-object:RestoreSessionSettings(cOriginalSession).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the StringToDateTimeTz method for correct string-to-datetimetz conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestStringToDateTimeTz():
        define variable cOriginalSession as character   no-undo.
        define variable dtzResult        as datetime-tz no-undo.
        
        cOriginalSession = this-object:SaveAndApplySessionSettings("mdy", ",", ".").
        
        do on error undo, throw:
            dtzResult = DataConversionUtil:StringToDateTimeTz("10/22/2024 10:00:00-05:00").
            Assert:IsTrue(dtzResult = datetime-tz("10/22/2024 10:00:00-05:00"), "StringToDateTimeTz should return the correct datetime-tz").
        end.
         
        this-object:RestoreSessionSettings(cOriginalSession).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the StringToDecimal method for correct string-to-decimal conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestStringToDecimal():
        define variable deResult as decimal no-undo.
        
        deResult = DataConversionUtil:StringToDecimal(substitute("12345&167", session:numeric-decimal-point)).
        Assert:Equals(deResult, decimal(substitute("12345&167", session:numeric-decimal-point))).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the StringToInt64 method for correct string-to-INT64 conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestStringToInt64():
        define variable i64Result as int64 no-undo.
        
        i64Result = DataConversionUtil:StringToInt64("9223372036854775807").
        Assert:IsTrue(i64Result = 9223372036854775807, "StringToInt64 should return the correct INT64 value").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the StringToInteger method for correct string-to-integer conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestStringToInteger():
        define variable iResult as integer no-undo.
        
        iResult = DataConversionUtil:StringToInteger("12345").
        Assert:IsTrue(iResult = 12345, "StringToInteger should return the correct integer value").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the StringToLogical method for string-to-logical conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestStringToLogical():
        define variable lResult as logical no-undo.

        lResult = DataConversionUtil:StringToLogical("TRUE").
        Assert:IsTrue(lResult = true, "StringToLogical should return TRUE for 'TRUE'").

        lResult = DataConversionUtil:StringToLogical("FALSE").
        Assert:IsTrue(lResult = false, "StringToLogical should return FALSE for 'FALSE'").

        lResult = DataConversionUtil:StringToLogical("1").
        Assert:IsTrue(lResult = true, "StringToLogical should return TRUE for '1'").

        lResult = DataConversionUtil:StringToLogical("0").
        Assert:IsTrue(lResult = false, "StringToLogical should return FALSE for '0'").
        
    end method.

end class.
