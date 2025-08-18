/*------------------------------------------------------------------------
   File        : CharacterExtentUtilUnitTest
   Purpose     : Unit test class for CharacterExtentUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Oct 23 16:22:31 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using oeessentials.CharacterExtentUtil.

class Tests.CharacterExtentUtilUnitTest: 

    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method to a determinate array 
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementDeterminateArrayWrongPosition():
        define variable ceArray as character extent initial ["element1", "element2", "element3", "element4", "element5"] no-undo. 
        
        CharacterExtentUtil:AddElement(ceArray, 0, "newElement").
        
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
        define variable ceArray as character extent initial ["element1", "element2", "element3", "element4", "element5"] no-undo. 
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, 1, "newElement").
        Assert:Equals(ceArray[1], "newElement").
        Assert:Equals(extent(ceArray), 5).

        ceArray = CharacterExtentUtil:AddElement(ceArray, 3, "anotherElement").
        Assert:Equals(ceArray[3], "anotherElement").
        Assert:Equals(extent(ceArray), 5).

        ceArray = CharacterExtentUtil:AddElement(ceArray, 5, "anotherElement2").
        Assert:Equals(ceArray[5], "anotherElement2").
        Assert:Equals(extent(ceArray), 5).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method to an indeterminate array 
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementIndeterminateArrayWrongPosition():
        define variable ceArray as character extent no-undo. 
        
        extent (ceArray) = 5.
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, 0, "newElement").
        
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
        define variable ceArray         as character extent no-undo. 
        define variable ceArrayNoExtent as character extent no-undo.
        
        extent (ceArray) = 5.
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, 1, "newElement").
        Assert:Equals(ceArray[1], "newElement").
        Assert:Equals(extent(ceArray), 5).

        ceArray = CharacterExtentUtil:AddElement(ceArray, 3, "anotherElement").
        Assert:Equals(ceArray[3], "anotherElement").
        Assert:Equals(extent(ceArray), 5).

        ceArray = CharacterExtentUtil:AddElement(ceArray, 5, "anotherElement2").
        Assert:Equals(ceArray[5], "anotherElement2").
        Assert:Equals(extent(ceArray), 5).
        
        extent (ceArray) = 7.
        ceArray[7] = "someElement".
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, 7, "anotherElement3").
        Assert:Equals(ceArray[7], "anotherElement3").
        Assert:Equals(extent(ceArray), 7).
        
        CharacterExtentUtil:AddElement(ceArrayNoExtent, 7, "anotherElement3").
        
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
        define variable ceArray as character extent initial ["element1", "element2", "element3", "element4", "element5"] no-undo. 
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, "newElement1").
        Assert:Equals(ceArray[5], "newElement1").
        Assert:Equals(extent(ceArray), 5).

        ceArray = CharacterExtentUtil:AddElement(ceArray, "newElement2").
        Assert:Equals(ceArray[5], "newElement2").
        Assert:Equals(extent(ceArray), 5).
    
        ceArray = CharacterExtentUtil:AddElement(ceArray, "anotherElement").
        Assert:Equals(ceArray[5], "anotherElement").
        Assert:Equals(extent(ceArray), 5).
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, "anotherElement2").
        Assert:Equals(ceArray[5], "anotherElement2").
        Assert:Equals(ceArray[1], "element1").
        Assert:Equals(extent(ceArray), 5).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method to an indeterminate array in the last position
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementInLastPositionIndeterminateArray():
        define variable ceArray as character extent no-undo. 
        
        extent (ceArray) = 9.
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, "newElement1").
        Assert:Equals(ceArray[9], "newElement1").
        Assert:Equals(extent(ceArray), 9).

        ceArray = CharacterExtentUtil:AddElement(ceArray, "newElement2").
        Assert:Equals(ceArray[9], "newElement2").
        Assert:Equals(extent(ceArray), 9).
    
        ceArray = CharacterExtentUtil:AddElement(ceArray, "anotherElement").
        Assert:Equals(ceArray[9], "anotherElement").
        Assert:Equals(extent(ceArray), 9).
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, "anotherElement2").
        Assert:Equals(ceArray[9], "anotherElement2").
        Assert:Equals(ceArray[3], "").
        Assert:Equals(extent(ceArray), 9).
        
        extent (ceArray) = 12.
        ceArray[12] = "someElement".
        
        ceArray = CharacterExtentUtil:AddElement(ceArray, "anotherElement12").
        Assert:Equals(ceArray[12], "anotherElement12").
        Assert:Equals(extent(ceArray), 12).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetFirstElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstElement():
        define variable ceArray as character extent initial ["element1", "element2", "element3", "element4", "element5"] no-undo. 
        define variable ceArrayNoExtent as character extent no-undo.
        
        Assert:Equals(CharacterExtentUtil:GetFirstElement(ceArray), "element1").
        
        CharacterExtentUtil:GetFirstElement(ceArrayNoExtent).
        
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
        define variable ceArray as character extent initial ["element1", "element2", "element3", "element4", "element5"] no-undo.  
        define variable ceArrayNoExtent as character extent no-undo.
        
        Assert:Equals(CharacterExtentUtil:GetLastElement(ceArray), "element5").
        
        CharacterExtentUtil:GetLastElement(ceArrayNoExtent).
        
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
        define variable ceArray as character extent initial ["element1", "element2", "element3", "element4", "element5"] no-undo.  
        define variable ceArrayNoExtent as character extent no-undo.
        
        ceArray = CharacterExtentUtil:RemoveFirstElement(ceArray).
        Assert:Equals(ceArray[1], "element2").
        
        CharacterExtentUtil:RemoveFirstElement(ceArrayNoExtent).
        
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
        define variable ceArray as character extent initial ["element1", "element2", "element3", "element4", "element5"] no-undo.  
        define variable ceArrayNoExtent as character extent no-undo.
        
        Assert:Equals(CharacterExtentUtil:HasElement(ceArray, "element10"), false).
        Assert:Equals(CharacterExtentUtil:HasElement(ceArray, "element5"), true).
        
        CharacterExtentUtil:HasElement(ceArrayNoExtent, "element0").
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid array extent.", trim(err:GetMessage(1))).
        end catch.   
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test ListToCharacterExtent method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestListToCharacterExtent():
        define variable ceArray    as character extent no-undo.
        define variable ceArrayTwo as character extent no-undo.
        
        ceArray = CharacterExtentUtil:ListToCharacterExtent("element1,element2,element3,element4,element5", ",").
        
        Assert:Equals(ceArray[1], "element1").
        Assert:Equals(ceArray[3], "element3").
        Assert:Equals(ceArray[5], "element5").
        
        ceArrayTwo = CharacterExtentUtil:ListToCharacterExtent("element1-element2-element3-element4", "-").

        Assert:Equals(ceArrayTwo[1], "element1").
        Assert:Equals(ceArrayTwo[3], "element3").
        Assert:Equals(ceArrayTwo[4], "element4").

    end method.
    
end class.
