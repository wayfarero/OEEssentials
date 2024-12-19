 /*------------------------------------------------------------------------
    File        : Int64Util
    Purpose     : Main helper class to handle int64 operations
    Syntax      : 
    Description : 
    Author(s)   : Wayfare
    Created     : Fri Nov 22 15:22:33 EET 2024
    Notes       : 
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

class Utils.Int64Util: 
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given int64 is zero
        Notes:
        @param ipi64Element as int64, the int64 to check
        @return logical, true if it is zero and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsZero( input ipi64Element as int64 ):
        
        return ipi64Element = 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given int64 is different from zero
        Notes:
        @param ipi64Element as int64, the int64 to check
        @return logical, true if it is not zero and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotZero( input ipi64Element as int64 ):
        
        return ipi64Element <> 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given int64 is null
        Notes:
        @param ipi64Element as int64, the int64 to check
        @return logical, true if it is null and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNull( input ipi64Element as int64 ):
        
        return ipi64Element = ?.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given int64 is different from null
        Notes:
        @param ipi64Element as int64, the int64 to check
        @return logical, true if it is not null and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNull( input ipi64Element as int64 ):
        
        return ipi64Element <> ?.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given int64 is null or zero
        Notes:
        @param ipi64Element as int64, the int64 to check
        @return logical, true if it is null or zero and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNullOrZero( input ipi64Element as int64 ):
        
        return ipi64Element = ? or ipi64Element = 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Check if a given int64 is different from null and zero
        Notes:
        @param ipi64Element as int64, the int64 to check
        @return logical, true if it is not null or zero and false otherwise
    ------------------------------------------------------------------------------*/
    method public static logical IsNotNullOrZero( input ipi64Element as int64 ):
        
        return ipi64Element <> ? and ipi64Element <> 0.
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Generate a random int64 within a specified range
        Notes:
        @param ipi64RangeStart as int64, the start of the range
        @param ipi64RangeEnd as int64, the end of the range
        @return int64, the generated random value
    ------------------------------------------------------------------------------*/
    method public static int64 GenerateRandomInt64( input ipi64RangeStart as int64,
                                                    input ipi64RangeEnd   as int64 ):
        define variable iNum            as integer   no-undo.  
        define variable iByteNumber     as integer   no-undo.  
        define variable iAttempts       as integer   no-undo.  
        define variable iMaxAttempts    as integer   no-undo initial 10.  
        define variable i64RandomNumber as int64     no-undo.  
        define variable deTempDec       as decimal   no-undo.  
        define variable cHashValue      as character no-undo.  
        define variable cHashAlgorithm  as character no-undo.  
        define variable rTempRaw        as raw       no-undo.  
        
        if ipi64RangeStart >= ipi64RangeEnd or ipi64RangeStart < 0 or ipi64RangeEnd < 0 then
            undo, throw new Progress.Lang.AppError("Incorrect range selected for random number generation.", 1).  
        
        assign    
            ipi64RangeEnd = ipi64RangeEnd - ipi64RangeStart
            deTempDec     = log(ipi64RangeEnd, 2).  
            
        if deTempDec - truncate(deTempDec, 0) > 0 then    
            iByteNumber = truncate(deTempDec, 0) + 1.  
        
        if iByteNumber <= 16 then 
            cHashAlgorithm = "MD5".   
        else if iByteNumber <= 20 then 
            cHashAlgorithm = "SHA-1".     
        else if iByteNumber <= 32 then 
            cHashAlgorithm = "SHA-256".       
        else cHashAlgorithm = "SHA-512".  
        
        do iAttempts = 1 to iMaxAttempts:    
            assign      
                rTempRaw   = message-digest(cHashAlgorithm, guid(generate-uuid))      
                cHashValue = hex-encode(rTempRaw).    
            
            do iNum = 1 to iByteNumber:      
                if substring(cHashValue, iNum, 1) > "7" then        
                    i64RandomNumber = i64RandomNumber + exp(2, iNum - 1).    
            end.
                
            if i64RandomNumber <= ipi64RangeEnd then      
                return i64RandomNumber + ipi64RangeStart.    
            else if iAttempts = iMaxAttempts then        
                return (i64RandomNumber modulo (ipi64RangeEnd + 1)) + ipi64RangeStart.  
        end.
        
    end method.

end class.
