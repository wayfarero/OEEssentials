/*------------------------------------------------------------------------
   File        : MemptrUtil
   Purpose     : Main helper class to handle memptr operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Mon Nov 25 10:35:24 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class oeessentials.MemptrUtil:

    /*------------------------------------------------------------------------------
        Purpose: Determines if the given memptr is null (unallocated or zero size)
        Notes:
        @param ipmptrPointer as memptr, the memptr to check
        @return logical, TRUE if null, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNull( input ipmptrPointer as memptr ):
        
        return get-size(ipmptrPointer) = 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Determines if the given memptr is not null (allocated and non-zero size)
        Notes:
        @param ipmptrPointer as memptr, the memptr to check
        @return logical, TRUE if not null, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNull( input ipmptrPointer as memptr ):
        
        return not (get-size(ipmptrPointer) = 0).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Allocates memory for a memptr with the specified size
        Notes:
        @param iopmptrPointer as memptr, the memptr to allocate memory for
        @param ipiSize as integer, the size in bytes to allocate
    ------------------------------------------------------------------------------*/
    method public static void AllocateMemory( input-output iopmptrPointer as memptr, 
                                              input ipiSize               as integer ):
        
        set-size(iopmptrPointer) = ipiSize.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Frees the allocated memory for a memptr
        Notes:
        @param iopmptrPointer as memptr, the memptr to free memory for
    ------------------------------------------------------------------------------*/
    method public static void FreeMemory( input-output iopmptrPointer as memptr ):
        
        set-size(iopmptrPointer) = 0.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Retrieves the size of the memory block pointed to by the memptr
        Notes:
        @param ipmptrPointer as memptr, the memptr to check
        @return int64, the size of the memory block in bytes
    ------------------------------------------------------------------------------*/
    method public static int64 GetSize( input ipmptrPointer as memptr ):
        
        return get-size(ipmptrPointer).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Copies data from one memptr to another
        Notes:
        @param ipmptrSource as memptr, the source memptr
        @param iopmptrTarget as memptr, the target memptr
        @param ipiSize as integer, the number of bytes to copy
    ------------------------------------------------------------------------------*/
    method public static void CopyMemory( input        ipmptrSource  as memptr,
                                          input-output iopmptrTarget as memptr,
                                          input        ipiSize       as integer ):
        define variable iCount as integer no-undo.

        if get-size(ipmptrSource) < ipiSize or get-size(iopmptrTarget) < ipiSize then
            undo, throw new Progress.Lang.AppError("Insufficient memory size for copy.", 1).

        do iCount = 1 to ipiSize:
            put-byte(iopmptrTarget, iCount) = get-byte(ipmptrSource, iCount).
        end.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Compares two memptr blocks to check if their content is identical
        Notes:
        @param ipmptrPointer1 as memptr, the first memptr
        @param ipmptrPointer2 as memptr, the second memptr
        @param ipiSize as integer, the number of bytes to compare
        @return logical, TRUE if the content is identical, FALSE otherwise
    ------------------------------------------------------------------------------*/
    method public static logical CompareMemory( input ipmptrPointer1 as memptr, 
                                                input ipmptrPointer2 as memptr, 
                                                input ipiSize        as integer ):
        define variable iCount as integer no-undo.

        if get-size(ipmptrPointer1) < ipiSize or get-size(ipmptrPointer2) < ipiSize then
            undo, throw new Progress.Lang.AppError("Insufficient memory size for comparison.", 1).

        do iCount = 1 to ipiSize:
            if get-byte(ipmptrPointer1, iCount) <> get-byte(ipmptrPointer2, iCount) then
                return false.
        end.

        return true.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts the contents of a memptr to a string
        Notes:
        @param ipmptrPointer as memptr, the memptr to convert
        @return character, the string representation of the memptr contents
    ------------------------------------------------------------------------------*/
    method public static character ToString( input ipmptrPointer as memptr ):
        define variable cResult as character no-undo.
        define variable iCount  as integer   no-undo.

        do iCount = 1 to get-size(ipmptrPointer):
            cResult = cResult + chr(get-byte(ipmptrPointer, iCount)).
        end.

        return cResult.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Converts a string into a memptr
        Notes:
        @param ipcData as character, the string to convert
        @param iopmptrPointer as memptr, the memptr to populate with string data
    ------------------------------------------------------------------------------*/
    method public static void FromString( input        ipcData        as character, 
                                          input-output iopmptrPointer as memptr ):
        define variable iCount as integer no-undo.

        set-size(iopmptrPointer) = length(ipcData).
        do iCount = 1 to length(ipcData):
            put-byte(iopmptrPointer, iCount) = asc(substring(ipcData, iCount, 1)).
        end.
        
    end method.
    
end class.
