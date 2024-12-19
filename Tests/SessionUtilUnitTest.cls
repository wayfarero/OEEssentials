/*------------------------------------------------------------------------
   File        : SessionUtilUnitTest
   Purpose     : Unit Test class for SessionUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Tue Nov 05 16:34:20 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using OpenEdge.Core.Session.
using Utils.SessionUtil.

class Tests.SessionUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetDateFormat method for correct retrieval of session date format
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetDateFormat():
        define variable cDateFormat as character no-undo.

        cDateFormat = SessionUtil:GetDateFormat().
        Assert:Equals(session:date-format, cDateFormat).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test SetDateFormat method for correct setting of session date format
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSetDateFormat():
        define variable cOriginalFormat as character no-undo.
        define variable cTestFormat     as character no-undo.

        cOriginalFormat = session:date-format.
        cTestFormat = "dmy".

        SessionUtil:SetDateFormat(cTestFormat).
        Assert:Equals(cTestFormat, session:date-format).

        session:date-format = cOriginalFormat.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetNumericSeparator method for correct retrieval of numeric separator
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetNumericSeparator():
        define variable cSeparator as character no-undo.

        cSeparator = SessionUtil:GetNumericSeparator().
        Assert:Equals(session:numeric-separator, cSeparator).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetNumericDecimalPoint method for correct retrieval of numeric decimal point
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetNumericDecimalPoint():
        define variable cDecimalPoint as character no-undo.

        cDecimalPoint = SessionUtil:GetNumericDecimalPoint().
        Assert:Equals(session:numeric-decimal-point, cDecimalPoint).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetNumericFormat method for correct retrieval of numeric format
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetNumericFormat():
        define variable cNumericFormat as character no-undo.

        cNumericFormat = SessionUtil:GetNumericFormat().
        Assert:Equals(session:numeric-format, cNumericFormat).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test SetNumericFormat method for correct setting of numeric format
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSetNumericFormat():
        define variable cOriginalFormat as character no-undo.
        define variable cTestFormat     as character no-undo.

        cOriginalFormat = session:numeric-format.
        cTestFormat = "European".

        SessionUtil:SetNumericFormat(cTestFormat).
        Assert:Equals(cTestFormat, session:numeric-format).

        session:numeric-format = cOriginalFormat.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetStartupParameters method for correct retrieval of startup parameters
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetStartupParameters():
        define variable cStartupParameters as character no-undo.

        cStartupParameters = SessionUtil:GetStartupParameters().
        Assert:Equals(session:startup-parameters, cStartupParameters).
        
    end method.
    
end class.
