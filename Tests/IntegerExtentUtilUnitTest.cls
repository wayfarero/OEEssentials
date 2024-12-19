/*------------------------------------------------------------------------
   File        : IntegerExtentUtilUnitTest
   Purpose     : Unit test class for IntegerExtentUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Oct 23 16:22:31 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.IntegerExtentUtil.

class Tests.IntegerExtentUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to a determinate array
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementDeterminateArrayWrongPosition():
        define variable ieArray as integer extent initial [1, 2, 3, 4, 5] no-undo.

        IntegerExtentUtil:AddElement(ieArray, 0, 100).
        
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
        define variable ieArray as integer extent initial [1, 2, 3, 4, 5] no-undo.

        ieArray = IntegerExtentUtil:AddElement(ieArray, 1, 100).
        Assert:Equals(ieArray[1], 100).
        Assert:Equals(extent(ieArray), 5).

        ieArray = IntegerExtentUtil:AddElement(ieArray, 3, 100).
        Assert:Equals(ieArray[3], 100).
        Assert:Equals(extent(ieArray), 5).

        ieArray = IntegerExtentUtil:AddElement(ieArray, 5, 100).
        Assert:Equals(ieArray[5], 100).
        Assert:Equals(extent(ieArray), 5).
        
    end method.

    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to an indeterminate array
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementIndeterminateArrayWrongPosition():
        define variable ieArray as integer extent no-undo.
        
        extent (ieArray) = 5.
        
        IntegerExtentUtil:AddElement(ieArray, 0, 100).
     
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
        define variable ieArray         as integer extent no-undo.
        define variable ieArrayNoExtent as integer extent no-undo. 
        
        extent (ieArray) = 5.
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 1, 100).
        Assert:Equals(ieArray[1], 100).
        Assert:Equals(extent(ieArray), 5).
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 3, 100).
        Assert:Equals(ieArray[3], 100).
        Assert:Equals(extent(ieArray), 5).
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 5, 100).
        Assert:Equals(ieArray[5], 100).
        Assert:Equals(extent(ieArray), 5).
        
        extent (ieArray) = 7.
        ieArray[7] = 107.
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 7, 100).
        Assert:Equals(ieArray[7], 100).
        Assert:Equals(extent(ieArray), 7).
        
        IntegerExtentUtil:AddElement(ieArrayNoExtent, 0, 100).
        
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
        define variable ieArray as integer extent initial [1, 2, 3, 4, 5] no-undo. 
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 100).
        Assert:Equals(ieArray[5], 100).
        Assert:Equals(extent(ieArray), 5).
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 101).
        Assert:Equals(ieArray[5], 101).
        Assert:Equals(extent(ieArray), 5).
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 102).
        Assert:Equals(ieArray[5], 102).
        Assert:Equals(extent(ieArray), 5).
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 112).
        Assert:Equals(ieArray[5], 112).
        Assert:Equals(ieArray[1], 1).
        Assert:Equals(extent(ieArray), 5).
        
    end method.
    
    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to an indeterminate array in the last position
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementInLastPositionIndeterminateArray():
        define variable ieArray as integer extent no-undo.
        
        extent (ieArray) = 9.
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 100).
        Assert:Equals(ieArray[9], 100).
        Assert:Equals(extent(ieArray), 9).
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 101).
        Assert:Equals(ieArray[9], 101).
        Assert:Equals(extent(ieArray), 9).
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 102).
        Assert:Equals(ieArray[9], 102).
        Assert:Equals(extent(ieArray), 9).
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 112).
        Assert:Equals(ieArray[9], 112).
        Assert:Equals(ieArray[3], 0).
        Assert:Equals(extent(ieArray), 9).
        
        extent (ieArray) = 12.
        ieArray[12] = 112.
        
        ieArray = IntegerExtentUtil:AddElement(ieArray, 103).
        Assert:Equals(ieArray[12], 103).
        Assert:Equals(extent(ieArray), 12).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetFirstElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstElement():
        define variable ieArray         as integer extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable ieArrayNoExtent as integer extent no-undo.
       
        Assert:Equals(IntegerExtentUtil:GetFirstElement(ieArray), 1).
        
        IntegerExtentUtil:GetFirstElement(ieArrayNoExtent).
        
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
        define variable ieArray         as integer extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable ieArrayNoExtent as integer extent no-undo. 
       
        Assert:Equals(IntegerExtentUtil:GetLastElement(ieArray), 5).
        
        IntegerExtentUtil:GetLastElement(ieArrayNoExtent).
        
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
        define variable ieArray         as integer extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable ieArrayNoExtent as integer extent no-undo. 
        
        ieArray = IntegerExtentUtil:RemoveFirstElement(ieArray).
        Assert:Equals(ieArray[1], 2).
        
        IntegerExtentUtil:RemoveFirstElement(ieArrayNoExtent).
        
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
        define variable ieArray         as integer extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable ieArrayNoExtent as integer extent no-undo. 
        
        Assert:Equals(IntegerExtentUtil:HasElement(ieArray, 10), false).
        Assert:Equals(IntegerExtentUtil:HasElement(ieArray, 5), true).
        
        IntegerExtentUtil:HasElement(ieArrayNoExtent, 10).
                
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test ListToIntegerExtent method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestListToIntegerExtent():
        define variable ieArray    as integer extent no-undo.
        define variable ieArrayTwo as integer extent no-undo.
        
        ieArray = IntegerExtentUtil:ListToIntegerExtent("1,2,3,4,5", ",").

        Assert:Equals(ieArray[1], 1).
        Assert:Equals(ieArray[3], 3).
        Assert:Equals(ieArray[5], 5).

        ieArrayTwo = IntegerExtentUtil:ListToIntegerExtent("1-2-3-4", "-").

        Assert:Equals(ieArrayTwo[1], 1).
        Assert:Equals(ieArrayTwo[3], 3).
        Assert:Equals(ieArrayTwo[4], 4).
        
        ieArrayTwo = IntegerExtentUtil:ListToIntegerExtent("", ",").
        
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
        define variable ieArray         as integer extent initial [10, 11, 4, 2, 100] no-undo. 
        define variable ieArrayNoExtent as integer extent no-undo. 
       
        Assert:Equals(IntegerExtentUtil:GetMinValue(ieArray), 2).
        
        IntegerExtentUtil:GetMinValue(ieArrayNoExtent).
        
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
        define variable ieArray         as integer extent initial [10, 11, 4, 2, 100] no-undo. 
        define variable ieArrayNoExtent as integer extent no-undo. 
        
        Assert:Equals(IntegerExtentUtil:GetMaxValue(ieArray), 100). 
        
        IntegerExtentUtil:GetMaxValue(ieArrayNoExtent).
        
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
        define variable ieArray         as integer extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable ieArrayNoExtent as integer extent no-undo. 
        
        Assert:Equals(IntegerExtentUtil:GetSum(ieArray), 15). 
        
        IntegerExtentUtil:GetSum(ieArrayNoExtent).
        
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
        define variable ieArray         as integer extent initial [1, 2, 3, 4, 5] no-undo. 
        define variable ieArrayNoExtent as integer extent no-undo. 
      
        Assert:Equals(IntegerExtentUtil:GetAverage(ieArray), 3). 
        
        IntegerExtentUtil:GetAverage(ieArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
end class.
