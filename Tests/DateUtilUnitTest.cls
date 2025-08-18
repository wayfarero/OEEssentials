 /*------------------------------------------------------------------------
    File        : DateUtilUnitTest
    Purpose     : Unit Test class for DateUtil
    Syntax      : 
    Description : 
    Author(s)   : Wayfare
    Created     : Tue Oct 22 12:23:48 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using oeessentials.DateUtil.

class Tests.DateUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test the GetISOWeekNumber method.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetISOWeekNumber():
        define variable iResult as integer no-undo.
        
        iResult = DateUtil:GetISOWeekNumber(date(10, 22, 2024)).
        Assert:IsTrue(iResult = 43, "GetISOWeekNumber(10/22/2024) SHOULD RETURN 43").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the GetISOWeekNumber method.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetISOWeekNumber53():
        define variable iResult as integer no-undo.
        
        iResult = DateUtil:GetISOWeekNumber(date(1, 1, 2027)).
        Assert:IsTrue(iResult = 53, "GetISOWeekNumber(1/1/2024) SHOULD RETURN 53").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the GetISOWeekday method for Monday.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetISOWeekdayMonday():
        define variable iResult as integer no-undo.

        iResult = DateUtil:GetISOWeekday(date(10, 21, 2024)).
        Assert:IsTrue(iResult = 1, "GetISOWeekday(10/21/2024) SHOULD RETURN 1 for Monday").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetISOWeekday method for Sunday.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetISOWeekdaySunday():
        define variable iResult as integer no-undo.

        iResult = DateUtil:GetISOWeekday(date(10, 20, 2024)).
        Assert:IsTrue(iResult = 7, "GetISOWeekday(10/20/2024) SHOULD RETURN 7 for Sunday").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetISOWeekday method for Tuesday.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetISOWeekdayTuesday():
        define variable iResult as integer no-undo.

        iResult = DateUtil:GetISOWeekday(date(10, 22, 2024)).
        Assert:IsTrue(iResult = 2, "GetISOWeekday(10/22/2024) SHOULD RETURN 2 for Tuesday").

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the GetFirstDayOfMonth method.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstDayOfMonth():
        define variable dResult as date no-undo.
        
        dResult = DateUtil:GetFirstDayOfMonth(date(10, 15, 2024)).
        Assert:IsTrue(dResult = DATE(10, 1, 2024), "GetFirstDayOfMonth(10/15/2024) SHOULD RETURN 10/1/2024").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetLastDayOfMonth method for a non-leap year February.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetLastDayOfMonthNonLeapYear():
        define variable dResult as date no-undo.
        
        dResult = DateUtil:GetLastDayOfMonth(date(2, 10, 2023)). 
        Assert:IsTrue(dResult = DATE(2, 28, 2023), "GetLastDayOfMonth(2/10/2023) SHOULD RETURN 2/28/2023").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetLastDayOfMonth method for a leap year February.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetLastDayOfMonthLeapYear():
        define variable dResult as date no-undo.
        
        dResult = DateUtil:GetLastDayOfMonth(date(2, 10, 2024)).
        Assert:IsTrue(dResult = DATE(2, 29, 2024), "GetLastDayOfMonth(2/10/2024) SHOULD RETURN 2/29/2024").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetFirstDayOfYear method.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstDayOfYear():
        define variable dResult as date no-undo.
        
        dResult = DateUtil:GetFirstDayOfYear(date(5, 15, 2024)).
        Assert:IsTrue(dResult = DATE(1, 1, 2024), "GetFirstDayOfYear(5/15/2024) SHOULD RETURN 1/1/2024").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetLastDayOfYear method.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetLastDayOfYear():
        define variable dResult as date no-undo.
        
        dResult = DateUtil:GetLastDayOfYear(date(5, 15, 2024)).
        Assert:IsTrue(dResult = DATE(12, 31, 2024), "GetLastDayOfYear(5/15/2024) SHOULD RETURN 12/31/2024").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the GetFirstDayOfYearByYear method.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstDayOfYeaByYearr():
        define variable dResult as date no-undo.
        
        dResult = DateUtil:GetFirstDayOfYearByYear(2024).
        Assert:IsTrue(dResult = DATE(1, 1, 2024), "GetFirstDayOfYearByYear(2024) SHOULD RETURN 1/1/2024").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetLastDayOfYearByYear method.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetLastDayOfYearByYear():
        define variable dResult as date no-undo.
        
        dResult = DateUtil:GetLastDayOfYearByYear(2024).
        Assert:IsTrue(dResult = DATE(12, 31, 2024), "GetLastDayOfYear(2024) SHOULD RETURN 12/31/2024").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the NumDaysInMonth method for a leap year February.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestNumDaysInMonthLeapYear():
        define variable iResult as integer no-undo.
        
        iResult = DateUtil:NumDaysInMonth(2, 2024).
        Assert:IsTrue(iResult = 29, "NumDaysInMonth(2, 2024) SHOULD RETURN 29").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the NumDaysInMonth method for a non-leap year February.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestNumDaysInMonthNonLeapYear():
        define variable iResult as integer no-undo.
        
        iResult = DateUtil:NumDaysInMonth(2, 2023).
        Assert:IsTrue(iResult = 28, "NumDaysInMonth(2, 2023) SHOULD RETURN 28").
        
    end method.
    
end class.
