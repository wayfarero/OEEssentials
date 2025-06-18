/*------------------------------------------------------------------------
   File        : ListUtil
   Purpose     : Main helper class to handle List operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Tue Oct 22 15:53:05 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Collections.List.
using OpenEdge.Core.String.

class Utils.ListUtil: 
    
    /*------------------------------------------------------------------------------
        Purpose: Adds a new element at the end of the list
        Notes:
        @param ipltList as List, the list to add the element to
        @param ipsElement as string, the element to add
    ------------------------------------------------------------------------------*/
    method public static void AddElement( input ipltList   as List, 
                                          input ipsElement as string ):
        
        ipltList:Add(ipsElement). 
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Adds a new element at the end of the list
        Notes:
        @param ipcList as character, the list to add the element to
        @param ipcElement as character, the element to add
        @param ipcSeparator as character, the list separator
        @return character, the list with the added element
    ------------------------------------------------------------------------------*/
    method public static character AddElement( input ipcList      as character, 
                                               input ipcElement   as character,
                                               input ipcSeparator as character ):
        
        return AddElement(ipcList, ipcElement, ipcSeparator, false).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Adds a new element at the end of the list
        Notes:
        @param ipcList as character, the list to add the element to
        @param ipcElement as character, the element to add
        @param ipcSeparator as character, the list separator
        @return character, the list with the added element
    ------------------------------------------------------------------------------*/
    method public static character AddElement( input ipcList      as character, 
                                               input ipcElement   as character,
                                               input iplDedupe    as logical ):
        
        return AddElement(ipcList, ipcElement, ",", iplDedupe).
        
    end method.
    
    
    /*------------------------------------------------------------------------------
        Purpose: Adds a new element at the end of the list
        Notes:
        @param ipcList as character, the list to add the element to
        @param ipcElement as character, the element to add
        @param ipcSeparator as character, the list separator
        @param iplDedupe as logical, the list dedupe flag
        @return character, the list with the added element
    ------------------------------------------------------------------------------*/
    method public static character AddElement( input ipcList      as character, 
                                               input ipcElement   as character,
                                               input ipcSeparator as character,
                                               input iplDedupe    as logical ):
        
        if not iplDedupe or (iplDedupe and lookup(ipcElement, ipcList, ipcSeparator) = 0) then 
            ipcList = left-trim(substitute("&1&2&3", ipcList, ipcSeparator, ipcElement), ipcSeparator).
        
        return ipcList.
        
    end method.
    /*------------------------------------------------------------------------------
        Purpose: Adds a new element at the end of the list
        Notes: Default separator is ","
        @param ipcList as character, the list to add the element to
        @param ipcElement as character, the element to add
        @return character, the list with the added element
    ------------------------------------------------------------------------------*/
    method public static character AddElement( input ipcList    as character, 
                                               input ipcElement as character ):
        
        return AddElement(ipcList, ipcElement, ","). 
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Adds a new list element at the specified position
        Notes:
        @param ipltList as List, the list to add the element to
        @param ipsElement as string, the element to add
        @param ipiPosition as integer, the position to add the element to
    ------------------------------------------------------------------------------*/
    method public static void AddElementByPosition( input ipltList    as List, 
                                                    input ipsElement  as string, 
                                                    input ipiPosition as integer ):

        if ipiPosition < 0 or ipiPosition > ipltList:Size then
            return.

        ipltList:Add(ipiPosition, ipsElement).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Adds a new list element at the specified position
        Notes:
        @param ipcList as character, the list to add the element to
        @param ipcElement as character, the element to add
        @param ipcSeparator as character, the list separator
        @param ipiPosition as integer, the position to add the element to
        @return character, the list with the added element
    ------------------------------------------------------------------------------*/
    method public static character AddElementByPosition( input ipcList      as character, 
                                                         input ipcElement   as character,
                                                         input ipcSeparator as character, 
                                                         input ipiPosition  as integer ):
        define variable iCount     as integer   no-undo.
        define variable cListLeft  as character no-undo.
        define variable cListRight as character no-undo.
        
        if ipiPosition < 0 or ipiPosition > num-entries(ipcList, ipcSeparator) then
            return ipcList.
        
        do iCount = 1 to ipiPosition - 1:
            cListLeft = cListLeft + entry(iCount, ipcList, ipcSeparator) + ipcSeparator.
        end.
        
        do iCount = ipiPosition to num-entries(ipcList, ipcSeparator):
            cListRight = cListRight + entry(iCount, ipcList, ipcSeparator) + ipcSeparator.
        end.
        
        assign 
            cListLeft  = trim(cListLeft, ipcSeparator)
            cListRight = trim(cListRight, ipcSeparator).
        
        return cListLeft + ipcSeparator + ipcElement + (if cListRight <> "" then ipcSeparator + cListRight else "").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Adds a new list element at the specified position
        Notes: Default separator is ","
        @param ipcList as character, the list to add the element to
        @param ipcElement as character, the element to add
        @param ipiPosition as integer, the position to add the element to
        @return character, the list with the added element
    ------------------------------------------------------------------------------*/
    method public static character AddElementByPosition( input ipcList     as character, 
                                                         input ipcElement  as character,
                                                         input ipiPosition as integer ):
                                                             
        return AddElementByPosition(ipcList, ipcElement, ",", ipiPosition).
        
    end method.
    

    /*------------------------------------------------------------------------------
        Purpose: Removes an element from the list
        Notes:
        @param ipltList as List, the list to remove the element from
        @param ipsElement as string, the element to remove
    ------------------------------------------------------------------------------*/
    method public static void RemoveElement( input ipltList   as List, 
                                             input ipsElement as string ):

        ipltList:Remove(ipsElement).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes an element from the list
        Notes:
        @param ipcList as character, the list to remove the element from
        @param ipcElement as character, the element to remove
        @param ipcSeparator as character, the list separator
        @return character, the list with the element removed
    ------------------------------------------------------------------------------*/
    method public static character RemoveElement( input ipcList      as character, 
                                                  input ipcElement   as character, 
                                                  input ipcSeparator as character ):
        
        
        if ipcElement = "" then 
            ipcList = RemoveEmptyElements(ipcList, ipcSeparator).
        else do:
            if lookup(ipcElement, ipcList, ipcSeparator) = 0 then 
                return ipcList.
            assign
                ipclist = trim(replace(ipcList, ipcElement, ""), ipcSeparator)
                ipclist = replace(ipcList, fill(ipcSeparator, 2), ipcSeparator).
        end.        
        
        return ipcList. 
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes an element from the list
        Notes: Default separator is ","
        @param ipcList as character, the list to remove the element from
        @param ipcElement as character, the element to remove
        @return character, the list with the element removed
    ------------------------------------------------------------------------------*/
    method public static character RemoveElement( input ipcList    as character, 
                                                  input ipcElement as character ): 
        if ipcElement = "" then 
            return RemoveEmptyElements(ipcList).
        else 
            return RemoveElement(ipcList, ipcElement, ",").
            
    end method.    

    /*------------------------------------------------------------------------------
        Purpose: Removes an element at the specified position
        Notes:
        @param ipltList as List, the list to remove the element from
        @param ipiPosition as integer, the position of the element to remove
    ------------------------------------------------------------------------------*/
    method public static void RemoveElementByPosition( input ipltList    as List, 
                                                       input ipiPosition as integer ):

        ipltList:Remove(ipiPosition).

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes an element at the specified position
        Notes:
        @param ipcList as character, the list to remove the element from
        @param ipiPosition as integer, the position of the element to remove
        @param ipcSeparator as character, the list separator
        @return character, the list with the element removed
    ------------------------------------------------------------------------------*/
    method public static character RemoveElementByPosition( input ipcList      as character, 
                                                            input ipiPosition  as integer,
                                                            input ipcSeparator as character ):
        define variable iCount   as integer   no-undo.
        define variable cNewList as character no-undo initial "".
        
        if ipiPosition < 0 or ipiPosition > num-entries(ipcList, ipcSeparator) then
            return ipcList.
        
        do iCount = 1 to num-entries(ipcList, ipcSeparator): 
            if iCount <> ipiPosition then
                cNewList = (if cNewList = "" then entry(iCount, ipcList, ipcSeparator) 
                else cNewList + ipcSeparator + entry(iCount, ipcList, ipcSeparator)).
        end.
        
        return cNewList.
        
    end method.    

    /*------------------------------------------------------------------------------
        Purpose: Removes an element at the specified position
        Notes: Default separator is ","
        @param ipcList as character, the list to remove the element from
        @param ipiPosition as integer, the position of the element to remove
        @return character, the list with the element removed
    ------------------------------------------------------------------------------*/
    method public static character RemoveElementByPosition( input ipcList     as character, 
                                                            input ipiPosition as integer ):
        
        return RemoveElementByPosition(ipcList, ipiPosition, ",").
        
    end method.    

    /*------------------------------------------------------------------------------
        Purpose: Checks if the list contains a specific element
        Notes:
        @param ipltList as List, the list to search in
        @param ipsElement as string, the element to search for
        @return logical, whether the list contains the element
    ------------------------------------------------------------------------------*/
    method public static logical HasElement( input ipltList   as List, 
                                             input ipsElement as string ):

        return ipltList:Contains(ipsElement).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if the list contains a specific element
        Notes:
        @param ipcList as character, the list to search in
        @param ipcElement as character, the element to search for
        @return logical, whether the list contains the element
    ------------------------------------------------------------------------------*/
    method public static logical HasElement( input ipcList    as character, 
                                             input ipcElement as character ):

        return lookup(ipcElement, ipcList) <> 0.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Returns the first element from the list
        Notes:
        @param ipltList as List, the list
        @return character, the first element of the list
    ------------------------------------------------------------------------------*/
    method public static character GetFirstElement( input ipltList as List ):
        
        return ipltList:Get(1):ToString().

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Returns the first element from the list
        Notes:
        @param ipcList as character, the list
        @param ipcSeparator as character, the list separator
        @return character, the first element of the list
    ------------------------------------------------------------------------------*/
    method public static character GetFirstElement( input ipcList      as character,
                                                    input ipcSeparator as character ):
        
        return entry(1, ipcList, ipcSeparator).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Returns the first element from the list
        Notes: Default separator is ","
        @param ipcList as character, the list
        @return character, the first element of the list
    ------------------------------------------------------------------------------*/
    method public static character GetFirstElement( input ipcList as character ):
        
        return GetFirstElement(ipcList, ",").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Returns the last element from the list
        Notes:
        @param ipltList as List, the list
        @return character, the last element of the list
    ------------------------------------------------------------------------------*/
    method public static character GetLastElement( input ipltList as List ):

        return ipltList:Get(ipltList:Size):ToString().

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the last element from the list
        Notes:
        @param ipcList as character, the list
        @param ipcSeparator as character, the list separator
        @return character, the last element of the list
    ------------------------------------------------------------------------------*/
    method public static character GetLastElement( input ipcList      as character,
                                                   input ipcSeparator as character ):
        
        return entry(num-entries(ipcList, ipcSeparator), ipcList, ipcSeparator).

    end method.    
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the last element from the list
        Notes: Default separator is ","
        @param ipcList as character, the list
        @return character, the last element of the list
    ------------------------------------------------------------------------------*/
    method public static character GetLastElement( input ipcList as character ):
        
        return GetLastElement(ipcList, ",").

    end method.    
    
    /*------------------------------------------------------------------------------
        Purpose: Sorts the elements in the list using the default comparer
        Notes:
        @param ipltList as List, the list to sort
    ------------------------------------------------------------------------------*/
    method public static void SortList( input ipltList as List ):
        define variable cEntry1 as character no-undo.
        define variable cEntry2 as character no-undo.
        define variable cAux    as character no-undo.
        define variable iCount1 as integer   no-undo.
        define variable iCount2 as integer   no-undo.
        define variable lSwap   as logical   no-undo.

        do iCount1 = 1 to ipltList:Size - 1:
            lSwap = false.
            do iCount2 = 1 to ipltList:Size - iCount1:
                assign
                    cEntry1 = ipltList:Get(iCount2):ToString()
                    cEntry2 = ipltList:Get(iCount2 + 1):ToString().
                    
                if cEntry1 > cEntry2 then 
                do: 
                    assign 
                        cAux  = cEntry1
                        lSwap = true.
                        
                    ipltList:Set(iCount2, new String(cEntry2)).
                    ipltList:Set(iCount2 + 1, new String(cAux)).
                end.
            end.
            
            if lSwap = false then
                return.
        end.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Sorts the elements in the list using the default comparer
        Notes:
        @param ipcList as character, the list to sort
        @param ipcSeparator as character, the list separator
        @return character, the sorted list
    ------------------------------------------------------------------------------*/
    method public static character SortList( input ipcList      as character, 
                                             input ipcSeparator as character ):
        define variable cEntry1 as character no-undo.
        define variable cEntry2 as character no-undo.
        define variable cAux    as character no-undo.
        define variable iCount1 as integer   no-undo.
        define variable iCount2 as integer   no-undo.
        define variable lSwap   as logical   no-undo.

        do iCount1 = 1 to num-entries(ipcList, ipcSeparator) - 1:
            lSwap = false.
            do iCount2 = 1 to num-entries(ipcList, ipcSeparator) - iCount1:
                assign
                    cEntry1 = entry(iCount2, ipcList, ipcSeparator)
                    cEntry2 = entry(iCount2 + 1 , ipcList, ipcSeparator).
                    
                if entry(iCount2, ipcList, ipcSeparator) > entry(iCount2 + 1 , ipcList, ipcSeparator) then 
                    assign 
                        lSwap                                      = true
                        cAux                                       = entry(iCount2, ipcList, ipcSeparator)
                        entry(iCount2, ipcList, ipcSeparator)      = entry(iCount2 + 1 , ipcList, ipcSeparator)
                        entry(iCount2 + 1 , ipcList, ipcSeparator) = cAux.
            end.
            
            if lSwap = false then 
                return ipcList.
        end.
        
    end method.    

    /*------------------------------------------------------------------------------
        Purpose: Sorts the elements in the list using the default comparer
        Notes: Default separator is ","
        @param ipcList as character, the list to sort
        @return character, the sorted list
    ------------------------------------------------------------------------------*/
    method public static character SortList( input ipcList as character ):
        
        return SortList(ipcList, ",").
       
    end method.    

    /*------------------------------------------------------------------------------
        Purpose: Checks if the list has any duplicate elements
        Notes:
        @param ipltList as List, the list to check
        @return logical, whether the list has duplicates
    ------------------------------------------------------------------------------*/
    method public static logical HasDuplicates( input ipltList as List ):
        define variable iCount as integer no-undo.
         
        do iCount = 1 to ipltList:Size:
            if ipltList:IndexOf(ipltList:Get(iCount)) <> ipltList:LastIndexOf(ipltList:Get(iCount)) then
                return true.
        end.

        return false.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if the list has any duplicate elements
        Notes:
        @param ipcList as character, the list to check
        @param ipcSeparator as character, the list separator
        @return logical, whether the list has duplicates
    ------------------------------------------------------------------------------*/
    method public static logical HasDuplicates( input ipcList      as character,
                                                input ipcSeparator as character ):
        define variable iCount1 as integer no-undo.
        define variable iCount2 as integer no-undo.

        if ipcList = "" or num-entries(ipcList, ipcSeparator) = 1 then
            return false.

        do iCount1 = 1 to num-entries(ipcList, ipcSeparator) - 1:
            do iCount2 = iCount1 + 1 to num-entries(ipcList, ipcSeparator):
                if entry(iCount1, ipcList, ipcSeparator) = entry(iCount2, ipcList, ipcSeparator) then
                    return true.
            end.
        end.
        
        return false.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if the list has any duplicate elements
        Notes: Default separator is ","
        @param ipcList as character, the list to check
        @return logical, whether the list has duplicates
    ------------------------------------------------------------------------------*/
    method public static logical HasDuplicates( input ipcList as character ):
       
        return HasDuplicates(ipcList, ",").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if the list has any empty elements
        Notes:
        @param ipltList as List, the list to check
        @return logical, whether the list has empty elements
    ------------------------------------------------------------------------------*/
    method public static logical HasEmptyElements( input ipltList as List ):
        define variable iCount as integer no-undo.

        do iCount = 1 to ipltList:Size:
            if trim(ipltList:Get(iCount):ToString()) = "" then
                return true.
        end.

        return false.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if the list has any empty elements
        Notes:
        @param ipcList as character, the list to check
        @param ipcSeparator as character, the list separator
        @return logical, whether the list has empty elements
    ------------------------------------------------------------------------------*/
    method public static logical HasEmptyElements( input ipcList      as character,
                                                   input ipcSeparator as character ):
        define variable iCount as integer no-undo.

        do iCount = 1 to num-entries(ipcList, ipcSeparator):
            if entry(iCount, ipcList, ipcSeparator) = "" then
                return true.
        end.

        return false.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Checks if the list has any empty elements.
        Notes: Default separator is ","
        @param ipcList as character, the list to check
        @return logical, whether the list has empty elements
    ------------------------------------------------------------------------------*/
    method public static logical HasEmptyElements( input ipcList as character ):
       
        return HasEmptyElements(ipcList, ",").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Removes all empty elements from the list
        Notes:
        @param ipltList as List, the list to clean
    ------------------------------------------------------------------------------*/
    method public static void RemoveEmptyElements( input ipltList as List ):
        define variable iCount as integer no-undo.

        do iCount = 1 to ipltList:Size:
            if ipltList:Get(iCount):ToString() = "" then
                RemoveElementByPosition(ipltList, iCount).
        end.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes all empty elements from the list
        Notes:
        @param ipcList as character, the list to clean
        @param ipcSeparator as character, the list separator
        @return character, the list with no empty elements
    ------------------------------------------------------------------------------*/
    method public static character RemoveEmptyElements( input ipcList      as character,
                                                        input ipcSeparator as character ):
        define variable iCount as integer no-undo.

        do iCount = 1 to num-entries(ipcList, ipcSeparator):
            if entry(iCount, ipcList, ipcSeparator) = " " then 
                ipcList = RemoveElementByPosition(ipcList, iCount, ipcSeparator).
        end.
        
        return ipcList.

    end method.    

    /*------------------------------------------------------------------------------
        Purpose: Removes all empty elements from the list
        Notes: Default separator is ","
        @param ipcList as character, the list to clean
        @return character, the list with no empty elements
    ------------------------------------------------------------------------------*/
    method public static character RemoveEmptyElements( input ipcList as character ):
        
        return RemoveEmptyElements(ipcList, ",").

    end method.    
    
end class.
