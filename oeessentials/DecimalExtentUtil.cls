/*------------------------------------------------------------------------
   File        : DecimalExtentUtil
   Purpose     : Main helper class to handle decimal extent operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Oct 23 14:16:49 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class oeessentials.DecimalExtentUtil: 

    /*------------------------------------------------------------------------------
        Purpose: Add element to array
        Notes:
        @param ipdeeArray as decimal extent, the array
        @param ipiPosition as integer, the position to add the element to
        @param ipdeElement as decimal, the element to add
        @return decimal extent, the array with the added element
    ------------------------------------------------------------------------------*/
    method public static decimal extent AddElement( input ipdeeArray  as decimal extent, 
                                                    input ipiPosition as integer, 
                                                    input ipdeElement as decimal):
        define variable iCount as integer no-undo.
        
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        if ipiPosition > extent(ipdeeArray) or ipiPosition < 1 then 
            undo, throw new Progress.Lang.AppError("Invalid position index.", 1).
        
        iCount = extent(ipdeeArray). 
        
        do while iCount > ipiPosition: 
            assign            
                ipdeeArray[iCount] = ipdeeArray[iCount - 1]
                iCount             = iCount - 1. 
        end.
            
        ipdeeArray[ipiPosition] = ipdeElement.
        
        return ipdeeArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Add element to the array at the last position
        Notes:
        @param ipdeeArray as decimal extent, the array
        @param ipdeElement as decimal, the element to add
        @return decimal extent, the array with the added element
    ------------------------------------------------------------------------------*/
    method public static decimal extent AddElement( input ipdeeArray  as decimal extent,
                                                    input ipdeElement as decimal ):
                                                          
        return AddElement(ipdeeArray, extent(ipdeeArray), ipdeElement).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the first element of an array
        Notes:
        @param ipdeeArray as decimal extent, the array
        @return decimal, the first element of the array
    ------------------------------------------------------------------------------*/
    method public static decimal GetFirstElement( input ipdeeArray as decimal extent ):
        
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
                
        return ipdeeArray[1].        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the last element of an array
        Notes:
        @param ipdeeArray as decimal extent, the array
        @return decimal, the last element of the array
    ------------------------------------------------------------------------------*/
    method public static decimal GetLastElement( input ipdeeArray as decimal extent ):
        
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
            
        return ipdeeArray[extent(ipdeeArray)].        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes the first element of an array
        Notes:
        @param ipdeeArray as decimal extent, the array
        @return decimal extent, the array without the first element
    ------------------------------------------------------------------------------*/
    method public static decimal extent RemoveFirstElement( input ipdeeArray as decimal extent ):
        define variable iCount as integer no-undo. 
        
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iCount = 1 to extent(ipdeeArray) - 1: 
            ipdeeArray[iCount] = ipdeeArray[iCount + 1].
        end. 
            
        return ipdeeArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Checks if array contains an element
        Notes:
        @param ipdeeArray as decimal extent, the array
        @param ipdeElement as decimal, the element to search for
        @return logical, whether the element exists or not
    ------------------------------------------------------------------------------*/
    method public static logical HasElement( input ipdeeArray  as decimal extent, 
                                             input ipdeElement as decimal ):
        define variable iCount as integer no-undo. 
        
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iCount = 1 to extent(ipdeeArray):
            if ipdeeArray[iCount] = ipdeElement then 
                return true. 
        end. 
            
        return false.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Fills an array with the values provided in a list
        Notes:
        @param ipcList as character, the list
        @param ipcSeparator as character, the list separator
        @return decimal extent, an array containing the elements of the list
    ------------------------------------------------------------------------------*/
    method public static decimal extent ListToDecimalExtent( input ipcList      as character, 
                                                             input ipcSeparator as character ):
        define variable iCount   as integer no-undo. 
        define variable deeArray as decimal no-undo extent. 

        extent(deeArray) = num-entries(ipcList, ipcSeparator).
        
        do iCount = 1 to num-entries(ipcList, ipcSeparator):
            deeArray[iCount] = decimal(entry(iCount, ipcList, ipcSeparator)). 
        end. 
            
        return deeArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the minimum value of an array
        Notes:
        @param ipdeArray as decimal extent, the array
        @return decimal, the minimum value of the array
    ------------------------------------------------------------------------------*/
    method public static decimal GetMinValue( input ipdeeArray as decimal extent ):
        define variable iCount as integer no-undo. 
        define variable deMin  as decimal no-undo initial 2147483647.
        
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iCount = 1 to extent(ipdeeArray):
            if ipdeeArray[iCount] < deMin then 
                deMin = ipdeeArray[iCount]. 
        end. 
            
        return deMin.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the maximum value of an array
        Notes:
        @param ipdeeArray as decimal extent, the array
        @return decimal, the maximum value of the array
    ------------------------------------------------------------------------------*/
    method public static decimal GetMaxValue( input ipdeeArray as decimal extent ):
        define variable iCount as integer no-undo. 
        define variable deMax  as decimal no-undo initial -2147483648.
        
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iCount = 1 to extent(ipdeeArray):
            if ipdeeArray[iCount] > deMax then 
                deMax = ipdeeArray[iCount]. 
        end. 
            
        return deMax.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the sum of all the elements of an array
        Notes:
        @param ipdeeArray as decimal extent, the array
        @return decimal, the sum of the array
    ------------------------------------------------------------------------------*/
    method public static decimal GetSum( input ipdeeArray as decimal extent ):
        define variable iCount as integer no-undo. 
        define variable deSum  as decimal no-undo initial 0.
        
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iCount = 1 to extent(ipdeeArray):
            deSum = deSum + ipdeeArray[iCount]. 
        end. 
            
        return deSum.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the average of all elements in an array
        Notes:
        @param ipdeeArray as decimal extent, the array
        @return decimal, the average of the array
    ------------------------------------------------------------------------------*/
    method public static decimal GetAverage( input ipdeeArray as decimal extent ):
         
        if extent(ipdeeArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
           
        return GetSum(ipdeeArray) / extent(ipdeeArray).        
        
    end method.

end class.
