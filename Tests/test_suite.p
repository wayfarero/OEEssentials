 
 
 /*------------------------------------------------------------------------
    File        : test_suite.p 
    Syntax      : 
    Author(s)   : vasil
    Created     : Mon Aug 18 14:38:51 EEST 2025
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
BLOCK-LEVEL ON ERROR UNDO, THROW.

    
@TestSuite(classes="Tests/BufferUtilUnitTests.cls").  
@TestSuite(classes="Tests/CharacterExtentUtilUnitTest.cls").
@TestSuite(classes="Tests/DataConversionUtilUnitTest.cls").  
@TestSuite(classes="Tests/DateUtilUnitTest.cls").  
@TestSuite(classes="Tests/DecimalExtentUtilUnitTest.cls").
@TestSuite(classes="Tests/DecimalUtilUnitTest.cls").  
@TestSuite(classes="Tests/EmailUtilUnitTest.cls").
@TestSuite(classes="Tests/FileUtilUnitTest.cls").  
@TestSuite(classes="Tests/Int64UtilUnitTest.cls").
@TestSuite(classes="Tests/Integer64ExtentUtilUnitTest.cls").  
@TestSuite(classes="Tests/IntegerExtentUtilUnitTest.cls").
@TestSuite(classes="Tests/IntegerUtilUnitTests.cls").  
@TestSuite(classes="Tests/ListUtilUnitTest.cls").
@TestSuite(classes="Tests/LogicalUtilUnitTest.cls").
@TestSuite(classes="Tests/LongcharUtilUnitTest.cls").
@TestSuite(classes="Tests/MathUtilUnitTest.cls").
@TestSuite(classes="Tests/MeasurementUnitUtilTests.cls").
@TestSuite(classes="Tests/MemptrUtilUnitTest.cls").
@TestSuite(classes="Tests/QueryUtilUnitTest.cls").
@TestSuite(classes="Tests/SessionUtilUnitTest.cls").
@TestSuite(classes="Tests/StringUtilUnitTest.cls").
@TestSuite(classes="Tests/ValidatorUtilUnitTest.cls").
  