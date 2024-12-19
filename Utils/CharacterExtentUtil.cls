/*------------------------------------------------------------------------
   File        : CharacterExtentUtil
   Purpose     : Main helper class to handle character extent operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Oct 23 14:16:49 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.CharacterExtentUtil: 

    /*------------------------------------------------------------------------------
        Purpose: Add element to array
        Notes:
        @param ipceArray as character extent, the array
        @param ipiPosition as integer, the position to add the element to
        @param ipcElement as character, the element to add
        @return character extent, the array with the added element
    ------------------------------------------------------------------------------*/
    method public static character extent AddElement( input ipceArray   as character extent, 
                                                      input ipiPosition as integer, 
                                                      input ipcElement  as character ):
        define variable iCount as integer no-undo.
        
        if extent(ipceArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        if ipiPosition > extent(ipceArray) or ipiPosition < 1 then 
            undo, throw new Progress.Lang.AppError("Invalid position index.", 1).
        
        iCount = extent(ipceArray). 
        
        do while iCount > ipiPosition: 
            assign            
                ipceArray[iCount] = ipceArray[iCount - 1]
                iCount          = iCount - 1. 
        end.
            
        ipceArray[ipiPosition] = ipcElement.
        
        return ipceArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Add element to the array at the last position
        Notes:
        @param ipceArray as character extent, the array
        @param ipcElement as character, the element to add
        @return character extent, the array with the added element
    ------------------------------------------------------------------------------*/
    method public static character extent AddElement( input ipceArray  as character extent,
                                                      input ipcElement as character ):
                                                          
        return AddElement(ipceArray, extent(ipceArray), ipcElement).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the first element of an array
        Notes:
        @param ipceArray as character extent, the array
        @return character, the first element of the array
    ------------------------------------------------------------------------------*/
    method public static character GetFirstElement( input ipceArray as character extent ):
        
        if extent(ipceArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        return ipceArray[1].        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the last element of an array
        Notes:
        @param ipceArray as character extent, the array
        @return character, the last element of the array
    ------------------------------------------------------------------------------*/
    method public static character GetLastElement( input ipceArray as character extent ):
        
        if extent(ipceArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        return ipceArray[extent(ipceArray)].        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes the first element of an array
        Notes:
        @param ipceArray as character extent, the array
        @return character extent, the array without the first element
    ------------------------------------------------------------------------------*/
    method public static character extent RemoveFirstElement( input ipceArray as character extent ):
        define variable iCount as integer no-undo. 
        
        if extent(ipceArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
            
        do iCount = 1 to extent(ipceArray) - 1: 
            ipceArray[iCount] = ipceArray[iCount + 1].
        end. 
            
        return ipceArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Checks if array contains an element
        Notes:
        @param ipceArray as character extent, the array
        @param ipcElement as character, the element to search for
        @return logical, whether the element exists or not
    ------------------------------------------------------------------------------*/
    method public static logical HasElement( input ipceArray  as character extent, 
                                             input ipcElement as character ):
        define variable iCount as integer no-undo. 
        
        if extent(ipceArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iCount = 1 to extent(ipceArray):
            if ipceArray[iCount] = ipcElement then 
                return true. 
        end. 
            
        return false.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Fills an array with the values provided in a list
        Notes:
        @param ipcList as character, the list
        @param ipcSeparator as character, the list separator
        @return character extent, an array containing the elements of the list
    ------------------------------------------------------------------------------*/
    method public static character extent ListToCharacterExtent( input ipcList      as character, 
                                                                 input ipcSeparator as character ):
        define variable iCount  as integer   no-undo. 
        define variable ceArray as character no-undo extent. 
        
        extent(ceArray) = num-entries(ipcList, ipcSeparator).
        
        do iCount = 1 to num-entries(ipcList, ipcSeparator):
            ceArray[iCount] = entry(iCount, ipcList, ipcSeparator). 
        end. 
            
        return ceArray.        
        
    end method.
    
end class.
