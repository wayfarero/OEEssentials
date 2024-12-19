 /*------------------------------------------------------------------------
    File        : LongcharUtilUniTest
    Purpose     : Unit Test class for LongcharUtil
    Syntax      : 
    Description : 
    Author(s)   : Wayfare
    Created     : Fri Nov 22 12:42:46 EET 2024
    Notes       : 
  ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.LongcharUtil.

class Tests.LongcharUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsEmpty method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsEmpty():
       
        Assert:Equals(LongcharUtil:IsEmpty(""), true).
        Assert:Equals(LongcharUtil:IsEmpty("   "), true).
        Assert:Equals(LongcharUtil:IsEmpty("value"), false).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotEmpty method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNotEmpty():
       
        Assert:Equals(LongcharUtil:IsNotEmpty(""), false).
        Assert:Equals(LongcharUtil:IsNotEmpty("   "), false).
        Assert:Equals(LongcharUtil:IsNotEmpty("value"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNull method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNull():
       
        Assert:Equals(LongcharUtil:IsNull(?), true).
        Assert:Equals(LongcharUtil:IsNull("value"), false).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotNull method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNotNull():
       
        Assert:Equals(LongcharUtil:IsNotNull(?), false).
        Assert:Equals(LongcharUtil:IsNotNull("value"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNullOrEmpty method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNullOrEmpty():
       
        Assert:Equals(LongcharUtil:IsNullOrEmpty(""), true).
        Assert:Equals(LongcharUtil:IsNullOrEmpty("   "), true).
        Assert:Equals(LongcharUtil:IsNullOrEmpty(?), true).
        Assert:Equals(LongcharUtil:IsNullOrEmpty("value"), false).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotNullOrEmpty method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNotNullOrEmpty():
        
        Assert:Equals(LongcharUtil:IsNotNullOrEmpty(""), false).
        Assert:Equals(LongcharUtil:IsNotNullOrEmpty("   "), false).
        Assert:Equals(LongcharUtil:IsNotNullOrEmpty(?), false).
        Assert:Equals(LongcharUtil:IsNotNullOrEmpty("value"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsLowercase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsLowercase():
        
        Assert:Equals(LongcharUtil:IsLowercase("VAluE"), false).
        Assert:Equals(LongcharUtil:IsLowercase("value"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsUppercase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsUppercase():
        
        Assert:Equals(LongcharUtil:IsUppercase("VAluE"), false).
        Assert:Equals(LongcharUtil:IsUppercase("value"), false).
        Assert:Equals(LongcharUtil:IsUppercase("VALUE"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test ContainsNumber method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestContainsNumber():
        
        Assert:Equals(LongcharUtil:ContainsNumber("value"), false).
        Assert:Equals(LongcharUtil:ContainsNumber("value1"), true).
        Assert:Equals(LongcharUtil:ContainsNumber("va123lue"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test StartWithCapital method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestStartWithCapital():
        
        Assert:Equals(LongcharUtil:StartWithCapital("value"), "Value").
        Assert:Equals(LongcharUtil:StartWithCapital("hello, world!"), "Hello, world!").
        Assert:Equals(LongcharUtil:StartWithCapital("Value"), "Value").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test StartWithLowercase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestStartWithLowercase():
        
        Assert:Equals(LongcharUtil:StartWithLowercase("Value"), "value").
        Assert:Equals(LongcharUtil:StartWithLowercase("Hello, world!"), "hello, world!").
        Assert:Equals(LongcharUtil:StartWithLowercase("value"), "value").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test StringToPascalCase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestStringToPascalCase():
        
        Assert:Equals(LongcharUtil:StringToPascalCase("hello world test", " "), "HelloWorldTest").
        Assert:Equals(LongcharUtil:StringToPascalCase("hello-world-test", "-"), "HelloWorldTest").
        Assert:Equals(LongcharUtil:StringToPascalCase("hello=world=test", "="), "HelloWorldTest").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test StringToCamelCase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestStringToCamelCase():
        
        Assert:Equals(LongcharUtil:StringToCamelCase("hello world test", " "), "helloWorldTest").
        Assert:Equals(LongcharUtil:StringToCamelCase("Hello-world-test", "-"), "helloWorldTest").
        Assert:Equals(LongcharUtil:StringToCamelCase("hello=world=test", "="), "helloWorldTest").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test Quote method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestQuote():
        
        Assert:Equals(LongcharUtil:Quote("value"), '"value"').
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test UnQuote method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestUnQuote():
        
        Assert:Equals(LongcharUtil:UnQuote('"value"'), "value").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetTokenValueFromString method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestGetTokenValueFromString():
        define variable lcToken as longchar no-undo.
        
        lcToken = "token1=value1,token2=value2,token3=value3".
        
        Assert:Equals(LongcharUtil:GetTokenValueFromString(lcToken, 1), "value1").
        Assert:Equals(LongcharUtil:GetTokenValueFromString(lcToken, 2), "value2").
        Assert:Equals(LongcharUtil:GetTokenValueFromString(lcToken, 3), "value3").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test SetTokenValueInString method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestSetTokenValueInString():
        define variable lcToken as longchar no-undo.
        
        lcToken = "token1=value1,token2=,token3=value3".
        
        Assert:Equals(LongcharUtil:SetTokenValueInString(lcToken, "newvalue", 1), "token1=newvalue,token2=,token3=value3").
        Assert:Equals(LongcharUtil:SetTokenValueInString(lcToken, "newvalue", 2), "token1=value1,token2=newvalue,token3=value3").
        Assert:Equals(LongcharUtil:SetTokenValueInString(lcToken, "newvalue", 3), "token1=value1,token2=,token3=newvalue").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test RemoveTokenFromString method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestRemoveTokenFromString():
        define variable lcToken as longchar no-undo.
        
        lcToken = "token1=value1,token2=value2,token3=value3".
        
        Assert:Equals(LongcharUtil:RemoveTokenFromString(lcToken, 1), "token2=value2,token3=value3").
        Assert:Equals(LongcharUtil:RemoveTokenFromString(lcToken, 2), "token1=value1,token3=value3").
        Assert:Equals(LongcharUtil:RemoveTokenFromString(lcToken, 3), "token1=value1,token2=value2").
        
    end method.

end class.
