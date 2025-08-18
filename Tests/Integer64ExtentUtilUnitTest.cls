/*------------------------------------------------------------------------
   File        : Integer64ExtentUtilUnitTest
   Purpose     : Unit test class for Integer64ExtentUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Oct 23 16:22:31 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using oeessentials.Integer64ExtentUtil.

class Tests.Integer64ExtentUtilUnitTest: 
    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method to a determinate array
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementDeterminateArrayWrongPosition():
        define variable i64eArray as int64 extent initial [1, 2, 3, 4, 5] no-undo. 
        
        Integer64ExtentUtil:AddElement(i64eArray, 0, 100).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid position index.", trim(err:GetMessage(1))).
        end catch.  
         
    end method.
    
    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to a determinate array
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementDeterminateArray():
        define variable i64eArray as int64 extent initial [1, 2, 3, 4, 5] no-undo. 
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 1, 100).
        Assert:Equals(i64eArray[1], 100).
        Assert:Equals(extent(i64eArray), 5).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 3, 100).
        Assert:Equals(i64eArray[3], 100).
        Assert:Equals(extent(i64eArray), 5).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 5, 100).
        Assert:Equals(i64eArray[5], 100).
        Assert:Equals(extent(i64eArray), 5).
        
    end method.
  
    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to an indeterminate array
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementIndeterminateArrayWrongPosition():
        define variable i64eArray as int64 extent no-undo.
        
        extent (i64eArray) = 5.
        
        Integer64ExtentUtil:AddElement(i64eArray, 0, 100).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid position index.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.  
    
    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to an indeterminate array
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementIndeterminateArray():
        define variable i64eArray         as int64   extent no-undo.
        define variable i64eArrayNoExtent as integer extent no-undo.
        
        extent (i64eArray) = 5.
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 1, 100).
        Assert:Equals(i64eArray[1], 100).
        Assert:Equals(extent(i64eArray), 5).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 3, 100).
        Assert:Equals(i64eArray[3], 100).
        Assert:Equals(extent(i64eArray), 5).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 5, 100).
        Assert:Equals(i64eArray[5], 100).
        Assert:Equals(extent(i64eArray), 5).
        
        extent (i64eArray) = 7.
        i64eArray[7] = 107.
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 7, 100).
        Assert:Equals(i64eArray[7], 100).
        Assert:Equals(extent(i64eArray), 7).
        
        Integer64ExtentUtil:AddElement(i64eArrayNoExtent, 7, 100).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to a determinate array in the last position
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementInLastPositionDeterminateArray():
        define variable i64eArray as int64 extent initial [1, 2, 3, 4, 5] no-undo. 
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 100).
        Assert:Equals(i64eArray[5], 100).
        Assert:Equals(extent(i64eArray), 5).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 101).
        Assert:Equals(i64eArray[5], 101).
        Assert:Equals(extent(i64eArray), 5).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 102).
        Assert:Equals(i64eArray[5], 102).
        Assert:Equals(extent(i64eArray), 5).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 112).
        Assert:Equals(i64eArray[5], 112).
        Assert:Equals(i64eArray[1], 1).
        Assert:Equals(extent(i64eArray), 5).
        
    end method.
    
    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to an indeterminate array in the last position
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementInLastPositionIndeterminateArray():
        define variable i64eArray as int64 extent no-undo.
        
        extent (i64eArray) = 9.
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 100).
        Assert:Equals(i64eArray[9], 100).
        Assert:Equals(extent(i64eArray), 9).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 101).
        Assert:Equals(i64eArray[9], 101).
        Assert:Equals(extent(i64eArray), 9).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 102).
        Assert:Equals(i64eArray[9], 102).
        Assert:Equals(extent(i64eArray), 9).
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 112).
        Assert:Equals(i64eArray[9], 112).
        Assert:Equals(i64eArray[3], 0).
        Assert:Equals(extent(i64eArray), 9).
        
        extent (i64eArray) = 12.
        i64eArray[12] = 112.
        
        i64eArray = Integer64ExtentUtil:AddElement(i64eArray, 103).
        Assert:Equals(i64eArray[12], 103).
        Assert:Equals(extent(i64eArray), 12).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetFirstElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstElement():
        define variable i64eArray         as int64   extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable i64eArrayNoExtent as integer extent no-undo.
       
        Assert:Equals(Integer64ExtentUtil:GetFirstElement(i64eArray), 1).
        
        Integer64ExtentUtil:GetFirstElement(i64eArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetLastElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetLastElement():
        define variable i64eArray         as int64   extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable i64eArrayNoExtent as integer extent no-undo.
       
        Assert:Equals(Integer64ExtentUtil:GetLastElement(i64eArray), 5).
        
        Integer64ExtentUtil:GetLastElement(i64eArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test RemoveFirstElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveFirstElement():
        define variable i64eArray         as int64   extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable i64eArrayNoExtent as integer extent no-undo.
        
        i64eArray = Integer64ExtentUtil:RemoveFirstElement(i64eArray).
        Assert:Equals(i64eArray[1], 2).
        
        Integer64ExtentUtil:RemoveFirstElement(i64eArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test HasElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasElement():
        define variable i64eArray         as int64   extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable i64eArrayNoExtent as integer extent no-undo.
        
        Assert:Equals(Integer64ExtentUtil:HasElement(i64eArray, 10), false).
        Assert:Equals(Integer64ExtentUtil:HasElement(i64eArray, 5), true).
        
        Integer64ExtentUtil:HasElement(i64eArrayNoExtent, 10).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test ListToInt64Extent method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestListToInt64Extent():
        define variable i64eArray    as int64 extent no-undo.
        define variable i64eArrayTwo as int64 extent no-undo.
        
        i64eArray = Integer64ExtentUtil:ListToInt64Extent("1,2,3,4,5", ",").
        
        Assert:Equals(i64eArray[1], 1).
        Assert:Equals(i64eArray[3], 3).
        Assert:Equals(i64eArray[5], 5).
        
        i64eArrayTwo = Integer64ExtentUtil:ListToInt64Extent("1-2-3-4", "-").

        Assert:Equals(i64eArrayTwo[1], 1).
        Assert:Equals(i64eArrayTwo[3], 3).
        Assert:Equals(i64eArrayTwo[4], 4).
        
        i64eArray = Integer64ExtentUtil:ListToInt64Extent("", ",").
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Initial list is empty.", trim(err:GetMessage(1))).
        end catch.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetMinValue method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetMinValue():
        define variable i64eArray         as int64   extent initial [10, 11, 4, 2, 100] no-undo. 
        define variable i64eArrayNoExtent as integer extent no-undo.
        
        Assert:Equals(Integer64ExtentUtil:GetMinValue(i64eArray), 2).
        
        Integer64ExtentUtil:GetMinValue(i64eArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetMaxValue method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetMaxValue():
        define variable i64eArray         as int64   extent initial [10, 11, 4, 2, 100] no-undo. 
        define variable i64eArrayNoExtent as integer extent no-undo.
        
        Assert:Equals(Integer64ExtentUtil:GetMaxValue(i64eArray), 100). 
        
        Integer64ExtentUtil:GetMaxValue(i64eArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetSum method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetSum():
        define variable i64eArray         as int64   extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable i64eArrayNoExtent as integer extent no-undo.
        
        Assert:Equals(Integer64ExtentUtil:GetSum(i64eArray), 15). 
        
        Integer64ExtentUtil:GetSum(i64eArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetAverage method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetAverage():
        define variable i64eArray         as int64   extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable i64eArrayNoExtent as integer extent no-undo.
        
        Assert:Equals(Integer64ExtentUtil:GetAverage(i64eArray), 3). 
        
        Integer64ExtentUtil:GetAverage(i64eArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
end class.
