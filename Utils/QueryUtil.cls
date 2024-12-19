/*------------------------------------------------------------------------
   File        : QueryUtil
   Purpose     : Main helper class to handle dynamic query operations
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Tue Oct 29 12:03:58 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.QueryUtil:
    
    /*------------------------------------------------------------------------------
        Purpose: Initializes a dynamic query on the given table
        Notes:
        @return handle, the handle of the created query
    ------------------------------------------------------------------------------*/
    method public static handle InitQuery():
        define variable hQuery as handle no-undo.

        create query hQuery.

        return hQuery.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Adds a buffer to an existing query
        Notes:
        @param iphQuery as handle, the existing query handle
        @param ipcTableName as character, the name of the table to add
        @return handle, the handle of the query
    ------------------------------------------------------------------------------*/
    method public static handle AddBuffer( input iphQuery     as handle, 
                                           input ipcTableName as character ):
        define variable hBuffer as handle no-undo.
        
        if valid-handle (iphQuery) then do:
            create buffer hBuffer for table ipcTableName no-error.
            
            if error-status:error then 
                undo, throw new Progress.Lang.AppError(substitute("Invalid table name: '&1'", ipcTableName), 1).
            
            iphQuery:add-buffer(hBuffer).
        end.
        
        return iphQuery.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Retrieves the sort criteria from a given query string
        Notes: Assumes "BY" is used for the sorting expression and extracts it
        @param ipcQuery as character, the full query string
        @return character, the sorting expression after "BY" or an empty string if not found
    ------------------------------------------------------------------------------*/
    method public static character GetQuerySort( input ipcQuery as character ):
        define variable iPos as integer no-undo.
    
        iPos = index(ipcQuery, " BY ").
        
        if iPos > 0 then
            return substring(ipcQuery, iPos + 4).
        else
            return "".
            
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Appends the sorting expression to the query string
        Notes:
        @param ipcQuery as character, the existing query string
        @param ipcSortExpression as character, the sorting expression to add
        @return character, the modified query string with the appended sort expression
    ------------------------------------------------------------------------------*/
    method public static character SetQuerySort( input ipcQuery          as character, 
                                                 input ipcSortExpression as character ):
        
        return substitute("&1 BY &2", ipcQuery, ipcSortExpression).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Prepares the query with sorting and filtering expressions
        Notes:
        @param ipcTableName as character, the table name
        @param ipcFilterExpression as character, the filter expression to add
        @param ipcSortExpression as character, the sorting expression to add
        @return character, the complete query string with WHERE and BY clauses
    ------------------------------------------------------------------------------*/
    method public static character PrepareQuery( input ipcTableName        as character, 
                                                 input ipcFilterExpression as character, 
                                                 input ipcSortExpression   as character ):
        define variable cQuery as character no-undo.

        cQuery = substitute("FOR EACH &1 &2 &3", ipcTableName,
            (if ipcFilterExpression <> "" then "WHERE " + ipcFilterExpression else ""),
            (if ipcSortExpression <> "" then "BY " + ipcSortExpression else "")).

        return cQuery.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Adds a filtering expression to the query
        Notes:
        @param ipcQuery as character, the existing query string
        @param ipcExpressionForField as character, the filter expression to add
        @return character, the modified query with the appended filter expression
    ------------------------------------------------------------------------------*/
    method public static character AddExpression( input ipcQuery              as character, 
                                                  input ipcExpressionForField as character ):

        return substitute("&1 &2", ipcQuery, ipcExpressionForField).

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Retrieves the expression for a specified field in the WHERE clause of the query
        Notes:
        @param ipcQuery as character, the existing query string
        @param ipcField as character, the field to locate
        @return character, the filter expression for the field or "" if not found
    ------------------------------------------------------------------------------*/
    method public static character GetExpressionForField( input ipcQuery as character,
                                                          input ipcField as character ):
        define variable iWherePos   as integer   no-undo.
        define variable iByPos      as integer   no-undo.
        define variable iFieldPos   as integer   no-undo.
        define variable iEntryEnd   as integer   no-undo.
        define variable cExpression as character no-undo.
            
        assign     
            iWherePos = index(ipcQuery, " WHERE ")
            iByPos    = index(ipcQuery, " BY ").

        if iWherePos > 0 then
            ipcQuery = substring(ipcQuery, iWherePos + 7, (if iByPos > 0 then iByPos - iWherePos - 7 else length(ipcQuery))).

        iFieldPos = index(ipcQuery, ipcField + " ").
        
        if iFieldPos > 0 then do:
            iEntryEnd = min(index(ipcQuery, " AND ", iFieldPos), index(ipcQuery, " OR ", iFieldPos)).
            
            if iEntryEnd = 0 then
                iEntryEnd = length(ipcQuery) + 1.

            cExpression = substring(ipcQuery, iFieldPos, iEntryEnd - iFieldPos).
            
            return trim(cExpression).
        end.

        return "".
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Removes the expression for a specified field from the query
        Notes:
        @param ipcQuery as character, the existing query string
        @param ipcField as character, the field to remove
        @return character, the modified query string without the specified field expression
    ------------------------------------------------------------------------------*/
    method public static character RemoveExpressionForField( input ipcQuery as character, 
                                                             input ipcField as character ):
        define variable iPos         as integer   no-undo.
        define variable cWhereClause as character no-undo.
        define variable iFieldPos    as integer   no-undo.
        define variable iEndPos      as integer   no-undo.

        iPos = index(ipcQuery, " WHERE ").
        
        if iPos > 0 then 
            cWhereClause = substring(ipcQuery, iPos).
        else 
            return ipcQuery.
            
        iFieldPos = index(cWhereClause, ipcField + " ").
        
        if iFieldPos > 0 then do:
            iEndPos = min(
                          if index(cWhereClause, " AND ", iFieldPos) > 0 then index(cWhereClause, " AND ", iFieldPos) else length(cWhereClause) + 1,
                          if index(cWhereClause, " OR ", iFieldPos) > 0 then index(cWhereClause, " OR ", iFieldPos) else length(cWhereClause) + 1
                         ).

            cWhereClause = replace(cWhereClause, substring(cWhereClause, iFieldPos, iEndPos - iFieldPos), "").
        
            if trim(cWhereClause) = "WHERE" then
                cWhereClause = "".
            else if index(cWhereClause, "WHERE  AND ") > 0 then
                cWhereClause = replace(cWhereClause, "WHERE  AND ", "WHERE ").
            else if index(cWhereClause, "WHERE  OR ") > 0 then
                cWhereClause = replace(cWhereClause, "WHERE  OR ", "WHERE ").
        end.

        return trim(substring(ipcQuery, 1, iPos - 1)) + " " + trim(cWhereClause).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Retrieves the number of results from the provided query string and buffers
        Notes:
        @param ipcQuery as character, the query string
        @param ipcBufferNames as character, comma-separated buffer names to add to the query
        @return int64, the count of results matching the query
    ------------------------------------------------------------------------------*/
    method public static int64 GetNumberOfResultsFromQuery( input ipcQuery       as character,
                                                            input ipcBufferNames as character ):
        define variable hQuery         as handle    no-undo.
        define variable i64ResultCount as int64     no-undo.
        define variable hBuffer        as handle    no-undo.
        define variable iCount         as integer   no-undo.
        define variable iPos           as integer   no-undo.
        define variable cModifiedQuery as character no-undo.

        create query hQuery.

        do iCount = 1 to num-entries(ipcBufferNames, ","):
            create buffer hBuffer for table entry(iCount, ipcBufferNames, ",") no-error.
            
            if error-status:error then
                undo, throw new Progress.Lang.AppError(substitute("Invalid table name: '&1'", entry(iCount, ipcBufferNames, ",")), 1).
    
            hQuery:add-buffer(hBuffer).
        end.
        
        iPos = index(ipcQuery, "FOR").
        
        if iPos > 0 then
            cModifiedQuery = substring(ipcQuery, 1, iPos - 1) +
                             "PRESELECT" +
                             substring(ipcQuery, iPos + length("FOR")).
        else
            cModifiedQuery = ipcQuery.
            
        hQuery:query-prepare(string(cModifiedQuery)).
        hQuery:query-open().
        
        i64ResultCount = hQuery:num-results.

        hQuery:query-close().
        
        return i64ResultCount.
        
        finally:
            delete object hQuery no-error.
            delete object hBuffer no-error.
        end finally.
        
    end method.

end class.
