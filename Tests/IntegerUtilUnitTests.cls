 /*------------------------------------------------------------------------
    File        : IntegerUtilUnitTests
    Purpose     : Unit test class for IntegerUtil
    Syntax      : 
    Description : 
    Author(s)   : Wayfare
    Created     : Thu Oct 17 14:29:57 EEST 2024
    Notes       : 
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.IntegerUtil.

class Tests.IntegerUtilUnitTests: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test the Abs method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAbsTrue():
        define variable iResult as integer no-undo.

        iResult = IntegerUtil:Abs(-10).
        Assert:IsTrue(iResult = 10, "Abs(-10) should return 10").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the Abs method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAbsFalse():
        define variable iResult as integer no-undo.

        iResult = IntegerUtil:Abs(10).
        Assert:IsFalse(iResult = -10, "Abs(10) should not return -10").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the InRange method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestInRangeTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:InRange(5, 1, 10).
        Assert:IsTrue(lResult, "InRange(5, 1, 10) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the InRange method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestInRangeFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:InRange(0, 1, 10).
        Assert:IsFalse(lResult, "InRange(0, 1, 10) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsEven method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsEvenTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsEven(4).
        Assert:IsTrue(lResult, "IsEven(4) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsEven method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsEvenFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsEven(5).
        Assert:IsFalse(lResult, "IsEven(5) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsOdd method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsOddTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsOdd(5).
        Assert:IsTrue(lResult, "IsOdd(5) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsOdd method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsOddFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsOdd(4).
        Assert:IsFalse(lResult, "IsOdd(4) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsPositive method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsPositiveTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsPositive(10).
        Assert:IsTrue(lResult, "IsPositive(10) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsPositive method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsPositiveFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsPositive(-10).
        Assert:IsFalse(lResult, "IsPositive(-10) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNegative method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNegativeTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNegative(-10).
        Assert:IsTrue(lResult, "IsNegative(-10) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNegative method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNegativeFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNegative(10).
        Assert:IsFalse(lResult, "IsNegative(10) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotNull method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNotNull(10).
        Assert:IsTrue(lResult, "IsNotNull(10) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotNull method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNotNull(?).
        Assert:IsFalse(lResult, "IsNotNull(?) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNull method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNull(?).
        Assert:IsTrue(lResult, "IsNull(?) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNull method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNull(10).
        Assert:IsFalse(lResult, "IsNull(10) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotNullOrZero method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullOrZeroTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNotNullOrZero(10).
        Assert:IsTrue(lResult, "IsNotNullOrZero(10) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotNullOrZero method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullOrZeroFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNotNullOrZero(0).
        Assert:IsFalse(lResult, "IsNotNullOrZero(0) should return false").

        lResult = IntegerUtil:IsNotNullOrZero(?).
        Assert:IsFalse(lResult, "IsNotNullOrZero(?) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNullOrZero method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullOrZeroTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNullOrZero(?).
        Assert:IsTrue(lResult, "IsNullOrZero(?) should return true").

        lResult = IntegerUtil:IsNullOrZero(0).
        Assert:IsTrue(lResult, "IsNullOrZero(0) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNullOrZero method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullOrZeroFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNullOrZero(10).
        Assert:IsFalse(lResult, "IsNullOrZero(10) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsZero method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsZeroTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsZero(0).
        Assert:IsTrue(lResult, "IsZero(0) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsZero method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsZeroFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsZero(5).
        Assert:IsFalse(lResult, "IsZero(5) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotZero method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotZeroTrue():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNotZero(5).
        Assert:IsTrue(lResult, "IsNotZero(5) should return true").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the IsNotZero method when the result should be false.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotZeroFalse():
        define variable lResult as logical no-undo.

        lResult = IntegerUtil:IsNotZero(0).
        Assert:IsFalse(lResult, "IsNotZero(0) should return false").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the ToString method when the result should be true.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestToStringTrue():
        define variable cResult as character no-undo.

        cResult = IntegerUtil:ToString(12345).
        Assert:IsTrue(cResult = "12345", "ToString(12345) should return '12345'").
        
    end method.

end class.
