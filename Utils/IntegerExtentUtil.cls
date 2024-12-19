/*------------------------------------------------------------------------
   File        : IntegerExtentUtil
   Purpose     : Main helper class to handle integer extent operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Oct 23 14:16:49 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.IntegerExtentUtil: 

    /*------------------------------------------------------------------------------
        Purpose: Add an element to an array
        Notes:
        @param ipieArray as integer extent, the array
        @param ipiPosition as integer, the position to add the element to
        @param ipiElement as integer, the element to add
        @return integer extent, the array with the added element
    ------------------------------------------------------------------------------*/
    method public static integer extent AddElement( input ipieArray   as integer extent, 
                                                    input ipiPosition as integer, 
                                                    input ipiElement  as integer ):
        define variable iCount as integer no-undo.
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
                    
        if ipiPosition > extent(ipieArray) or ipiPosition < 1 then 
            undo, throw new Progress.Lang.AppError("Invalid position index.", 1).
        
        iCount = extent(ipieArray). 
        
        do while iCount > ipiPosition: 
            assign            
                ipieArray[iCount] = ipieArray[iCount - 1]
                iCount          = iCount - 1. 
        end.
            
        ipieArray[ipiPosition] = ipiElement.
        
        return ipieArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Add an element to the array at the last position
        Notes:
        @param ipieArray as integer extent, the array
        @param ipiElement as integer, the element to add
        @return integer extent, the array with the added element
    ------------------------------------------------------------------------------*/
    method public static integer extent AddElement( input ipieArray  as integer extent,
                                                    input ipiElement as integer ):
                                                          
        return AddElement(ipieArray, extent(ipieArray), ipiElement).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the first element of an array
        Notes:
        @param ipieArray as integer extent, the array
        @return integer, the first element of the array
    ------------------------------------------------------------------------------*/
    method public static integer GetFirstElement( input ipieArray as integer extent ):
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        return ipieArray[1].        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the last element of an array
        Notes:
        @param ipieArray as integer extent, the array
        @return integer, the last element of the array
    ------------------------------------------------------------------------------*/
    method public static integer GetLastElement( input ipieArray as integer extent ):
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1). 
                   
        return ipieArray[extent(ipieArray)].        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes the first element of an array
        Notes:
        @param ipieArray as integer extent, the array
        @return integer extent, the array without the first element
    ------------------------------------------------------------------------------*/
    method public static integer extent RemoveFirstElement( input ipieArray as integer extent ):
        define variable iCount as integer no-undo. 
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1). 
        
        do iCount = 1 to extent(ipieArray) - 1: 
            ipieArray[iCount] = ipieArray[iCount + 1].
        end. 
            
        return ipieArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Checks if an array contains a specific element
        Notes:
        @param ipieArray as integer extent, the array
        @param ipiElement as integer, the element to search for
        @return logical, whether the element exists in the array
    ------------------------------------------------------------------------------*/
    method public static logical HasElement( input ipieArray  as integer extent, 
                                             input ipiElement as integer ):
        define variable iCount as integer no-undo. 
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1). 
        
        do iCount = 1 to extent(ipieArray):
            if ipieArray[iCount] = ipiElement then 
                return true. 
        end. 
            
        return false.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Fills an array with values provided in a list
        Notes:
        @param ipcList as character, the list of values
        @param ipcSeparator as character, the list separator
        @return integer extent, an array containing the elements of the list
    ------------------------------------------------------------------------------*/
    method public static integer extent ListToIntegerExtent( input ipcList      as character, 
                                                             input ipcSeparator as character ):
        define variable iCount as integer no-undo. 
        define variable iArray as integer no-undo extent. 
        
        if num-entries(ipcList, ipcSeparator) = 0 then 
            undo, throw new Progress.Lang.AppError("Initial list is empty.", 1).
        
        extent(iArray) = num-entries(ipcList, ipcSeparator).
        
        do iCount = 1 to num-entries(ipcList, ipcSeparator):
            iArray[iCount] = integer(entry(iCount, ipcList, ipcSeparator)). 
        end. 
            
        return iArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the minimum value of an array
        Notes:
        @param ipieArray as integer extent, the array
        @return integer, the minimum value in the array
    ------------------------------------------------------------------------------*/
    method public static integer GetMinValue( input ipieArray as integer extent ):
        define variable iCount as integer no-undo. 
        define variable iMin   as integer no-undo initial 2147483647.
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1). 
        
        do iCount = 1 to extent(ipieArray):
            if ipieArray[iCount] < iMin then 
                iMin = ipieArray[iCount]. 
        end. 
            
        return iMin.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the maximum value of an array
        Notes:
        @param ipieArray as integer extent, the array
        @return integer, the maximum value in the array
    ------------------------------------------------------------------------------*/
    method public static integer GetMaxValue( input ipieArray as integer extent ):
        define variable iCount as integer no-undo. 
        define variable iMax   as integer no-undo initial -2147483648.
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1). 
        
        do iCount = 1 to extent(ipieArray):
            if ipieArray[iCount] > iMax then 
                iMax = ipieArray[iCount]. 
        end. 
            
        return iMax.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the sum of all the elements of an array
        Notes:
        @param ipieArray as integer extent, the array
        @return integer, the sum of the array elements
    ------------------------------------------------------------------------------*/
    method public static integer GetSum( input ipieArray as integer extent ):
        define variable iCount as integer no-undo. 
        define variable iSum   as integer no-undo initial 0.
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1). 
        
        do iCount = 1 to extent(ipieArray):
            iSum = iSum + ipieArray[iCount]. 
        end. 
            
        return iSum.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the average of all elements in an array
        Notes:
        @param ipieArray as integer extent, the array
        @return decimal, the average of the array elements
    ------------------------------------------------------------------------------*/
    method public static decimal GetAverage( input ipieArray as integer extent ):
        
        if extent(ipieArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1). 
           
        return GetSum(ipieArray) / extent(ipieArray).        
        
    end method.

end class.
