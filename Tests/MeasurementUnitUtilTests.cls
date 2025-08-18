/*------------------------------------------------------------------------
   File        : MeasurementUnitUtilTests
   Purpose     : Unit Test class for MeasurementUnitUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Thu Oct 24 14:33:14 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert from propath.
using oeessentials.MeasurementUnitUtil from propath.

class Tests.MeasurementUnitUtilTests: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test the InchesToCentimeters method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestInchesToCentimeters():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:InchesToCentimeters(1.0).
        Assert:Equals(2.54, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the CentimetersToInches method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCentimetersToInches():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:CentimetersToInches(2.54).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the FeetToMeters method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestFeetToMeters():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:FeetToMeters(1.0).
        Assert:Equals(0.3048, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the MetersToFeet method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestMetersToFeet():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:MetersToFeet(0.3048).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the MilesToKilometers method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestMilesToKilometers():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:MilesToKilometers(1.0).
        Assert:Equals(1.60934, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the KilometersToMiles method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestKilometersToMiles():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:KilometersToMiles(1.60934).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the YardsToMeters method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestYardsToMeters():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:YardsToMeters(1.0).
        Assert:Equals(0.9144, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the MetersToYards method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestMetersToYards():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:MetersToYards(0.9144).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the PoundsToKilograms method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestPoundsToKilograms():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:PoundsToKilograms(1.0).
        Assert:Equals(0.453592, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the KilogramsToPounds method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestKilogramsToPounds():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:KilogramsToPounds(0.453592).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the OuncesToGrams method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestOuncesToGrams():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:OuncesToGrams(1.0).
        Assert:Equals(28.3495, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the GramsToOunces method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestGramsToOunces():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:GramsToOunces(28.3495).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the StonesToKilograms method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestStonesToKilograms():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:StonesToKilograms(1.0).
        Assert:Equals(6.35029, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the KilogramsToStones method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestKilogramsToStones():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:KilogramsToStones(6.35029).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the USGallonsToLiters method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestUSGallonsToLiters():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:USGallonsToLiters(1.0).
        Assert:Equals(3.78541, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the LitersToUSGallons method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLitersToUSGallons():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:LitersToUSGallons(3.78541).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the QuartsToLiters method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestQuartsToLiters():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:QuartsToLiters(1.0).
        Assert:Equals(0.946353, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the LitersToQuarts method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLitersToQuarts():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:LitersToQuarts(0.946353).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the PintsToLiters method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestPintsToLiters():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:PintsToLiters(1.0).
        Assert:Equals(0.473176, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the LitersToPints method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestLitersToPints():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:LitersToPints(0.473176).
        Assert:Equals(1.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the FahrenheitToCelsius method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestFahrenheitToCelsius():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:FahrenheitToCelsius(32).
        Assert:Equals(0.0, deResult).
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test the CelsiusToFahrenheit method for correct conversion.
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestCelsiusToFahrenheit():
        define variable deResult as decimal no-undo.

        deResult = MeasurementUnitUtil:CelsiusToFahrenheit(0).
        Assert:Equals(32.0, deResult).
        
    end method.

end class.
