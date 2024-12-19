/*------------------------------------------------------------------------
   File        : FileUtil
   Purpose     : Main helper class to handle file operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Thu Oct 24 13:13:38 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/
  
block-level on error undo, throw.

class Utils.FileUtil: 
    
    /*------------------------------------------------------------------------------
        Purpose: Copy a file from one location to another
        Notes:
        @param ipcSourcePath as character, the path for the file to copy
        @param ipcTargetPath as character, the path where the file will be copied
        @param ipcFileName as character, the name for the copied file
        @return logical, whether the file was successfully copied
    ------------------------------------------------------------------------------*/
    method public static logical CopyFile( input ipcSourcePath as character, 
                                           input ipcTargetPath as character, 
                                           input ipcFileName   as character ):
        
        file-info:file-name = ipcSourcePath.
        
        if file-info:full-pathname = ? then 
            return false.        
        
        file-info:file-name = ipcTargetPath.
        
        if file-info:full-pathname = ? then 
            return false.  
                
        os-copy value(ipcSourcePath) value(ipcTargetPath + NormalizePath("\\") + ipcFileName).
        
        if os-error <> 0 then 
            return false.

        return true.
        
        catch error as Progress.Lang.Error:
             return false.    
        end catch.
            
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Create a new folder
        Notes:
        @param ipcPath as character, the path where to create the folder
        @return logical, whether the folder was successfully created
    ------------------------------------------------------------------------------*/
    method public static logical CreateFolder( input ipcPath as character ):
        
        os-create-dir value(ipcPath).
        
        if os-error <> 0 then 
            return false. 
            
        return true.
                
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Get the parent folder
        Notes:
        @param ipcPath as character, the path to the folder
        @return character, the parent folder for the specified path
    ------------------------------------------------------------------------------*/
    method public static character GetParentFolder( input ipcPath as character ):
        
        if opsys = "UNIX":U then 
            return GetParentFolderUnix(ipcPath).
        else 
            return GetParentFolderWindows(ipcPath).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Get the parent folder for Windows
        Notes:
        @param ipcPath as character, the path to the folder
        @return character, the parent folder for the specified path
    ------------------------------------------------------------------------------*/
    method public static character GetParentFolderWindows( input ipcPath as character ):
        define variable iLastSeparator as integer no-undo. 
        
        ipcPath = replace(ipcPath, "/", "\\").
        
        file-info:file-name = ipcPath.
        
        if file-info:full-pathname = ? then
            undo, throw new Progress.Lang.AppError("Invalid file path.", 1).
            
        assign 
            ipcPath        = file-info:pathname
            iLastSeparator = r-index(ipcPath, chr(92)).
            
        if iLastSeparator > 0 then 
            ipcPath = substring(ipcPath, 1, iLastSeparator - 1).
        else 
            undo, throw new Progress.Lang.AppError("Invalid path separator.", 1).
            
        if ipcPath matches "^[A-Z]:\\$" then 
            undo, throw new Progress.Lang.AppError("File path is root folder.", 1). 
        
        return ipcPath.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Get the parent folder for Unix
        Notes:
        @param ipcPath as character, the path to the folder
        @return character, the parent folder for the specified path
    ------------------------------------------------------------------------------*/
    method public static character GetParentFolderUnix( input ipcPath as character ):
        define variable iLastSeparator as integer no-undo. 
            
        ipcPath = NormalizePath(ipcPath).
        
        file-info:file-name = ipcPath.
        
        if file-info:full-pathname = ? then
            undo, throw new Progress.Lang.AppError("Invalid file path.", 1).
            
        assign 
            ipcPath        = file-info:pathname
            iLastSeparator = r-index(ipcPath, "/").
        
        if iLastSeparator > 0 then 
            ipcPath = substring(ipcPath, 1, iLastSeparator - 1).
        else 
            undo, throw new Progress.Lang.AppError("Invalid path separator.", 1).
            
        if ipcPath = "/" then 
            undo, throw new Progress.Lang.AppError("File path is root folder.", 1). 
        
        return ipcPath.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Get the file separator
        Notes:
        @return character, the file separator
    ------------------------------------------------------------------------------*/
    method public static character GetOSFileSeparator():
        
        return if opsys = "UNIX":U then 
                   "/"
               else 
                   chr(92).
                
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a folder exists
        Notes:
        @param ipcPath as character, the path to the folder
        @return logical, whether the folder exists
    ------------------------------------------------------------------------------*/
    method public static logical FolderExists( input ipcPath as character ):
        
        file-info:file-name = ipcPath.
        
        if file-info:full-pathname = ? or file-info:file-type <> "DRW" then 
            return false. 
        
        return true. 
        
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Delete a folder
        Notes:
        @param ipcPath as character, the path to the folder to delete
        @return logical, whether the folder was successfully deleted
    ------------------------------------------------------------------------------*/
    method public static logical DeleteFolder( input ipcPath as character ):
        
        file-info:file-name = ipcPath.
        
        if file-info:full-pathname = ? then 
            return false. 
            
        os-delete value(ipcPath) recursive.
        
        if os-error <> 0 then 
            return false.
        
        return true.  
        
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Get the file extension
        Notes:
        @param ipcPath as character, the path to the file
        @return character, the file extension
    ------------------------------------------------------------------------------*/
    method public static character GetFileExtension( input ipcPath as character ):
        define variable iPosition      as integer   no-undo.
        define variable cFileExtension as character no-undo.
        
        file-info:file-name = ipcPath.
        
        if file-info:full-pathname = ? or file-info:file-type <> "FRW" then
            undo, throw new Progress.Lang.AppError("Invalid file path or file type.", 1).
            
        iPosition = r-index(ipcPath, ".").
        
        if iPosition > 0 then 
            cFileExtension = substring(ipcPath, iPosition, length(ipcPath)).
         
        if cFileExtension = "" or cFileExtension = ? then
            undo, throw new Progress.Lang.AppError("Invalid file extension.", 1).
        
        return cFileExtension.  
        
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Move a file
        Notes:
        @param ipcSourcePath as character, the path to the file to move
        @param ipcTargetPath as character, the path where to move the file
        @return logical, whether the file was successfully moved
    ------------------------------------------------------------------------------*/
    method public static logical MoveFile( input ipcSourcePath as character, 
                                           input ipcTargetPath as character ):
        
        if CopyFile(ipcSourcePath, ipcTargetPath, "") and DeleteFolder(ipcSourcePath) then
            return true. 
        
        return false. 
        
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Get the full path for the file
        Notes:
        @param ipcPath as character, the path
        @return character, the full path to the file
    ------------------------------------------------------------------------------*/
    method public static character FindFile( input ipcPath as character ):
        
        file-info:file-name = ipcPath.
        
        if file-info:full-pathname = ? then 
            undo, throw new Progress.Lang.AppError("Invalid file path.", 1). 
        
        return file-info:full-pathname. 
        
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Delete all empty folders
        Notes:
        @param ipcPath as character, the path to start the delete process
    ------------------------------------------------------------------------------*/
    method public static void DeleteEmptyFolders( input ipcPath as character ):
        define variable cCommand as character no-undo.  
        
        file-info:file-name = ipcPath.
        
        if file-info:full-pathname = ? then
            return.
        
        if opsys = "UNIX":U then 
            cCommand = substitute("find &1 -type d -empty -delete", ipcPath).
        else 
            cCommand = substitute("robocopy &1 &2 /S /MOVE", ipcPath, ipcPath).
        
        os-command silent value(cCommand).
        
    end method.
 
    /*------------------------------------------------------------------------------
        Purpose: Normalize a path for Unix systems
        Notes:
        @param ipcPath as character, the path to be normalized
        @return character, the normalized path
    ------------------------------------------------------------------------------*/ 
    method public static character NormalizePath( input ipcPath as character ):
        
        ipcPath = replace(ipcPath, chr(92), "/").
        
        return ipcPath.
                
    end method. 
    
end class.
