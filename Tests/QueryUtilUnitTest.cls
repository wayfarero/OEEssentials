/*------------------------------------------------------------------------
   File        : QueryUtilUnitTest
   Purpose     : Unit Test class for QueryUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Tue Nov 05 10:34:17 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.QueryUtil.

class Tests.QueryUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test InitQuery for creating a query handle
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestInitQuery():
        define variable hQuery as handle no-undo.

        hQuery = QueryUtil:InitQuery().

        Assert:NotNull(hQuery, "Query handle should not be null after InitQuery.").

        delete object hQuery no-error.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test AddBuffer for adding a buffer to the query
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddBuffer():
        define variable hQuery as handle no-undo.

        hQuery = QueryUtil:InitQuery().
        hQuery = QueryUtil:AddBuffer(hQuery, "Customer").

        Assert:NotNull(hQuery, "Query handle should not be null after AddBuffer.").

        delete object hQuery no-error.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test AddBuffer w
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddBufferWhenInvalidTableName():
        define variable hQuery as handle no-undo.

        hQuery = QueryUtil:InitQuery().
        hQuery = QueryUtil:AddBuffer(hQuery, "InvalidTableName").

        Assert:NotNull(hQuery, "Query handle should not be null after AddBuffer.").

        delete object hQuery no-error.

        catch err as Progress.Lang.Error :
            Assert:Equals("Invalid table name: 'InvalidTableName'", trim(err:GetMessage(1))).
        end catch.

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetQuerySort for extracting sort criteria from query string
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetQuerySort():
        define variable cQuery      as character no-undo.
        define variable cSortResult as character no-undo.

        cQuery = "FOR EACH Customer WHERE Country = 'USA' BY Name DESCENDING".
        cSortResult = QueryUtil:GetQuerySort(cQuery).

        Assert:Equals("Name DESCENDING", cSortResult).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test SetQuerySort for adding sort expression to query
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSetQuerySort():
        define variable cQuery         as character no-undo.
        define variable cModifiedQuery as character no-undo.

        cQuery = "FOR EACH Customer WHERE Country = 'USA'".
        cModifiedQuery = QueryUtil:SetQuerySort(cQuery, "Name DESCENDING").

        Assert:Equals("FOR EACH Customer WHERE Country = 'USA' BY Name DESCENDING", cModifiedQuery).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test PrepareQuery for building full query with sorting and filtering
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestPrepareQuery():
        define variable cQuery as character no-undo.

        cQuery = QueryUtil:PrepareQuery("Customer", "Country = 'USA'", "Name DESCENDING").

        Assert:Equals("FOR EACH Customer WHERE Country = 'USA' BY Name DESCENDING", cQuery).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test AddExpression for appending an expression to the query
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestAddExpression():
        define variable cQuery         as character no-undo.
        define variable cModifiedQuery as character no-undo.

        cQuery = "FOR EACH Customer WHERE Country = 'USA'".
        cModifiedQuery = QueryUtil:AddExpression(cQuery, "Status = 'Active'").

        Assert:Equals("FOR EACH Customer WHERE Country = 'USA' Status = 'Active'", cModifiedQuery).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetExpressionForField for retrieving expression of a specific field
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetExpressionForField():
        define variable cQuery      as character no-undo.
        define variable cExpression as character no-undo.

        cQuery = "FOR EACH Customer WHERE Country = 'USA' AND Status = 'Active' BY Name DESCENDING".
        cExpression = QueryUtil:GetExpressionForField(cQuery, "Status").

        Assert:Equals("Status = 'Active'", cExpression).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test RemoveExpressionForField for removing expression for a specific field
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRemoveExpressionForField():
        define variable cQuery         as character no-undo.
        define variable cModifiedQuery as character no-undo.

        cQuery = "FOR EACH Customer WHERE Country = 'USA' AND Status = 'Active' BY Name DESCENDING".
        cModifiedQuery = QueryUtil:RemoveExpressionForField(cQuery, "Country").

        Assert:Equals("FOR EACH Customer WHERE Status = 'Active' BY Name DESCENDING", cModifiedQuery).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test GetNumberOfResultsFromQuery for with a single buffer
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetNumberOfResultsFromQuerySuccess():
        define variable i64Count as int64 no-undo.

        i64Count = QueryUtil:GetNumberOfResultsFromQuery(
            "FOR EACH Customer WHERE Country = 'USA' BY Name DESCENDING",
            "Customer").

        Assert:IsTrue(i64Count > 0, "Expected at least one result for customers in 'USA'.").

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetNumberOfResultsFromQuery with multiple valid buffers
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetNumberOfResultsFromQueryWithInvalidQueryMultipleBuffers():
        define variable cQuery         as character no-undo.
        define variable cBufferNames   as character no-undo.
        define variable i64ResultCount as int64     no-undo.
    
        cQuery = "FOR EACH Customer, EACH Order WHERE Order.Cust-Num = Customer.Cust-Num".
        cBufferNames = "Customer,Order".
    
        i64ResultCount = QueryUtil:GetNumberOfResultsFromQuery(cQuery, cBufferNames).
        
        Assert:IsTrue(i64ResultCount > 0, "Result count should be greater than 0 for multiple buffers.").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetNumberOfResultsFromQuery with an invalid buffer
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetNumberOfResultsFromQueryWithInvalidBufferSingleBuffer():
        define variable i64Count as int64 no-undo.

        i64Count = QueryUtil:GetNumberOfResultsFromQuery(
            "FOR EACH InvalidTable WHERE Field = 'Value' BY Name DESCENDING",
            "InvalidTable"
            ).

        Assert:RaiseError("Should throw error!").

        catch err as Progress.Lang.AppError:
            Assert:Equals("Invalid table name: 'InvalidTable'", err:GetMessage(1)).
        end catch.

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetNumberOfResultsFromQuery with an invalid buffer in multiple buffer names
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGetNumberOfResultsFromQueryWithInvalidBufferMultipleBuffers():
        define variable cQuery       as character no-undo.
        define variable cBufferNames as character no-undo.

        cQuery = "FOR EACH Customer, EACH InvalidTable WHERE Customer.Cust-Num = InvalidTable.Cust-Num".
        cBufferNames = "Customer,InvalidTable".

        QueryUtil:GetNumberOfResultsFromQuery(cQuery, cBufferNames).

        Assert:RaiseError("Should throw error!").

        catch err as Progress.Lang.AppError:
            Assert:Equals("Invalid table name: 'InvalidTable'", err:GetMessage(1)).
        end catch.
        
    end method.
    
end class.
