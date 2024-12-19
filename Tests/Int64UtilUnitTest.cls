/*------------------------------------------------------------------------
   File        : Int64UtilUnitTest
   Purpose     : Unit test class for Int64Util
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Fri Nov 22 15:22:05 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.Int64Util.

class Tests.Int64UtilUnitTest: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsZero for int64 values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsZero():
                
        Assert:Equals(Int64Util:IsZero(0), true).
        Assert:Equals(Int64Util:IsZero(10), false).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotZero for int64 values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotZero():
                
        Assert:Equals(Int64Util:IsNotZero(0), false).
        Assert:Equals(Int64Util:IsNotZero(10), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNull for int64 values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNull():
                
        Assert:Equals(Int64Util:IsNull(?), true).
        Assert:Equals(Int64Util:IsNull(10), false).
        
    end method.      
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotNull for int64 values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNull():
                
        Assert:Equals(Int64Util:IsNotNull(?), false).
        Assert:Equals(Int64Util:IsNotNull(10), true).
        
    end method.    
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNullOrZero for int64 values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNullOrZero():
                
        Assert:Equals(Int64Util:IsNullOrZero(?), true).
        Assert:Equals(Int64Util:IsNullOrZero(0), true).
        Assert:Equals(Int64Util:IsNullOrZero(10), false).
        
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotNullOrZero for int64 values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNullOrZero():
                
        Assert:Equals(Int64Util:IsNotNullOrZero(?), false).
        Assert:Equals(Int64Util:IsNotNullOrZero(0), false).
        Assert:Equals(Int64Util:IsNotNullOrZero(10), true).
        
    end method.     
    
    /*------------------------------------------------------------------------------
        Purpose: Test GenerateRandomInt64 for int64 values
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGenerateRandomInt64():
        define variable i64Result as int64   no-undo. 
        
        i64Result = Int64Util:GenerateRandomInt64(3, 33).
        
        Assert:IsTrue(i64Result >= 3).
        Assert:IsTrue(i64Result <= 33).                    
        
    end method.                   
    
    /*------------------------------------------------------------------------------
        Purpose: Test GenerateRandomInt64 for int64 values with incorrect range
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGenerateRandomInt64Failure():
        
        Int64Util:GenerateRandomInt64(12, 1).
                
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.AppError:
            Assert:Equals(err:GetMessage(1), "Incorrect range selected for random number generation.").
        end catch.
        
    end method.                   
    
end class.