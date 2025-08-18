/*------------------------------------------------------------------------
   File        : ListUtilUnitTest
   Purpose     : Unit Test class for ListUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Tue Oct 22 15:53:16 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using OpenEdge.Core.Collections.List.
using OpenEdge.Core.String.
using oeessentials.ListUtil.

class Tests.ListUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElement():
        define variable cList    as List   no-undo. 
        define variable sElement as string no-undo. 
        
        assign 
            cList    = GetInitialList()
            sElement = new string("addElement").
        
        ListUtil:AddElement(cList, sElement).
        Assert:Equals(cList:IndexOf(sElement), 5).

        sElement = new string("").
        ListUtil:AddElement(cList, sElement).
        Assert:Equals(cList:IndexOf(sElement), 6).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementCharacterList():
        define variable cList    as character no-undo. 
        define variable cElement as character no-undo. 
        
        assign 
            cList    = "firstElement,secondElement,thirdElement,fourthElement"
            cElement = "addElement".
        
        cList = ListUtil:AddElement(cList, cElement, ",").
        Assert:Equals("firstElement,secondElement,thirdElement,fourthElement,addElement", cList).
        
        cList = ListUtil:AddElement(cList, "thirdElement", ",").
        Assert:Equals("firstElement,secondElement,thirdElement,fourthElement,addElement,thirdElement", cList).
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        cList = ListUtil:AddElement(cList, cElement, "|").
        Assert:Equals("firstElement|secondElement|thirdElement|fourthElement|addElement", cList).
        
        cList = ListUtil:AddElement(cList, "thirdElement", "|").
        Assert:Equals("firstElement|secondElement|thirdElement|fourthElement|addElement|thirdElement", cList).
        
    end method.

    @Test.
    method public void TestAddElementCharacterListEmpty():
        define variable cList    as character no-undo. 
        define variable cElement as character no-undo. 

        cList = ListUtil:AddElement(cList, "").
        Assert:Equals("", cList).
        
        cList = ListUtil:AddElement(cList, "addElement").
        Assert:Equals("addElement", cList).

        cList = ListUtil:AddElement(cList, "").
        Assert:Equals("addElement,", cList).
        
        cList = "".
        cList = ListUtil:AddElement(cList, "", "|").
        Assert:Equals("", cList).
        
        cList = ListUtil:AddElement(cList, "addElement", "|").
        Assert:Equals("addElement", cList).

        cList = ListUtil:AddElement(cList, "", "|").
        Assert:Equals("addElement|", cList).
        
    end method.

    @Test.
    method public void TestAddElementCharacterListDedupe():
        define variable cList    as character no-undo. 
        define variable cElement as character no-undo. 
        
        cElement = "addElement".
        cList = ListUtil:AddElement(cList, cElement).
        Assert:Equals("addElement", cList).
        
        cList = ListUtil:AddElement(cList, cElement, true).
        Assert:Equals("addElement", cList).
        
        cList = ListUtil:AddElement(cList, cElement, false).
        Assert:Equals("addElement,addElement", cList).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test AddElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementCharacterListDefaultSeparator():
        define variable cList    as character no-undo. 
        define variable cElement as character no-undo. 
        
        assign 
            cList    = "firstElement,secondElement,thirdElement,fourthElement"
            cElement = "addElement".
        
        cList = ListUtil:AddElement(cList, cElement).
        Assert:Equals("firstElement,secondElement,thirdElement,fourthElement,addElement", cList).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test AddElementByPosition method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementByPosition():
        define variable cList    as List   no-undo. 
        define variable sElement as string no-undo. 
        
        assign 
            cList    = GetInitialList()
            sElement = new string("addElement").
            
        ListUtil:AddElementByPosition(cList, sElement, 2).

        Assert:Equals(cList:IndexOf(sElement), 2).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test AddElementByPosition method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementByPositionCharacter():
        define variable cList    as character no-undo. 
        define variable cElement as character no-undo. 
        
        assign 
            cList    = "firstElement|secondElement|thirdElement|fourthElement"
            cElement = "addElement".
        
        cList = ListUtil:AddElementByPosition(cList, cElement, "|", 2).
        Assert:Equals("firstElement|addElement|secondElement|thirdElement|fourthElement", cList).

        cList = ListUtil:AddElementByPosition(cList, cElement, "|", 1).
        Assert:Equals("addElement|firstElement|addElement|secondElement|thirdElement|fourthElement", cList).
        
        cList = ListUtil:AddElementByPosition(cList, cElement, "|", 7).
        Assert:Equals("addElement|firstElement|addElement|secondElement|thirdElement|fourthElement|addElement", cList).
        
        cList = ListUtil:AddElementByPosition(cList, "", "|", 4).
        Assert:Equals("addElement|firstElement|addElement||secondElement|thirdElement|fourthElement|addElement", cList).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test AddElementByPosition method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddElementByPositionCharacterDefaultSeparator():
        define variable cList    as character no-undo. 
        define variable cElement as character no-undo. 
        
        assign 
            cList    = "firstElement,secondElement,thirdElement,fourthElement"
            cElement = "addElement".
        
        cList = ListUtil:AddElementByPosition(cList, cElement, 2).
        Assert:Equals("firstElement,addElement,secondElement,thirdElement,fourthElement", cList).

        cList = ListUtil:AddElementByPosition(cList, cElement, 1).
        Assert:Equals("addElement,firstElement,addElement,secondElement,thirdElement,fourthElement", cList).
        
        cList = ListUtil:AddElementByPosition(cList, cElement, 7).
        Assert:Equals("addElement,firstElement,addElement,secondElement,thirdElement,fourthElement,addElement", cList).
        
        cList = ListUtil:AddElementByPosition(cList, "", 4).
        Assert:Equals("addElement,firstElement,addElement,,secondElement,thirdElement,fourthElement,addElement", cList).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test RemoveElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveElement():
        define variable cList    as List   no-undo. 
        define variable sElement as string no-undo. 
        
        assign 
            cList    = GetInitialList()
            sElement = new string("secondElement").
            
        ListUtil:RemoveElement(cList, sElement).

        Assert:Equals(cList:IndexOf(sElement), 0).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test RemoveElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveElementCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        cList = ListUtil:RemoveElement(cList, "secondElement", "|").
        Assert:Equals("firstElement|thirdElement|fourthElement", cList).

        cList = ListUtil:RemoveElement(cList, "firstElement", "|").
        Assert:Equals("thirdElement|fourthElement", cList).

        cList = "firstElement|secondElement|thirdElement|fourthElement".
        cList = ListUtil:RemoveElement(cList, "fourthElement", "|").
        Assert:Equals("firstElement|secondElement|thirdElement", cList).

        cList = "firstElement|secondElement||fourthElement|".
        cList = ListUtil:RemoveElement(cList, "", "|").
        Assert:NotFalse("firstElement|secondElement|fourthElement" = cList, substitute("1 empty string remove expected: firstElement|secondElement|fourthElement but was &1", cList)).

        cList = "firstElement|secondElement||fourthElement|".
        cList = ListUtil:RemoveElement(cList, " ", "|").
        Assert:NotFalse("firstElement|secondElement|fourthElement" = cList, substitute("1 space remove expected: firstElement|secondElement|fourthElement but was &1", cList)).

        cList = "firstElement|secondElement| |fourthElement|".
        cList = ListUtil:RemoveElement(cList, "", "|").
        Assert:NotFalse("firstElement|secondElement|fourthElement" = cList, substitute("2 empty string remove expected: firstElement|secondElement|fourthElement but was &1", cList)).

        cList = "firstElement|secondElement| |fourthElement|".
        cList = ListUtil:RemoveElement(cList, " ", "|").
        Assert:NotFalse("firstElement|secondElement|fourthElement" = cList, substitute("2 space remove expected: firstElement|secondElement|fourthElement but was &1", cList)).
        
        cList = "firstElement|secondElement|secondElement|secondElement|secondElement|firstElement".
        cList = ListUtil:RemoveElement(cList, "secondElement", "|").
        Assert:Equals("firstElement|firstElement", cList).   
         
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test RemoveElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveElementCharacterDefaultSeparator():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
        cList = ListUtil:RemoveElement(cList, "secondElement").
        Assert:Equals("firstElement,thirdElement,fourthElement", cList).

        cList = ListUtil:RemoveElement(cList, "firstElement").
        Assert:Equals("thirdElement,fourthElement", cList).

        cList = "firstElement,secondElement,thirdElement,fourthElement".
        cList = ListUtil:RemoveElement(cList, "fourthElement").
        Assert:Equals("firstElement,secondElement,thirdElement", cList).

        cList = "firstElement,secondElement,,fourthElement,".
        cList = ListUtil:RemoveElement(cList, "").
        Assert:NotFalse("firstElement,secondElement,fourthElement" = cList, substitute("1 empty string remove expected: firstElement,secondElement,fourthElement but was &1", cList)).

        cList = "firstElement,secondElement,,fourthElement,".
        cList = ListUtil:RemoveElement(cList, " ").
        Assert:NotFalse("firstElement,secondElement,fourthElement" = cList, substitute("1 space remove expected: firstElement,secondElement,fourthElement but was &1", cList)).

        cList = "firstElement,secondElement, ,fourthElement,".
        cList = ListUtil:RemoveElement(cList, "").
        Assert:NotFalse("firstElement,secondElement,fourthElement" = cList, substitute("2 empty string remove expected: firstElement,secondElement,fourthElement but was &1", cList)).

        cList = "firstElement,secondElement, ,fourthElement,".
        cList = ListUtil:RemoveElement(cList, " ").
        Assert:NotFalse("firstElement,secondElement,fourthElement" = cList, substitute("2 space remove expected: firstElement,secondElement,fourthElement but was &1", cList)).
        
        cList = "firstElement,secondElement,secondElement,secondElement,secondElement,firstElement".
        cList = ListUtil:RemoveElement(cList, "secondElement").
        Assert:Equals("firstElement,firstElement", cList).  

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test RemoveElementByPosition method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveElementByPosition():
        define variable cList    as List   no-undo. 
        define variable sElement as string no-undo. 
        
        assign 
            cList    = GetInitialList()
            sElement = new string("firstElement").
            
        ListUtil:RemoveElementByPosition(cList, 1).

        Assert:Equals(cList:IndexOf(sElement), 0).
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test RemoveElementByPosition method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveElementByPositionCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        cList = ListUtil:RemoveElementByPosition(cList, 2, "|").
        Assert:Equals("firstElement|thirdElement|fourthElement", cList).
        
        cList = ListUtil:RemoveElementByPosition(cList, 1, "|").
        Assert:Equals("thirdElement|fourthElement", cList).
        
        cList = ListUtil:RemoveElementByPosition(cList, 2, "|").
        Assert:Equals("thirdElement", cList).
        
        cList = "firstElement|secondElement|||thirdElement". 
        cList = ListUtil:RemoveElementByPosition(cList, 3, "|").
        Assert:Equals("firstElement|secondElement||thirdElement", cList).
        
        cList = "firstElement|||thirdElement|fourthElement||||||  |". 
        cList = ListUtil:RemoveElementByPosition(cList, 2, "|").
        Assert:Equals("firstElement||thirdElement|fourthElement||||||  |", cList).
        
        cList = "|firstElement|||thirdElement|fourthElement|". 
        cList = ListUtil:RemoveElementByPosition(cList, 1, "|").
        Assert:Equals("firstElement|||thirdElement|fourthElement|", cList).
        
        cList = ListUtil:RemoveElementByPosition(cList, 6, "|").
        Assert:Equals("firstElement|||thirdElement|fourthElement", cList).
        
    end method.  
    
    /*------------------------------------------------------------------------------
        Purpose: Test RemoveElementByPosition method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveElementByPositionCharacterDefault():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
        cList = ListUtil:RemoveElementByPosition(cList, 2).
        Assert:Equals("firstElement,thirdElement,fourthElement", cList).
        
        cList = ListUtil:RemoveElementByPosition(cList, 1).
        Assert:Equals("thirdElement,fourthElement", cList).
        
        cList = ListUtil:RemoveElementByPosition(cList, 2).
        Assert:Equals("thirdElement", cList).
        
        cList = "firstElement,secondElement,,,thirdElement". 
        cList = ListUtil:RemoveElementByPosition(cList, 3).
        Assert:Equals("firstElement,secondElement,,thirdElement", cList).
        
        cList = "firstElement,,,thirdElement,fourthElement,,,,,,  ,". 
        cList = ListUtil:RemoveElementByPosition(cList, 2).
        Assert:Equals("firstElement,,thirdElement,fourthElement,,,,,,  ,", cList).
        
        cList = ",firstElement,,,thirdElement,fourthElement,". 
        cList = ListUtil:RemoveElementByPosition(cList, 1).
        Assert:Equals("firstElement,,,thirdElement,fourthElement,", cList).
        
        cList = ListUtil:RemoveElementByPosition(cList, 6).
        Assert:Equals("firstElement,,,thirdElement,fourthElement", cList).
        
    end method.   

    /*------------------------------------------------------------------------------
        Purpose: Test HasElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasElement():
        define variable cList as List no-undo. 
        
        cList = GetInitialList().
     
        Assert:Equals(ListUtil:HasElement(cList, new String("Element")), false).
        Assert:Equals(ListUtil:HasElement(cList, new String("firstElement")), true).
        Assert:Equals(ListUtil:HasElement(cList, new String("fourthElement")), true).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test HasElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasElementCharacter():
        define variable cList    as character no-undo. 
        define variable cElement as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
     
        Assert:Equals(ListUtil:HasElement(cList, "secondElement"), true).
        Assert:Equals(ListUtil:HasElement(cList, "noElement"), false).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetFirstElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstElement():
        define variable cList as List no-undo. 
        
        cList = GetInitialList().

        Assert:Equals(ListUtil:GetFirstElement(cList), "firstElement").

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetFirstElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstElementCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        Assert:Equals(ListUtil:GetFirstElement(cList, "|"), "firstElement").
        
        cList = "|firstElement|secondElement|thirdElement|fourthElement".
        Assert:Equals(ListUtil:GetFirstElement(cList, "|"), "").
                
    end method.    

    /*------------------------------------------------------------------------------
        Purpose: Test GetFirstElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFirstElementCharacterDefaultSeparator():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
        Assert:Equals(ListUtil:GetFirstElement(cList), "firstElement").
        
        cList = ",firstElement,secondElement,thirdElement,fourthElement".
        Assert:Equals(ListUtil:GetFirstElement(cList), "").
        
    end method. 

    /*------------------------------------------------------------------------------
        Purpose: Test GetLastElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetLastElement():
        define variable cList as List no-undo. 
        
        cList = GetInitialList().

        Assert:Equals(ListUtil:GetLastElement(cList), "fourthElement").

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetLastElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetLastElementCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        Assert:Equals(ListUtil:GetLastElement(cList, "|"), "fourthElement").
        
        cList = "firstElement|secondElement|thirdElement|fourthElement|".
        Assert:Equals(ListUtil:GetLastElement(cList, "|"), "").
        
    end method.    
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetLastElement method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetLastElementCharacterDefaultSeparator():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
        Assert:Equals(ListUtil:GetLastElement(cList), "fourthElement").
        
        cList = "firstElement,secondElement,thirdElement,fourthElement,".
        Assert:Equals(ListUtil:GetLastElement(cList), "").
        
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Test SortList method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSortList():
        define variable cList as List no-undo. 
        
        cList = GetInitialList().
        ListUtil:SortList(cList).
        
        Assert:Equals(cList:Get(1):ToString(), "firstElement").
        Assert:Equals(cList:Get(2):ToString(), "fourthElement").
        Assert:Equals(cList:Get(3):ToString(), "secondElement").
        Assert:Equals(cList:Get(4):ToString(), "thirdElement").
    end method.
    
    /*------------------------------------------------------------------------------
         Purpose: Test SortList method
     ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSortListCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        cList = ListUtil:SortList(cList, "|").
        Assert:Equals("firstElement|fourthElement|secondElement|thirdElement", cList).
        
        cList = "|firstElement||fourthElement|secondElement|thirdElement||".
        cList = ListUtil:SortList(cList, "|").
        Assert:Equals("||||firstElement|fourthElement|secondElement|thirdElement", cList).
        
    end method.
    
    /*------------------------------------------------------------------------------
         Purpose: Test SortList method
     ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSortListCharacterDefaultSeparator():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
        cList = ListUtil:SortList(cList).
        Assert:Equals("firstElement,fourthElement,secondElement,thirdElement", cList).
        
        cList = ",firstElement,,fourthElement,secondElement,thirdElement,,".
        cList = ListUtil:SortList(cList).
        Assert:Equals(",,,,firstElement,fourthElement,secondElement,thirdElement", cList).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test HasDuplicates method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasDuplicates():
        define variable cList as List no-undo. 
        
        cList = GetInitialList().

        Assert:Equals(ListUtil:HasDuplicates(cList), false).

        cList:add(new string("firstElement")).

        Assert:Equals(ListUtil:HasDuplicates(cList), true).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test HasDuplicates method
    ------------------------------------------------------------------------------*/
    @NoTest.
    method public void TestHasDuplicatesCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        Assert:Equals(ListUtil:HasDuplicates(cList, "|"), false).

        cList = "firstElement|secondElement|thirdElement|secondElement|fourthElement".
        Assert:Equals(ListUtil:HasDuplicates(cList, "|"), true).

        cList = "|firstElement|secondElement|thirdElement|fourthElement|".
        Assert:Equals(ListUtil:HasDuplicates(cList, "|"), true).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test HasDuplicates method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasDuplicatesCharacterDefaultSeparator():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
        Assert:Equals(false, ListUtil:HasDuplicates(cList)).
        
        cList = "firstElement,secondElement,thirdElement,secondElement,fourthElement".
        Assert:Equals(ListUtil:HasDuplicates(cList), true).

        cList = ",firstElement,secondElement,thirdElement,fourthElement,".
        Assert:Equals(ListUtil:HasDuplicates(cList), true).


    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test HasEmptyElements method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasEmptyElements():
        define variable cList as List no-undo. 
        
        cList = GetInitialList().

        Assert:Equals(ListUtil:HasEmptyElements(cList), false).

        cList:add(new string("    ")).
        cList:add(new string("notEmpty")).

        Assert:Equals(ListUtil:HasEmptyElements(cList), true).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test HasEmptyElements method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasEmptyElementsCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        Assert:Equals(ListUtil:HasEmptyElements(cList, "|"), false).

        cList = "firstElement|secondElement|thirdElement|fourthElement|".
        Assert:Equals(ListUtil:HasEmptyElements(cList, "|"), true).
        
        cList = "|firstElement|secondElement|thirdElement|fourthElement".
        Assert:Equals(ListUtil:HasEmptyElements(cList, "|"), true).
        
        cList = "firstElement||secondElement|thirdElement|fourthElement".
        Assert:Equals(ListUtil:HasEmptyElements(cList, "|"), true).
        
    end method.
       
    /*------------------------------------------------------------------------------
        Purpose: Test HasEmptyElements method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasEmptyElementsCharacterDefaultSeparator():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
        Assert:Equals(ListUtil:HasEmptyElements(cList), false).

        cList = "firstElement,secondElement,thirdElement,fourthElement,".
        Assert:Equals(ListUtil:HasEmptyElements(cList), true).

        cList = ",firstElement,secondElement,thirdElement,fourthElement".
        Assert:Equals(ListUtil:HasEmptyElements(cList), true).

        cList = "firstElement,secondElement,,thirdElement,fourthElement".
        Assert:Equals(ListUtil:HasEmptyElements(cList), true).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test RemoveEmptyElements method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveEmptyElements():
        define variable cList as List no-undo. 
        
        cList = GetInitialList().

        cList:add(new string("")).
        ListUtil:AddElementByPosition(cList, new string("") ,2).

        Assert:NonZero(cList:IndexOf(new string(""))).

        ListUtil:RemoveEmptyElements(cList).

        Assert:IsZero(cList:IndexOf(new string(""))).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test RemoveEmptyElements method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveEmptyElementsCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|thirdElement|fourthElement".
        cList = ListUtil:RemoveEmptyElements(cList, "|").
        Assert:Equals("firstElement|secondElement|thirdElement|fourthElement", cList).
        
        cList = "||firstElement||secondElement|thirdElement|fourthElement".
        cList = ListUtil:RemoveEmptyElements(cList, "|").
        Assert:Equals("firstElement|secondElement|thirdElement|fourthElement", cList).
        
        cList = "|firstElement|secondElement|thirdElement|fourthElement||".
        cList = ListUtil:RemoveEmptyElements(cList, "|").
        Assert:Equals("firstElement|secondElement|thirdElement|fourthElement", cList).
        
        cList = "firstElement|||thirdElement|fourthElement||||||  |".
        cList = ListUtil:RemoveEmptyElements(cList, "|").
        Assert:Equals("firstElement|thirdElement|fourthElement", cList).

    end method.    

    /*------------------------------------------------------------------------------
        Purpose: Test RemoveEmptyElements method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveEmptyElementsCharacterDefaultSeparator():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,thirdElement,fourthElement".
        cList = ListUtil:RemoveEmptyElements(cList).
        Assert:Equals("firstElement,secondElement,thirdElement,fourthElement", cList).
        
        cList = ",,firstElement,,secondElement,thirdElement,fourthElement".
        cList = ListUtil:RemoveEmptyElements(cList).
        Assert:Equals("firstElement,secondElement,thirdElement,fourthElement", cList).
        
        cList = ",firstElement,secondElement,thirdElement,fourthElement,,".
        cList = ListUtil:RemoveEmptyElements(cList).
        Assert:Equals("firstElement,secondElement,thirdElement,fourthElement", cList).
        
        cList = "firstElement,,,thirdElement,fourthElement,,,,,,  ,".
        cList = ListUtil:RemoveEmptyElements(cList).
        Assert:Equals("firstElement,thirdElement,fourthElement", cList).

    end method.  
    
    /*------------------------------------------------------------------------------
        Purpose: Test RemoveDuplicateElements method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveDuplicateElementsCharacter():
        define variable cList as character no-undo. 
        
        cList = "firstElement|secondElement|secondElement|thirdElement|fourthElement| ||fifthElement|fifthElement||sixthElement|fifthElement| |seventhElement|eighthElement|firstElement|fifthElement".
        cList = ListUtil:RemoveDuplicateElements(cList, "|").
        Assert:Equals("thirdElement|fourthElement|sixthElement|seventhElement|eighthElement", cList).

        cList = "firstElement|||secondElement|fifthElement|fifthElement|fourthElement|sixthElement".
        cList = ListUtil:RemoveDuplicateElements(cList, "|").
        Assert:Equals("firstElement|secondElement|fourthElement|sixthElement", cList).

        cList = "firstElement|||   |secondElement|fifthElement|fifthElement|fourthElement|fourthElement|fourthElement|  |||     |sixthElement".
        cList = ListUtil:RemoveDuplicateElements(cList, "|").
        Assert:Equals("firstElement|secondElement|sixthElement", cList).

        cList = "|||firstElement||secondElement||thirdElement||".
        cList = ListUtil:RemoveDuplicateElements(cList, "|").
        Assert:Equals("firstElement|secondElement|thirdElement", cList).
        
        cList = "|firstElement|secondElement|thirdElement".
        cList = ListUtil:RemoveDuplicateElements(cList, "|").
        Assert:Equals("|firstElement|secondElement|thirdElement", cList).
        
    end method. 

    /*------------------------------------------------------------------------------
        Purpose: Test RemoveDuplicateElements method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveDuplicateElementsCharacterDefaultSeparator():
        define variable cList as character no-undo. 
        
        cList = "firstElement,secondElement,secondElement,thirdElement,fourthElement, ,,fifthElement,fifthElement,,sixthElement,fifthElement, ,seventhElement,eighthElement,firstElement,fifthElement".
        cList = ListUtil:RemoveDuplicateElements(cList).
        Assert:Equals("thirdElement,fourthElement,sixthElement,seventhElement,eighthElement", cList).

        cList = "firstElement,,,secondElement,fifthElement,fifthElement,fourthElement,sixthElement".
        cList = ListUtil:RemoveDuplicateElements(cList).
        Assert:Equals("firstElement,secondElement,fourthElement,sixthElement", cList).

        cList = "firstElement,,,   ,secondElement,fifthElement,fifthElement,fourthElement,fourthElement,fourthElement,  ,,,     ,sixthElement".
        cList = ListUtil:RemoveDuplicateElements(cList).
        Assert:Equals("firstElement,secondElement,sixthElement", cList).

        cList = ",,,firstElement,,secondElement,,thirdElement,,".
        cList = ListUtil:RemoveDuplicateElements(cList).
        Assert:Equals("firstElement,secondElement,thirdElement", cList).
        
        cList = ",firstElement,secondElement,thirdElement".
        cList = ListUtil:RemoveDuplicateElements(cList).
        Assert:Equals(",firstElement,secondElement,thirdElement", cList).
        
    end method.  

    /*------------------------------------------------------------------------------
        Purpose: Method to populate a list
    ------------------------------------------------------------------------------*/
    method private List GetInitialList():
        define variable cList as List no-undo.
        
        cList = new List().

        cList:add(new string("firstElement")).
        cList:add(new string("secondElement")).
        cList:add(new string("thirdElement")).
        cList:add(new string("fourthElement")).

        return cList.
        
    end method.
    
end class.
