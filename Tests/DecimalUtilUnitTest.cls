 /*------------------------------------------------------------------------
    File        : DecimalUtilUnitTest
    Purpose     : Unit Test class for DecimalUtil
    Syntax      : 
    Description : 
    Author(s)   : Wayfare
    Created     : Fri Oct 18 13:38:03 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using OpenEdge.Core.Session.
using Utils.DecimalUtil.

class Tests.DecimalUtilUnitTest: 

    /*------------------------------------------------------------------------------
        Purpose: Saves current session settings and applies test-specific settings.
    ------------------------------------------------------------------------------*/
    method private character SaveAndApplySessionSettings(input ipcDecimalPoint as character):
        define variable cOriginalDecimalPoint as character no-undo.

        cOriginalDecimalPoint = session:numeric-decimal-point.

        assign session:numeric-decimal-point = ipcDecimalPoint.

        return cOriginalDecimalPoint.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Restores the original session settings.
    ------------------------------------------------------------------------------*/
    method private void RestoreSessionSettings(input ipcOriginalDecimalPoint as character):
        
        assign session:numeric-decimal-point = ipcOriginalDecimalPoint.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsZero method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsZeroTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsZero(0).
        Assert:IsTrue(lResult, "IsZero(0) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsZero method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsZeroFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsZero(5.5).
        Assert:IsFalse(lResult, "IsZero(5.5) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotZero method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotZeroTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNotZero(5.5).
        Assert:IsTrue(lResult, "IsNotZero(5.5) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotZero method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotZeroFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNotZero(0).
        Assert:IsFalse(lResult, "IsNotZero(0) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNull method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNull(?).
        Assert:IsTrue(lResult, "IsNull(?) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNull method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNull(5.5).
        Assert:IsFalse(lResult, "IsNull(5.5) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotNull method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNotNull(5.5).
        Assert:IsTrue(lResult, "IsNotNull(5.5) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotNull method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNotNull(?).
        Assert:IsFalse(lResult, "IsNotNull(?) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNullOrZero method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullOrZeroTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNullOrZero(?).
        Assert:IsTrue(lResult, "IsNullOrZero(?) should return TRUE").

        lResult = DecimalUtil:IsNullOrZero(0).
        Assert:IsTrue(lResult, "IsNullOrZero(0) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNullOrZero method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullOrZeroFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNullOrZero(5.5).
        Assert:IsFalse(lResult, "IsNullOrZero(5.5) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotNullOrZero method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullOrZeroTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNotNullOrZero(5.5).
        Assert:IsTrue(lResult, "IsNotNullOrZero(5.5) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotNullOrZero method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullOrZeroFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNotNullOrZero(0).
        Assert:IsFalse(lResult, "IsNotNullOrZero(0) should return FALSE").

        lResult = DecimalUtil:IsNotNullOrZero(?).
        Assert:IsFalse(lResult, "IsNotNullOrZero(?) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the RoundDecimal method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRoundDecimalTrue():
        define variable iResult as integer no-undo.

        iResult = DecimalUtil:RoundDecimal(5.6789).
        Assert:IsTrue(iResult = 6, "RoundDecimal(5.6789) should return 6").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the RoundDecimal method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRoundDecimalFalse():
        define variable iResult as integer no-undo.

        iResult = DecimalUtil:RoundDecimal(5.6789).
        Assert:IsFalse(iResult = 5, "RoundDecimal(5.6789) SHOULD NOT RETURN 5").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsPositive method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsPositiveTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsPositive(10).
        Assert:IsTrue(lResult, "IsPositive(10) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsPositive method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsPositiveFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsPositive(-10).
        Assert:IsFalse(lResult, "IsPositive(-10) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNegative method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNegativeTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNegative(-10).
        Assert:IsTrue(lResult, "IsNegative(-10) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNegative method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNegativeFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:IsNegative(10).
        Assert:IsFalse(lResult, "IsNegative(10) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the InRange method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestInRangeTrue():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:InRange(5.5, 1, 10).
        Assert:IsTrue(lResult, "InRange(5.5, 1, 10) should return TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the InRange method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestInRangeFalse():
        define variable lResult as logical no-undo.

        lResult = DecimalUtil:InRange(1.2, 2, 10).
        Assert:IsFalse(lResult, "InRange(1.2, 2, 10) should return FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the Abs method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAbsTrue():
        define variable deResult as decimal no-undo.

        deResult = DecimalUtil:Abs(-10.5).
        Assert:IsTrue(deResult = 10.5, "Abs(-10.5) should return 10.5").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the Abs method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAbsFalse():
        define variable deResult       as decimal no-undo.
        define variable deInputDecimal as decimal no-undo.
        
        deInputDecimal = decimal("10.5").
        deResult = DecimalUtil:Abs(deInputDecimal).
        Assert:IsFalse(deResult = (-1 * deInputDecimal), "Abs(10.5) SHOULD NOT RETURN -10.5").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the ToString method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestToStringTrue():
        define variable cOriginalDecimalPoint as character no-undo.

        cOriginalDecimalPoint = this-object:SaveAndApplySessionSettings(".").

        do on error undo, throw:
            define variable cResult as character no-undo.
            define variable dInputDecimal as decimal no-undo.

            dInputDecimal = decimal(substitute("12345&1678", session:numeric-decimal-point)).
            cResult = DecimalUtil:ToString(dInputDecimal).
            Assert:Equals(cResult, substitute("12345&1678", session:numeric-decimal-point)).
        end.

        this-object:RestoreSessionSettings(cOriginalDecimalPoint).
        
    end method.

end class.
