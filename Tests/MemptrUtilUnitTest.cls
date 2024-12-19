/*------------------------------------------------------------------------
   File        : MemptrUtilUnitTest
   Purpose     : Unit Test class for MemptrUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Mon Nov 25 15:51:46 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.MemptrUtil.

class Tests.MemptrUtilUnitTest:

    /*------------------------------------------------------------------------------
        Purpose: Test IsNull() for a null memptr
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNull():
        define variable mptrPointer as memptr no-undo.
        
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer), "Expected IsNull() to return TRUE for a null memptr").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test IsNotNull() for a non-null memptr
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsNotNull():
        define variable mptrPointer as memptr no-undo.

        MemptrUtil:AllocateMemory(mptrPointer, 10).
        Assert:IsTrue(MemptrUtil:IsNotNull(mptrPointer), "Expected IsNotNull() to return TRUE for a non-null memptr").

        MemptrUtil:FreeMemory(mptrPointer).
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer), "Expected memptr to be null after FreeMemory()").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test AllocateMemory() for memory allocation
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAllocateMemory():
        define variable mptrPointer as memptr no-undo.

        MemptrUtil:AllocateMemory(mptrPointer, 20).
        Assert:Equals(20, MemptrUtil:GetSize(mptrPointer)).

        MemptrUtil:FreeMemory(mptrPointer).
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer), "Expected memptr to be null after FreeMemory()").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test FreeMemory() for freeing allocated memory
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestFreeMemory():
        define variable mptrPointer as memptr no-undo.

        MemptrUtil:AllocateMemory(mptrPointer, 15).
        MemptrUtil:FreeMemory(mptrPointer).
        
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer), "Expected memptr to be null after FreeMemory()").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test CopyMemory() for copying data between memptrs
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCopyMemory():
        define variable mptrSource as memptr no-undo.
        define variable mptrTarget as memptr no-undo.

        MemptrUtil:AllocateMemory(mptrSource, 10).
        MemptrUtil:AllocateMemory(mptrTarget, 10).

        put-byte(mptrSource, 1) = 65.
        put-byte(mptrSource, 2) = 66.

        MemptrUtil:CopyMemory(mptrSource, mptrTarget, 10).

        Assert:Equals(get-byte(mptrTarget, 1), 65).
        Assert:Equals(get-byte(mptrTarget, 2), 66).

        MemptrUtil:FreeMemory(mptrSource).
        MemptrUtil:FreeMemory(mptrTarget).
        
        Assert:IsTrue(MemptrUtil:IsNull(mptrSource), "Expected memptr to be null after FreeMemory()").
        Assert:IsTrue(MemptrUtil:IsNull(mptrTarget), "Expected memptr to be null after FreeMemory()").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test CopyMemory() failure case with insufficient memory
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCopyMemoryFailure():
        define variable mptrSource as memptr no-undo.
        define variable mptrTarget as memptr no-undo.

        MemptrUtil:AllocateMemory(mptrSource, 5).
        MemptrUtil:AllocateMemory(mptrTarget, 3).

        MemptrUtil:CopyMemory(mptrSource, mptrTarget, 5).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.AppError:
            Assert:Equals(err:GetMessage(1), "Insufficient memory size for copy.").
        end catch.
        
        finally:
            MemptrUtil:FreeMemory(mptrSource).
            MemptrUtil:FreeMemory(mptrTarget).
            
            Assert:IsTrue(MemptrUtil:IsNull(mptrSource), "Expected memptr to be null after FreeMemory()").
            Assert:IsTrue(MemptrUtil:IsNull(mptrTarget), "Expected memptr to be null after FreeMemory()").
        end finally.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test CompareMemory() for identical memptrs
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCompareMemorySuccess():
        define variable mptrPointer1 as memptr no-undo.
        define variable mptrPointer2 as memptr no-undo.

        MemptrUtil:AllocateMemory(mptrPointer1, 10).
        MemptrUtil:AllocateMemory(mptrPointer2, 10).

        put-byte(mptrPointer1, 1) = 42.
        put-byte(mptrPointer2, 1) = 42.

        Assert:IsTrue(MemptrUtil:CompareMemory(mptrPointer1, mptrPointer2, 10), "Expected memptrs to be identical").

        MemptrUtil:FreeMemory(mptrPointer1).
        MemptrUtil:FreeMemory(mptrPointer2).
        
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer1), "Expected memptr to be null after FreeMemory()").
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer2), "Expected memptr to be null after FreeMemory()").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test CompareMemory() for non-identical memptrs
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCompareMemoryFailure():
        define variable mptrPointer1 as memptr no-undo.
        define variable mptrPointer2 as memptr no-undo.

        MemptrUtil:AllocateMemory(mptrPointer1, 10).
        MemptrUtil:AllocateMemory(mptrPointer2, 10).

        put-byte(mptrPointer1, 1) = 42.
        put-byte(mptrPointer2, 1) = 43.

        Assert:IsFalse(MemptrUtil:CompareMemory(mptrPointer1, mptrPointer2, 10), "Expected memptrs to be different").

        MemptrUtil:FreeMemory(mptrPointer1).
        MemptrUtil:FreeMemory(mptrPointer2).
        
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer1), "Expected memptr to be null after FreeMemory()").
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer2), "Expected memptr to be null after FreeMemory()").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test ToString() for converting memptr to string
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestToString():
        define variable mptrPointer as memptr    no-undo.
        define variable cResult     as character no-undo.

        MemptrUtil:AllocateMemory(mptrPointer, 3).

        put-byte(mptrPointer, 1) = asc("A").
        put-byte(mptrPointer, 2) = asc("B").
        put-byte(mptrPointer, 3) = asc("C").

        cResult = MemptrUtil:ToString(mptrPointer).
        Assert:Equals(cResult, "ABC").

        MemptrUtil:FreeMemory(mptrPointer).
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer), "Expected memptr to be null after FreeMemory()").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test FromString() for converting string to memptr
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestFromString():
        define variable mptrPointer as memptr no-undo.

        MemptrUtil:FromString("Hello", mptrPointer).

        Assert:Equals(get-byte(mptrPointer, 1), asc("H")).
        Assert:Equals(get-byte(mptrPointer, 2), asc("e")).

        MemptrUtil:FreeMemory(mptrPointer).
        Assert:IsTrue(MemptrUtil:IsNull(mptrPointer), "Expected memptr to be null after FreeMemory()").
        
    end method.

end class.
