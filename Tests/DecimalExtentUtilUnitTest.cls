/*------------------------------------------------------------------------
   File        : IntegerExtentUtilUnitTest
   Purpose     : Unit Test class for DecimalExtentUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Oct 23 16:22:31 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.DecimalExtentUtil.

class Tests.DecimalExtentUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
       Purpose: Test AddElement method to a determinate array 
   ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementDeterminateArrayWrongPosition():
        define variable deeArray as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo. 
        
        DecimalExtentUtil:AddElement(deeArray, 0, 10.12).

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
        define variable deeArray as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo. 
        
        deeArray = DecimalExtentUtil:AddElement(deeArray, 1, 10.12).
        Assert:Equals(deeArray[1], 10.12).
        Assert:Equals(extent(deeArray), 5).

        deeArray = DecimalExtentUtil:AddElement(deeArray, 3, 13.4).
        Assert:Equals(deeArray[3], 13.4).
        Assert:Equals(extent(deeArray), 5).

        deeArray = DecimalExtentUtil:AddElement(deeArray, 5, 20.45).
        Assert:Equals(deeArray[5], 20.45).
        Assert:Equals(extent(deeArray), 5).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method to an indeterminate array 
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementIndeterminateArrayWrongPosition():
        define variable deeArray as decimal extent no-undo. 
        
        extent (deeArray) = 5.
        
        DecimalExtentUtil:AddElement(deeArray, 0, 10.12).

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
        define variable deeArray         as decimal extent no-undo. 
        define variable deeArrayNoExtent as integer extent no-undo. 
        
        extent (deeArray) = 5.
        
        deeArray = DecimalExtentUtil:AddElement(deeArray, 1, 10.12).
        Assert:Equals(deeArray[1], 10.12).
        Assert:Equals(extent(deeArray), 5).

        deeArray = DecimalExtentUtil:AddElement(deeArray, 3, 13.4).
        Assert:Equals(deeArray[3], 13.4).
        Assert:Equals(extent(deeArray), 5).

        deeArray = DecimalExtentUtil:AddElement(deeArray, 5, 20.45).
        Assert:Equals(deeArray[5], 20.45).
        Assert:Equals(extent(deeArray), 5).
        
        extent (deeArray) = 7.
        deeArray[7] = 12.3.
        
        deeArray = DecimalExtentUtil:AddElement(deeArray, 7, 14.12).
        Assert:Equals(deeArray[7], 14.12).
        Assert:Equals(extent(deeArray), 7).
        
        DecimalExtentUtil:AddElement(deeArrayNoExtent, 7, 14.12).
        
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
        define variable deeArray as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo. 
        
        deeArray = DecimalExtentUtil:AddElement(deeArray, 10.12).
        Assert:Equals(deeArray[5], 10.12).
        Assert:Equals(extent(deeArray), 5).

        deeArray = DecimalExtentUtil:AddElement(deeArray, 13.4).
        Assert:Equals(deeArray[5], 13.4).
        Assert:Equals(extent(deeArray), 5).

        deeArray = DecimalExtentUtil:AddElement(deeArray, 20.45).
        Assert:Equals(deeArray[5], 20.45).
        Assert:Equals(extent(deeArray), 5).
        
        deeArray = DecimalExtentUtil:AddElement(deeArray, 256.1).
        Assert:Equals(deeArray[5], 256.1).
        Assert:Equals(deeArray[1], 1.1).
        Assert:Equals(extent(deeArray), 5).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method to an indeterminate array in the last position
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementInLastPositionIndeterminateArray():
        define variable deeArray as decimal extent no-undo. 
        
        extent (deeArray) = 9.
        
        deeArray = DecimalExtentUtil:AddElement(deeArray, 10.12).
        Assert:Equals(deeArray[9], 10.12).
        Assert:Equals(extent(deeArray), 9).

        deeArray = DecimalExtentUtil:AddElement(deeArray, 13.4).
        Assert:Equals(deeArray[9], 13.4).
        Assert:Equals(extent(deeArray), 9).

        deeArray = DecimalExtentUtil:AddElement(deeArray, 20.45).
        Assert:Equals(deeArray[9], 20.45).
        Assert:Equals(extent(deeArray), 9).
        
        deeArray = DecimalExtentUtil:AddElement(deeArray, 112.2).
        Assert:Equals(deeArray[9], 112.2).
        Assert:Equals(deeArray[3], 0).
        Assert:Equals(extent(deeArray), 9).
        
        extent (deeArray) = 12.
        deeArray[12] = 12.3.
        
        deeArray = DecimalExtentUtil:AddElement(deeArray, 14.12).
        Assert:Equals(deeArray[12], 14.12).
        Assert:Equals(extent(deeArray), 12).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetFirstElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstElement():
        define variable deeArray         as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo.
        define variable deeArrayNoExtent as integer extent no-undo. 

        Assert:Equals(DecimalExtentUtil:GetFirstElement(deeArray), 1.1).
        
        DecimalExtentUtil:GetFirstElement(deeArrayNoExtent).
        
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
        define variable deeArray         as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo.  
        define variable deeArrayNoExtent as integer extent no-undo. 
       
        Assert:Equals(DecimalExtentUtil:GetLastElement(deeArray), 5.6).
        
        DecimalExtentUtil:GetLastElement(deeArrayNoExtent).
        
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
        define variable deeArray         as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo.  
        define variable deeArrayNoExtent as integer extent no-undo. 
        
        deeArray = DecimalExtentUtil:RemoveFirstElement(deeArray).
        Assert:Equals(deeArray[1], 2.2).
        
        DecimalExtentUtil:RemoveFirstElement(deeArrayNoExtent).
        
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
        define variable deeArray         as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo.  
        define variable deeArrayNoExtent as integer extent no-undo. 
        
        Assert:Equals(DecimalExtentUtil:HasElement(deeArray, 10.5), false).
        Assert:Equals(DecimalExtentUtil:HasElement(deeArray, 5.6), true).
        
        DecimalExtentUtil:HasElement(deeArrayNoExtent, 5.6).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test ListToDecimalExtent method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestListToDecimalExtent():
        define variable deeArray    as decimal extent no-undo.
        define variable deeArrayTwo as decimal extent no-undo.
        
        deeArray = DecimalExtentUtil:ListToDecimalExtent("1.7,2.8,3.4,4.7,5.9", ",").
        
        Assert:Equals(deeArray[1], decimal("1.7")).
        Assert:Equals(deeArray[3], decimal("3.4")).
        Assert:Equals(deeArray[5], decimal("5.9")).

        deeArrayTwo = DecimalExtentUtil:ListToDecimalExtent("1.91-2.76-3.5-4.3", "-").

        Assert:Equals(deeArrayTwo[1], decimal("1.91")).
        Assert:Equals(deeArrayTwo[3], decimal("3.5")).
        Assert:Equals(deeArrayTwo[4], decimal("4.3")).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetMinValue method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetMinValue():
        define variable deeArray         as decimal extent initial [10.2, 11.7, 4.45, 2.89, 2.88] no-undo. 
        define variable deeArrayNoExtent as integer extent no-undo. 
       
        Assert:Equals(DecimalExtentUtil:GetMinValue(deeArray), 2.88).
        
        DecimalExtentUtil:GetMinValue(deeArrayNoExtent).
        
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
        define variable deeArray         as decimal extent initial [10.2, 11.7, 4.45, 2.89, 2.88] no-undo. 
        define variable deeArrayNoExtent as integer extent no-undo. 
       
        Assert:Equals(DecimalExtentUtil:GetMaxValue(deeArray), 11.7). 
        
        DecimalExtentUtil:GetMaxValue(deeArrayNoExtent).
        
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
        define variable deeArray         as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo.  
        define variable deeArrayNoExtent as integer extent no-undo. 
        
        Assert:Equals(DecimalExtentUtil:GetSum(deeArray), 16.9). 
        
        DecimalExtentUtil:GetSum(deeArrayNoExtent).
        
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
        define variable deeArray         as decimal extent initial [1.1, 2.2, 3.3, 4.7, 5.6] no-undo. 
        define variable deeArrayNoExtent as integer extent no-undo. 
      
        Assert:Equals(DecimalExtentUtil:GetAverage(deeArray), 3.38).
        
        DecimalExtentUtil:GetAverage(deeArrayNoExtent).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.  
        
    end method.
    
end class.
