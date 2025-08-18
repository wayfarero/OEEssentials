/*------------------------------------------------------------------------
   File        : MeasurementUnitUtil
   Purpose     : Main helper class to handle units of measurement operations
   Syntax      : 
   Description :
   Author(s)   : Wayfare
   Created     : Thu Oct 24 12:10:57 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

class oeessentials.MeasurementUnitUtil:

    /*------------------------------------------------------------------------------
        Purpose: Convert Inches to Centimeters
        Notes: 1 inch = 2.54 cm
        @param ipdeInches as decimal, the value in inches
        @return decimal, the value in centimeters
    ------------------------------------------------------------------------------*/
    method public static decimal InchesToCentimeters( input ipdeInches as decimal ):
        
        return ipdeInches * 2.54.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Centimeters to Inches
        Notes: 1 cm = 0.393701 inches
        @param ipdeCentimeters as decimal, the value in centimeters
        @return decimal, the value in inches
    ------------------------------------------------------------------------------*/
    method public static decimal CentimetersToInches( input ipdeCentimeters as decimal ):
        
        return ipdeCentimeters / 2.54.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Feet to Meters
        Notes: 1 foot = 0.3048 meters
        @param ipdeFeet as decimal, the value in feet
        @return decimal, the value in meters
    ------------------------------------------------------------------------------*/
    method public static decimal FeetToMeters( input ipdeFeet as decimal ):
        
        return ipdeFeet * 0.3048.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Meters to Feet
        Notes: 1 meter = 3.28084 feet
        @param ipdeMeters as decimal, the value in meters
        @return decimal, the value in feet
    ------------------------------------------------------------------------------*/
    method public static decimal MetersToFeet( input ipdeMeters as decimal ):
        
        return ipdeMeters / 0.3048.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Miles to Kilometers
        Notes: 1 mile = 1.60934 kilometers
        @param ipdeMiles as decimal, the value in miles
        @return decimal, the value in kilometers
    ------------------------------------------------------------------------------*/
    method public static decimal MilesToKilometers( input ipdeMiles as decimal ):
        
        return ipdeMiles * 1.60934.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Kilometers to Miles
        Notes: 1 kilometer = 0.621371 miles
        @param ipdeKilometers as decimal, the value in kilometers
        @return decimal, the value in miles
    ------------------------------------------------------------------------------*/
    method public static decimal KilometersToMiles( input ipdeKilometers as decimal ):
        
        return ipdeKilometers / 1.60934.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Yards to Meters
        Notes: 1 yard = 0.9144 meters
        @param ipdeYards as decimal, the value in yards
        @return decimal, the value in meters
    ------------------------------------------------------------------------------*/
    method public static decimal YardsToMeters( input ipdeYards as decimal ):
        
        return ipdeYards * 0.9144.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Meters to Yards
        Notes: 1 meter = 1.09361 yards
        @param ipdeMeters as decimal, the value in meters
        @return decimal, the value in yards
    ------------------------------------------------------------------------------*/
    method public static decimal MetersToYards( input ipdeMeters as decimal ):
        
        return ipdeMeters / 0.9144.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Pounds to Kilograms
        Notes: 1 pound = 0.453592 kilograms
        @param ipdePounds as decimal, the value in pounds
        @return decimal, the value in kilograms
    ------------------------------------------------------------------------------*/
    method public static decimal PoundsToKilograms( input ipdePounds as decimal ):
        
        return ipdePounds * 0.453592.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Kilograms to Pounds
        Notes: 1 kilogram = 2.20462 pounds
        @param ipdeKilograms as decimal, the value in kilograms
        @return decimal, the value in pounds
    ------------------------------------------------------------------------------*/
    method public static decimal KilogramsToPounds( input ipdeKilograms as decimal ):
        
        return ipdeKilograms / 0.453592.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Ounces to Grams
        Notes: 1 ounce = 28.3495 grams
        @param ipdeOunces as decimal, the value in ounces
        @return decimal, the value in grams
    ------------------------------------------------------------------------------*/
    method public static decimal OuncesToGrams( input ipdeOunces as decimal ):
        
        return ipdeOunces * 28.3495.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Grams to Ounces
        Notes: 1 gram = 0.035274 ounces
        @param ipdeGrams as decimal, the value in grams
        @return decimal, the value in ounces
    ------------------------------------------------------------------------------*/
    method public static decimal GramsToOunces( input ipdeGrams as decimal ):
        
        return ipdeGrams / 28.3495.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Stones to Kilograms
        Notes: 1 stone = 6.35029 kilograms
        @param ipdeStones as decimal, the value in stones
        @return decimal, the value in kilograms
    ------------------------------------------------------------------------------*/
    method public static decimal StonesToKilograms( input ipdeStones as decimal ):
        
        return ipdeStones * 6.35029.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Kilograms to Stones
        Notes: 1 kilogram = 0.157473 stones
        @param ipdeKilograms as decimal, the value in kilograms
        @return decimal, the value in stones
    ------------------------------------------------------------------------------*/
    method public static decimal KilogramsToStones( input ipdeKilograms as decimal ):
        
        return ipdeKilograms / 6.35029.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert US Gallons to Liters
        Notes: 1 US gallon = 3.78541 liters
        @param ipdeGallons as decimal, the value in US gallons
        @return decimal, the value in liters
    ------------------------------------------------------------------------------*/
    method public static decimal USGallonsToLiters( input ipdeGallons as decimal ):
        
        return ipdeGallons * 3.78541.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Liters to US Gallons
        Notes: 1 liter = 0.264172 US gallons
        @param ipdeLiters as decimal, the value in liters
        @return decimal, the value in US gallons
    ------------------------------------------------------------------------------*/
    method public static decimal LitersToUSGallons( input ipdeLiters as decimal ):
        
        return ipdeLiters / 3.78541.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Quarts to Liters
        Notes: 1 quart = 0.946353 liters
        @param ipdeQuarts as decimal, the value in quarts
        @return decimal, the value in liters
    ------------------------------------------------------------------------------*/
    method public static decimal QuartsToLiters( input ipdeQuarts as decimal ):
        
        return ipdeQuarts * 0.946353.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Liters to Quarts
        Notes: 1 liter = 1.05669 quarts
        @param ipdeLiters as decimal, the value in liters
        @return decimal, the value in quarts
    ------------------------------------------------------------------------------*/
    method public static decimal LitersToQuarts( input ipdeLiters as decimal ):
        
        return ipdeLiters / 0.946353.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Pints to Liters
        Notes: 1 pint = 0.473176 liters
        @param ipdePints as decimal, the value in pints
        @return decimal, the value in liters
    ------------------------------------------------------------------------------*/
    method public static decimal PintsToLiters( input ipdePints as decimal ):
        
        return ipdePints * 0.473176.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Liters to Pints
        Notes: 1 liter = 2.11338 pints
        @param ipdeLiters as decimal, the value in liters
        @return decimal, the value in pints
    ------------------------------------------------------------------------------*/
    method public static decimal LitersToPints( input ipdeLiters as decimal ):
        
        return ipdeLiters / 0.473176.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Fahrenheit to Celsius
        Notes: Formula: (Fahrenheit - 32) * 5/9
        @param ipdeFahrenheit as decimal, the temperature in Fahrenheit
        @return decimal, the temperature in Celsius
    ------------------------------------------------------------------------------*/
    method public static decimal FahrenheitToCelsius( input ipdeFahrenheit as decimal ):
        
        return (ipdeFahrenheit - 32) * 5 / 9.
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Convert Celsius to Fahrenheit
        Notes: Formula: (Celsius * 9/5) + 32
        @param ipdeCelsius as decimal, the temperature in Celsius
        @return decimal, the temperature in Fahrenheit
    ------------------------------------------------------------------------------*/
    method public static decimal CelsiusToFahrenheit( input ipdeCelsius as decimal ):
        
        return (ipdeCelsius * 9 / 5) + 32.
        
    end method.

end class.
