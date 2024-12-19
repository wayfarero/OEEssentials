/*------------------------------------------------------------------------
   File        : MathUtilUnitTests
   Purpose     : Unit Test class for MathUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Fri Oct 28 13:18:16 EEST 2024
   Notes       : 
----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.MathUtil.

class Tests.MathUtilUnitTest:

    /*------------------------------------------------------------------------------
        Purpose: Test the CalculateAge method for correct age calculation.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCalculateAge():
        define variable iResult as integer no-undo.

        iResult = MathUtil:CalculateAge(date(10,24,1990)).
        
        Assert:IsTrue(iResult = 34, "CalculateAge should return 34").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the CalculateDetailedAge method for correct detailed age calculation.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCalculateDetailedAge():
        define variable cResult         as character no-undo.
        define variable dCurrentDate    as date      no-undo.
        define variable dBirthDate      as date      no-undo.
        define variable iYears          as integer   no-undo.
        define variable iMonths         as integer   no-undo.
        define variable iDays           as integer   no-undo.
        define variable cExpectedResult as character no-undo.

        dCurrentDate = today.
        dBirthDate = date(10,29,1990).

        iYears = year(dCurrentDate) - year(dBirthDate).
        if month(dCurrentDate) < month(dBirthDate) or (month(dCurrentDate) = month(dBirthDate) and day(dCurrentDate) < day(dBirthDate)) then 
            iYears = iYears - 1.

        if month(dCurrentDate) >= month(dBirthDate) then
            iMonths = month(dCurrentDate) - month(dBirthDate).
        else
            iMonths = 12 - (month(dBirthDate) - month(dCurrentDate)).

        if day(dCurrentDate) >= day(dBirthDate) then
            iDays = day(dCurrentDate) - day(dBirthDate).
        else 
        do:
            iDays = day(dCurrentDate) + (30 - day(dBirthDate)).
            if iMonths < 0 then 
            do:
                iMonths = 11.
                iYears = iYears - 1.
            end.
        end.

        cExpectedResult = string(iYears) + " years, " + string(iMonths) + " months, " + string(iDays) + " days".

        cResult = MathUtil:CalculateDetailedAge(dBirthDate).
        
        Assert:IsTrue(cResult = cExpectedResult, "CalculateDetailedAge should return '" + cExpectedResult + "'").
    
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the CalculateAgeAtDate method for correct age calculation at a specific date.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCalculateAgeAtDate():
        define variable iResult as integer no-undo.

        iResult = MathUtil:CalculateAgeAtDate(date(10,24,1990), date(10,24,2020)).
        
        Assert:IsTrue(iResult = 30, "CalculateAgeAtDate should return 30").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the TimeUntilBirthday method for correct days calculation until next birthday.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestTimeUntilBirthday():
        define variable iResult            as integer no-undo.
        define variable dCurrentDate       as date    no-undo.
        define variable dExpectedBirthday  as date    no-undo.
        define variable iExpectedResult    as integer no-undo.

        dCurrentDate = today.

        dExpectedBirthday = date(10, 23, year(dCurrentDate)).

        if dExpectedBirthday < dCurrentDate then
            dExpectedBirthday = date(10, 23, year(dCurrentDate) + 1).

        iExpectedResult = dExpectedBirthday - dCurrentDate.

        iResult = MathUtil:TimeUntilBirthday(date(10,23,1990)).
        
        Assert:IsTrue(iResult = iExpectedResult, "TimeUntilBirthdate should return " + string(iExpectedResult) + " days until the next birthday").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test the SinDegrees method for correct sine calculation of an angle in degrees.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSinDegrees():
        define variable deResult as decimal no-undo.

        deResult = round(MathUtil:SinDegrees(30), 1).
        
        Assert:IsTrue(deResult = 0.5, "SinDegrees should return 0.5 for 30 degrees").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the SinRadians method for correct sine calculation of an angle in radians.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestSinRadians():
        define variable deResult as decimal no-undo.

        deResult = round(MathUtil:SinRadians(30), 1).
        
        Assert:IsTrue(deResult = -1, "SinRadians should return -1 for 30 radians").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the CosDegrees method for correct cosine calculation of an angle in degrees.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCosDegrees():
        define variable deResult as decimal no-undo.

        deResult = round(MathUtil:CosDegrees(60), 1).
        
        Assert:IsTrue(deResult = 0.5, "CosDegrees should return 0.5 for 60 degrees").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the CosRadians method for correct cosine calculation of an angle in radians.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCosRadians():
        define variable deResult as decimal no-undo.

        deResult = MathUtil:CosRadians(60).
        
        Assert:Equals(deResult, -0.9524129804).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the TanDegrees method for correct tangent calculation of an angle in degrees.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestTanDegrees():
        define variable deResult as decimal no-undo.

        deResult = round(MathUtil:TanDegrees(45), 1).
        
        Assert:IsTrue(deResult = 1, "TanDegrees should return 1 for 45 degrees").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the TanRadians method for correct tangent calculation of an angle in radians.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestTanRadians():
        define variable deResult as decimal no-undo.

        deResult = MathUtil:TanRadians(45).
        
        Assert:Equals(deResult, 1.6197751905).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the RoundToWhole method for rounding to the nearest whole number.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRoundToWhole():
        define variable deResult as decimal no-undo.

        deResult = MathUtil:RoundToWhole(4.6).
        Assert:IsTrue(deResult = 5, "RoundToWhole should return 5 for 4.6").

        deResult = MathUtil:RoundToWhole(4.4).
        Assert:IsTrue(deResult = 4, "RoundToWhole should return 4 for 4.4").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the RoundToDecimalPlaces method for rounding to specified decimal places.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRoundToDecimalPlaces():
        define variable deResult as decimal no-undo.

        deResult = MathUtil:RoundToDecimalPlaces(4.6789, 2).
        Assert:IsTrue(deResult = 4.68, "RoundToDecimalPlaces should return 4.68 for 4.6789 rounded to 2 decimal places").
  
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the RoundUp method for rounding up to the nearest whole number.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRoundUp():
        define variable deResult as decimal no-undo.

        deResult = MathUtil:RoundUp(4.2).
        Assert:IsTrue(deResult = 5, "RoundUp should return 5 for 4.2").

        deResult = MathUtil:RoundUp(-4.2).
        Assert:IsTrue(deResult = -4, "RoundUp should return -4 for -4.2").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the RoundDown method for rounding down to the nearest whole number.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestRoundDown():
        define variable deResult as decimal no-undo.

        deResult = MathUtil:RoundDown(4.8).
        Assert:IsTrue(deResult = 4, "RoundDown should return 4 for 4.8").

        deResult = MathUtil:RoundDown(-4.8).
        Assert:IsTrue(deResult = -5, "RoundDown should return -5 for -4.8").
        
    end method.

end class.
