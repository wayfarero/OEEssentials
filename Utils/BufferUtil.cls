/*------------------------------------------------------------------------
    File        : BufferUtil
    Purpose     : Main helper class to handle buffer operations
    Syntax      : 
    Description : 
    Author(s)   : Wayfare
    Created     : Tue Oct 22 14:54:04 EEST 2024
    Notes       : 
----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.BufferUtil:
    
    /*------------------------------------------------------------------------------
        Purpose: Sets the value of a field in the buffer
        Notes:
        @param iphBuffer as handle, the handle of the buffer
        @param ipcFieldName as character, the name of the field
        @param ipcValue as character, the new value to set for the field
        @return logical, true if the value was successfully set, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical SetBufferFieldValue( input iphBuffer    as handle, 
                                                      input ipcFieldName as character, 
                                                      input ipcValue     as character ):
        define variable lSuccess as logical no-undo initial false.
        define variable hField   as handle  no-undo.

        if valid-handle(iphBuffer) then do:
            hField = iphBuffer:buffer-field(ipcFieldName) no-error.
        
            if hField <> ? then
                assign  
                    hField:buffer-value = ipcValue
                    lSuccess            = true.
            else 
                lSuccess = false.
        end.
        
        return lSuccess.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Retrieves the names of all fields in the buffer
        Notes:
        @param iphBuffer as handle, the handle of the buffer
        @return character, a comma-separated string containing all field names
    ------------------------------------------------------------------------------*/
    method public static character GetFieldNames( input iphBuffer as handle ):
        define variable cFieldNames as character no-undo.
        define variable iCount      as integer   no-undo.

        if valid-handle(iphBuffer) then do:
            do iCount = 1 to iphBuffer:num-fields:
                if cFieldNames = "" then
                    cFieldNames = iphBuffer:buffer-field(iCount):name.
                else
                    cFieldNames = cFieldNames + "," + iphBuffer:buffer-field(iCount):name.
            end.
        end.
        
        return cFieldNames.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Retrieves the value of a field in the buffer
        Notes:
        @param iphBuffer as handle, the handle of the buffer
        @param ipcFieldName as character, the name of the field
        @return character, the value of the field as a string
    ------------------------------------------------------------------------------*/
    method public static character GetBufferFieldValue( input iphBuffer    as handle, 
                                                        input ipcFieldName as character ):
        define variable cFieldValue as character no-undo.
        define variable hField      as handle    no-undo.
        
        if valid-handle(iphBuffer) then do:
            hField = iphBuffer:buffer-field(ipcFieldName) no-error.
        
            if hField <> ? then 
                cFieldValue = string(hField:buffer-value).
            else 
                cFieldValue = "".
        end.
        
        return cFieldValue.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Checks if a buffer has a specific field
        Notes:
        @param iphBuffer as handle, the handle of the buffer to check
        @param ipcFieldName as character, the name of the field to check
        @return logical, true if the field exists in the buffer, false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical HasField( input iphBuffer as handle, 
                                           input ipcFieldName as character ):
        define variable lFieldExists as logical no-undo.

        if valid-handle(iphBuffer) then
            lFieldExists = iphBuffer:buffer-field(ipcFieldName) <> ? no-error.
        else
            lFieldExists = false.

        return lFieldExists.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Creates a buffer for the specified table
        Notes:
        @param ipcTableName as character, the name of the table for which the buffer is to be created
        @return handle, a handle to the created buffer
    ------------------------------------------------------------------------------*/
    method public static handle CreateBuffer( input ipcTableName as character ):
        define variable hBuffer as handle no-undo.
        
        create buffer hBuffer for table ipcTableName no-error.
        
        if error-status:error then 
            undo, throw new Progress.Lang.AppError(substitute("Invalid table name: '&1'", ipcTableName), 1).
        
        return hBuffer.
        
    end method.
    
end class.
