/*------------------------------------------------------------------------
   File        : FileUtilUnitTest
   Purpose     : Unit test class for FileUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Thu Oct 24 13:17:45 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using oeessentials.FileUtil.
 
class Tests.FileUtilUnitTest: 
      
    /*------------------------------------------------------------------------------
        Purpose: Test CopyFile method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCopyFile():
        define variable cSourcePath as character no-undo.
        define variable cTargetPath as character no-undo.
        define variable cFileName   as character no-undo.
         
        //Source does not exist
        cSourcePath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\NoFolder").
        
        Assert:Equals(FileUtil:CopyFile(cSourcePath, cTargetPath, ""), false).
 
        //Target does not exist
        assign
            cSourcePath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\FileToCopy.txt")
            cTargetPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\NoFolder").
 
        Assert:Equals(FileUtil:CopyFile(cSourcePath, cTargetPath, ""), false).
 
        //Source is a directory, not a file
        assign
            cSourcePath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile")
            cTargetPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile").
 
        Assert:Equals(FileUtil:CopyFile(cSourcePath, cTargetPath, ""), false).
 
        //Target is a directory, not a file
        assign
            cSourcePath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\FileToCopy.txt")
            cTargetPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\FolderToCopyTo").
 
        Assert:Equals(FileUtil:CopyFile(cSourcePath, cTargetPath, ""), true).
 
        file-info:file-name = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\FolderToCopyTo\\FileToCopy.txt").
        Assert:NotEmpty(file-info:full-pathname).
 
        this-object:DeleteFile(file-info:file-name).
 
        //Copy in the same folder
        assign
            cTargetPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile")
            cFileName   = "Copy.txt".
 
        Assert:Equals(FileUtil:CopyFile(cSourcePath, cTargetPath, cFileName), true).
 
        file-info:file-name = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\Copy.txt").
 
        Assert:NotEmpty(file-info:full-pathname).
 
        this-object:DeleteFile(file-info:file-name).
 
        //Copy in different folder
        cSourcePath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\FileToCopy.txt").
        cTargetPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\FolderToCopyTo").
 
        Assert:Equals(FileUtil:CopyFile(cSourcePath, cTargetPath, cFileName), true).
 
        file-info:file-name = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CopyFile\\FolderToCopyTo\\Copy.txt").
        Assert:NotEmpty(file-info:full-pathname).
 
        this-object:DeleteFile(file-info:file-name).
 
    end method.
     
    /*------------------------------------------------------------------------------
        Purpose: Test CreateFolder method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCreateFolder():
        define variable cPath as character no-undo.
        define variable cName as character no-undo. 
         
        //Path does not exist
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestDataWrongPath\\CreateFolder\\NoFolder").
         
        Assert:Equals(FileUtil:CreateFolder(cPath), false).
         
        //Folder already exits
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CreateFolder\\AlreadyExists").
 
        Assert:Equals(FileUtil:CreateFolder(cPath), true).
 
        //Create folder
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CreateFolder\\NewFolder").
 
        Assert:Equals(FileUtil:CreateFolder(cPath), true).
 
        file-info:file-name = FileUtil:NormalizePath("Tests\\FileUtilTestData\\CreateFolder\\NewFolder").
 
        Assert:NotEmpty(file-info:full-pathname).
 
        this-object:DeleteFile(file-info:file-name).
                 
    end method.   
     
    /*------------------------------------------------------------------------------
        Purpose: Test GetParentFolder method when path is invalid
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetParentFolderInvalidPath():
        define variable cPath as character no-undo.
         
        cPath = "".
        
        FileUtil:GetParentFolder(cPath).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid file path.", trim(err:GetMessage(1))).
        end catch.
        
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetParentFolder method when path is valid
    ------------------------------------------------------------------------------*/   
    @Test.
    method public void TestGetParentFolderValidPath():
        define variable cPath as character no-undo.
        
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\\GetParentFolder\\Folder1\\Folder2\\\File.txt").
        
        Assert:NotNull(index(FileUtil:GetParentFolder(cPath), "Tests/FileUtilTestData/GetParentFolder/Folder1/Folder2")).

    end method. 
     
    /*------------------------------------------------------------------------------
        Purpose: Test GetOSFileSeparator method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetOSFileSeparator():
         
        Assert:NotEmpty(FileUtil:GetOSFileSeparator()).
     
    end method.   
     
    /*------------------------------------------------------------------------------
        Purpose: Test FolderExists method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestFolderExists():
        define variable cPath as character no-undo. 
        
        cPath = "".
        Assert:Equals(FileUtil:FolderExists(cPath), false).
 
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\FolderExits\\NoFolder").
        Assert:Equals(FileUtil:FolderExists(cPath), false).
 
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\FolderExists").
        Assert:Equals(FileUtil:FolderExists(cPath), true).
     
    end method. 
     
    /*------------------------------------------------------------------------------
        Purpose: Test DeleteFolder method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestDeleteFolder():
        define variable cPath as character no-undo. 
         
        cPath = "".
        Assert:Equals(FileUtil:DeleteFolder(cPath), false).
 
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\DeleteFolder\\NoFolder").
        Assert:Equals(FileUtil:DeleteFolder(cPath), false).
         
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\DeleteFolder\\FolderToDelete").
        Assert:Equals(FileUtil:DeleteFolder(cPath), true).
 
        FileUtil:CreateFolder(FileUtil:NormalizePath("Tests\\FileUtilTestData\\DeleteFolder\\FolderToDelete")).
        FileUtil:CopyFile(FileUtil:NormalizePath("Tests\\FileUtilTestData\\DeleteFolder\\file.txt"), FileUtil:NormalizePath("Tests\\FileUtilTestData\\DeleteFolder\\FolderToDelete"), "").
     
    end method.   
     
    /*------------------------------------------------------------------------------
        Purpose: Test GetFileExtension method when path is invalid
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFileExtensionInvalidPath():
        define variable cPath as character no-undo. 
         
        cPath = "".
        
        FileUtil:GetFileExtension(cPath).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid file path or file type.", trim(err:GetMessage(1))).
        end catch.

    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetFileExtension method when file is invalid
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFileExtensionInvalidFile():
        define variable cPath as character no-undo. 
        
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\GetFileExtension\\NoFile.txt").
                 
        FileUtil:GetFileExtension(cPath).
        
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid file path or file type.", trim(err:GetMessage(1))).
        end catch.

    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetFileExtension method when path and file are valid
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFileExtensionValidPath():
        define variable cPath as character no-undo. 
         
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\GetFileExtension\\file1.txt").
        Assert:Equals(FileUtil:GetFileExtension(cPath), "txt").

        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\GetFileExtension\\file2.docx").
        Assert:Equals(FileUtil:GetFileExtension(cPath), "docx").

        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\GetFileExtension\\file3.bmp").
        Assert:Equals(FileUtil:GetFileExtension(cPath), "bmp").
     
    end method.   
     
    /*------------------------------------------------------------------------------
        Purpose: Test MoveFile method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestMoveFile():
        define variable cSourcePath as character no-undo. 
        define variable cTargetPath as character no-undo. 
         
        assign 
            cSourcePath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\MoveFile\\file.txt")
            cTargetPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\MoveFile\\Folder").
         
        Assert:Equals(FileUtil:MoveFile(cSourcePath, cTargetPath), true).
         
        FileUtil:MoveFile(FileUtil:NormalizePath("Tests\\FileUtilTestData\\MoveFile\\Folder\\file.txt"), FileUtil:NormalizePath("Tests\\FileUtilTestData\\MoveFile")).
         
    end method.   
     
    /*------------------------------------------------------------------------------
        Purpose: Test FindFile method when path is invalid
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestFindFileInvalidPath():
        define variable cPath as character no-undo. 
         
        cPath = "". 
        
        FileUtil:FindFile(cPath).
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid file path.", trim(err:GetMessage(1))).
        end catch.       
         
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Test FindFile method when path is valid
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestFindFileValidPath():
        define variable cPath as character no-undo. 
         
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\FindFile\\file.txt").
        Assert:NotEmpty(FileUtil:FindFile(cPath)).
         
    end method. 
     
    /*------------------------------------------------------------------------------
        Purpose: Test DeleteEmptyFolders method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestDeleteEmptyFolders():
        define variable cPath as character no-undo. 
         
        cPath = FileUtil:NormalizePath("Tests\\FileUtilTestData\\DeleteEmptyFolders"). 
        
        FileUtil:DeleteEmptyFolders(cPath).

        file-info:file-name = FileUtil:NormalizePath("Tests\\FileUtilTestData\\DeleteEmptyFolders\\Empty\\Empty1").
        Assert:Equals(file-info:full-pathname, ?).
         
    end method. 
    
    /*------------------------------------------------------------------------------
        Purpose: Test NormalizePath method for Windows
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestNormalizePathWindows():
        define variable cWindowsPath as character no-undo. 
         
        cWindowsPath = "Path1~\Path2~\Path3". 
         
        Assert:Equals(FileUtil:NormalizePath(cWindowsPath), "Path1/Path2/Path3").
         
    end method.    
    
    /*------------------------------------------------------------------------------
        Purpose: Test NormalizePath method for Unix
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestNormalizePathUnix():
        define variable cUnixPath as character no-undo. 
         
        cUnixPath = "Path1/Path2/Path3". 
         
        Assert:Equals(FileUtil:NormalizePath(cUnixPath), "Path1/Path2/Path3").
         
    end method.     
     
    /*------------------------------------------------------------------------------
        Purpose: Deletes files created during unit testing
    ------------------------------------------------------------------------------*/
    method private void DeleteFile(pcFilePath as character):
         
        file-info:file-name = pcFilePath. 
         
        if file-info:full-pathname = "" then 
            return.
         
        os-delete value(pcFilePath).        
         
    end method. 
     
end class.
