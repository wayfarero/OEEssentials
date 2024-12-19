/*------------------------------------------------------------------------
   File        : Integer64ExtentUtil
   Purpose     : Main helper class to handle int64 extent operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Oct 23 14:16:49 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.Integer64ExtentUtil: 

    /*------------------------------------------------------------------------------
        Purpose: Add an element to an array
        Notes:
        @param ipi64eArray as int64 extent, the array
        @param ipiPosition as integer, the position to add the element to
        @param ipi64Element as int64, the element to add
        @return int64 extent, the array with the added element
    ------------------------------------------------------------------------------*/
    method public static int64 extent AddElement( input ipi64eArray  as int64 extent, 
                                                  input ipiPosition  as integer, 
                                                  input ipi64Element as int64 ):
        define variable iNum as integer no-undo.
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        if ipiPosition > extent(ipi64eArray) or ipiPosition < 1 then 
            undo, throw new Progress.Lang.AppError("Invalid position index.", 1).
        
        iNum = extent(ipi64eArray). 
        
        do while iNum > ipiPosition: 
            assign            
                ipi64eArray[iNum] = ipi64eArray[iNum - 1]
                iNum              = iNum - 1. 
        end.
            
        ipi64eArray[ipiPosition] = ipi64Element.
        
        return ipi64eArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Add an element to the array at the last position
        Notes:
        @param ipi64eArray as int64 extent, the array
        @param ipi64Element as int64, the element to add
        @return int64 extent, the array with the added element
    ------------------------------------------------------------------------------*/
    method public static int64 extent AddElement( input ipi64eArray  as int64 extent,
                                                  input ipi64Element as int64 ):
                                                          
        return AddElement(ipi64eArray, extent(ipi64eArray), ipi64Element).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the first element of an array
        Notes:
        @param ipi64eArray as int64 extent, the array
        @return int64, the first element of the array
    ------------------------------------------------------------------------------*/
    method public static int64 GetFirstElement( input ipi64eArray as int64 extent ):
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        return ipi64eArray[1].        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the last element of an array
        Notes:
        @param ipi64eArray as int64 extent, the array
        @return int64, the last element of the array
    ------------------------------------------------------------------------------*/
    method public static int64 GetLastElement( input ipi64eArray as int64 extent ):
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
            
        return ipi64eArray[extent(ipi64eArray)].        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Removes the first element of an array
        Notes:
        @param ipi64eArray as int64 extent, the array
        @return int64 extent, the array without the first element
    ------------------------------------------------------------------------------*/
    method public static int64 extent RemoveFirstElement( input ipi64eArray as int64 extent ):
        define variable iNum as integer no-undo. 
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iNum = 1 to extent(ipi64eArray) - 1: 
            ipi64eArray[iNum] = ipi64eArray[iNum + 1].
        end. 
            
        return ipi64eArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Checks if an array contains a specific element
        Notes:
        @param ipi64eArray as int64 extent, the array
        @param ipi64Element as int64, the element to search for
        @return logical, whether the element exists in the array
    ------------------------------------------------------------------------------*/
    method public static logical HasElement( input ipi64eArray  as int64 extent, 
                                             input ipi64Element as int64 ):
        define variable iNum as integer no-undo. 
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iNum = 1 to extent(ipi64eArray):
            if ipi64eArray[iNum] = ipi64Element then 
                return true. 
        end. 
            
        return false.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Fills an array with values provided in a list
        Notes:
        @param ipcList as character, the list of values
        @param ipcSeparator as character, the list separator
        @return int64 extent, an array containing the elements of the list
    ------------------------------------------------------------------------------*/
    method public static int64 extent ListToInt64Extent( input ipcList      as character, 
                                                         input ipcSeparator as character ):
        define variable iNum   as integer no-undo. 
        define variable iArray as int64   no-undo extent. 
        
        if num-entries(ipcList, ipcSeparator) = 0 then 
            undo, throw new Progress.Lang.AppError("Initial list is empty.", 1).

        extent(iArray) = num-entries(ipcList, ipcSeparator).
        
        do iNum = 1 to num-entries(ipcList, ipcSeparator):
            iArray[iNum] = int64(entry(iNum, ipcList, ipcSeparator)). 
        end. 
            
        return iArray.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the minimum value of an array
        Notes:
        @param ipi64eArray as int64 extent, the array
        @return int64, the minimum value in the array
    ------------------------------------------------------------------------------*/
    method public static int64 GetMinValue(input ipi64eArray as int64 extent):
        define variable iNum as integer no-undo. 
        define variable iMin as int64   no-undo initial 2147483647.
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iNum = 1 to extent(ipi64eArray):
            if ipi64eArray[iNum] < iMin then 
                iMin = ipi64eArray[iNum]. 
        end. 
            
        return iMin.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the maximum value of an array
        Notes:
        @param ipi64eArray as int64 extent, the array
        @return int64, the maximum value in the array
    ------------------------------------------------------------------------------*/
    method public static int64 GetMaxValue(input ipi64eArray as int64 extent):
        define variable iNum as integer no-undo. 
        define variable iMax as int64   no-undo initial -2147483648.
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iNum = 1 to extent(ipi64eArray):
            if ipi64eArray[iNum] > iMax then 
                iMax = ipi64eArray[iNum]. 
        end. 
            
        return iMax.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the sum of all the elements of an array
        Notes:
        @param ipi64eArray as int64 extent, the array
        @return int64, the sum of the array elements
    ------------------------------------------------------------------------------*/
    method public static int64 GetSum( input ipi64eArray as int64 extent ):
        define variable iNum as integer no-undo. 
        define variable iSum as int64   no-undo initial 0.
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
        
        do iNum = 1 to extent(ipi64eArray):
            iSum = iSum + ipi64eArray[iNum]. 
        end. 
            
        return iSum.        
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Returns the average of all elements in an array
        Notes:
        @param ipi64eArray as int64 extent, the array
        @return decimal, the average of the array elements
    ------------------------------------------------------------------------------*/
    method public static decimal GetAverage( input ipi64eArray as int64 extent ):
        
        if extent(ipi64eArray) = ? then
            undo, throw new Progress.Lang.AppError("Invalid array extent.", 1).
           
        return GetSum(ipi64eArray) / extent(ipi64eArray).        
        
    end method.

end class.
