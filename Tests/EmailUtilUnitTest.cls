/*------------------------------------------------------------------------
   File        : EmailUtilUnitTest
   Purpose     : Unit Test class for EmailUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Fri Oct 25 13:25:02 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using oeessentials.EmailUtil.

class Tests.EmailUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetDomain with a standard email address
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetDomainStandard():
        define variable cResult as character no-undo.

        cResult = EmailUtil:GetDomain("user@example.com").
        Assert:IsTrue(cResult = "example.com", "Expected domain 'example.com' for 'user@example.com'").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetDomain with an email without '@' symbol
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetDomainWithoutAtSymbol():
        define variable cResult as character no-undo.

        cResult = EmailUtil:GetDomain("userexample.com").
        Assert:IsTrue(cResult = "", "Expected empty string for domain without '@'").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetDomain with an empty string
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetDomainEmpty():
        define variable cResult as character no-undo.

        cResult = EmailUtil:GetDomain("").
        Assert:IsTrue(cResult = "", "Expected empty string for empty email").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetUsername with a standard email address
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetUserNameStandard():
        define variable cResult as character no-undo.

        cResult = EmailUtil:GetUserName("user@example.com").
        Assert:IsTrue(cResult = "user", "Expected username 'user' for 'user@example.com'").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetUsername with an email without '@' symbol
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetUserNameWithoutAtSymbol():
        define variable cResult as character no-undo.

        cResult = EmailUtil:GetUserName("userexample.com").
        Assert:IsTrue(cResult = "", "Expected empty string for username without '@'").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetUserName with an empty string
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetUserNameEmpty():
        define variable cResult as character no-undo.

        cResult = EmailUtil:GetUserName("").
        Assert:IsTrue(cResult = "", "Expected empty string for empty email").

    end method.
    
end class.
