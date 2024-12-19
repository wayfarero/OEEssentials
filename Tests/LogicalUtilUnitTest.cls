 /*------------------------------------------------------------------------
    File        : LogicalUtilUnitTest
    Purpose     : Unit test class for LogicalUtil
    Syntax      : 
    Description : 
    Author(s)   : Wayfare
    Created     : Tue Nov 26 12:21:50 EET 2024
    Notes       : 
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.LogicalUtil.

class Tests.LogicalUtilUnitTest:

    /*------------------------------------------------------------------------------
        Purpose: Test IsNull method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNull():
        
        Assert:IsTrue(LogicalUtil:IsNull(?), "IsNull should return TRUE for null value").
        Assert:IsFalse(LogicalUtil:IsNull(true), "IsNull should return FALSE for TRUE").
        Assert:IsFalse(LogicalUtil:IsNull(false), "IsNull should return FALSE for FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test IsNotNull method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNull():
        
        Assert:IsTrue(LogicalUtil:IsNotNull(true), "IsNotNull should return TRUE for TRUE").
        Assert:IsTrue(LogicalUtil:IsNotNull(false), "IsNotNull should return TRUE for FALSE").
        Assert:IsFalse(LogicalUtil:IsNotNull(?), "IsNotNull should return FALSE for null value").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test ToString method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestToString():
        
        Assert:Equals("TRUE", LogicalUtil:ToString(true)).
        Assert:Equals("FALSE", LogicalUtil:ToString(false)).
        Assert:Equals("NULL", LogicalUtil:ToString(?)).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test LogicalAnd method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLogicalAnd():
        
        Assert:IsTrue(LogicalUtil:LogicalAnd(true, true), "LogicalAnd should return TRUE for TRUE AND TRUE").
        Assert:IsFalse(LogicalUtil:LogicalAnd(true, false), "LogicalAnd should return FALSE for TRUE AND FALSE").
        Assert:IsFalse(LogicalUtil:LogicalAnd(false, false), "LogicalAnd should return FALSE for FALSE AND FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test LogicalOr method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLogicalOr():
        
        Assert:IsTrue(LogicalUtil:LogicalOr(true, false), "LogicalOr should return TRUE for TRUE OR FALSE").
        Assert:IsTrue(LogicalUtil:LogicalOr(false, true), "LogicalOr should return TRUE for FALSE OR TRUE").
        Assert:IsFalse(LogicalUtil:LogicalOr(false, false), "LogicalOr should return FALSE for FALSE OR FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test LogicalXor method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLogicalXor():
        
        Assert:IsTrue(LogicalUtil:LogicalXor(true, false), "LogicalXor should return TRUE for TRUE XOR FALSE").
        Assert:IsTrue(LogicalUtil:LogicalXor(false, true), "LogicalXor should return TRUE for FALSE XOR TRUE").
        Assert:IsFalse(LogicalUtil:LogicalXor(true, true), "LogicalXor should return FALSE for TRUE XOR TRUE").
        Assert:IsFalse(LogicalUtil:LogicalXor(false, false), "LogicalXor should return FALSE for FALSE XOR FALSE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test LogicalNot method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLogicalNot():
        
        Assert:IsTrue(LogicalUtil:LogicalNot(false), "LogicalNot should return TRUE for NOT FALSE").
        Assert:IsFalse(LogicalUtil:LogicalNot(true), "LogicalNot should return FALSE for NOT TRUE").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test IsTrue method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsTrue():
        
        Assert:IsTrue(LogicalUtil:IsTrue(true), "IsTrue should return TRUE for TRUE").
        Assert:IsFalse(LogicalUtil:IsTrue(false), "IsTrue should return FALSE for FALSE").
        Assert:IsFalse(LogicalUtil:IsTrue(?), "IsTrue should return FALSE for null value").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test IsFalse method for logical values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsFalse():
        
        Assert:IsTrue(LogicalUtil:IsFalse(false), "IsFalse should return TRUE for FALSE").
        Assert:IsFalse(LogicalUtil:IsFalse(true), "IsFalse should return FALSE for TRUE").
        Assert:IsFalse(LogicalUtil:IsFalse(?), "IsFalse should return FALSE for null value").
        
    end method.

end class.
