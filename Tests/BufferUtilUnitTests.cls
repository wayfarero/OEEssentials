/*------------------------------------------------------------------------
   File        : BufferUtilUnitTests
   Purpose     : Unit test class for BufferUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Tue Oct 22 15:54:28 EEST 2024
   Notes       : 
----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.BufferUtil.

class Tests.BufferUtilUnitTests:
    
    {ttBufferUtilTestData.i}
    
    define private variable ghBuffer as handle no-undo.
    
    @Setup.
    method public void SetUp():
        
        temp-table ttBufferUtilTestData:read-json ("file","Tests/TestData/BufferUtilData.json", "empty").
        
        find first ttBufferUtilTestData no-lock.
        
        ghBuffer = buffer ttBufferUtilTestData:handle.
            
    end method.
    
    @TearDown.
    method public void TearDown():
        
        delete object ghBuffer no-error.
                
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the CreateBuffer method to ensure a valid buffer is created.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCreateBufferValidData():
        
        ghBuffer = BufferUtil:CreateBuffer("Customer").

        Assert:IsTrue(valid-handle(ghBuffer), "CreateBuffer should create a valid buffer").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the CreateBuffer method to ensure the correct exception is thrown.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCreateBufferInvalidData():
        
        ghBuffer = BufferUtil:CreateBuffer("InvalidTableName").
        
        Assert:RaiseError("Should throw error!").
        
        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid table name: 'InvalidTableName'", trim(err:GetMessage(1))).
        end catch.
        
   end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetBufferFieldValue method when retrieving an invalid field value.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetBufferFieldValueFail(  ):
        define variable cFieldValue as character no-undo.
        
        cFieldValue = BufferUtil:GetBufferFieldValue(ghBuffer, "InvalidField").

        Assert:IsTrue(cFieldValue = "", "GetBufferFieldValue should return empty for invalid field").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetBufferFieldValue method to retrieve the value of a valid field.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetBufferFieldValueSuccess(  ):
        define variable cFieldValue as character no-undo.
        
        cFieldValue = BufferUtil:GetBufferFieldValue(ghBuffer, "Field3").
        
        Assert:IsTrue(cFieldValue = "Test3", "GetBufferFieldValue should return '123'").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetFieldNames method when the buffer is invalid.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFieldNameFail(  ):
        define variable cFieldNames    as character no-undo.
        define variable expectedFields as character no-undo.

        ghBuffer = ?.
        
        cFieldNames = BufferUtil:GetFieldNames(ghBuffer).

        expectedFields = "Field1,Field2,Field3".

        Assert:IsTrue(cFieldNames = "", "GetFieldNames should return empty string for invalid buffer").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GetFieldNames method to retrieve field names from the buffer.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetFieldNamesSuccess():
        define variable cFieldNames    as character no-undo.
        define variable expectedFields as character no-undo.
        define variable actualField    as character no-undo.
        define variable iCount         as integer   no-undo.

        cFieldNames = BufferUtil:GetFieldNames(ghBuffer).

        expectedFields = "Field1,Field2,Field3".

        do iCount = 1 to num-entries(expectedFields, ","):
            actualField = entry(iCount, cFieldNames, ",").
            Assert:IsTrue(actualField = entry(iCount, expectedFields, ","), "Field name should match expected field").
        end.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the HasField method when checking for a non-existent field.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasFieldFalse():
        define variable lFieldExists as logical no-undo.

        lFieldExists = BufferUtil:HasField(ghBuffer, "InvalidField").

        Assert:IsFalse(lFieldExists, "HasField should return false for non-existent field").
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the HasField method to check if a valid field exists in the buffer.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestHasFieldTrue():
        define variable lFieldExists as logical no-undo.

        lFieldExists = BufferUtil:HasField(ghBuffer, "Field2").

        Assert:IsTrue(lFieldExists, "HasField should return true if field exists").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the SetBufferFieldValue method when the field is set successfully.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSetBufferFieldValueTrue():
        define variable lSuccess as logical no-undo.
        
        lSuccess = BufferUtil:SetBufferFieldValue(ghBuffer, "Field1", "Test").
        
        Assert:Equals(ghBuffer:buffer-field ("Field1"):buffer-value, "Test"). 
        Assert:IsTrue(lSuccess, "SetBufferFieldValue should return true when valid field is set").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the SetBufferFieldValue method when setting an invalid field.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSetBufferFieldValueFalse():
        define variable lSuccess as logical no-undo.
        
        lSuccess = BufferUtil:SetBufferFieldValue(ghBuffer, "InvalidField", "99999").
        
        Assert:IsFalse(lSuccess, "SetBufferFieldValue should return true when valid field is set").
        
    end method.

end class.
