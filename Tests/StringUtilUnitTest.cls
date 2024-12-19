/*------------------------------------------------------------------------
   File        : StringUtilUnitTest
   Purpose     : Unit test class for StringUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Fri Oct 18 14:59:34 EEST 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.StringUtil.

class Tests.StringUtilUnitTest: 
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsEmpty method
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestIsEmpty():
       
        Assert:Equals(StringUtil:IsEmpty(""), true).
        Assert:Equals(StringUtil:IsEmpty("   "), true).
        Assert:Equals(StringUtil:IsEmpty("value"), false).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotEmpty method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNotEmpty():
       
        Assert:Equals(StringUtil:IsNotEmpty(""), false).
        Assert:Equals(StringUtil:IsNotEmpty("   "), false).
        Assert:Equals(StringUtil:IsNotEmpty("value"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNull method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNull():
       
        Assert:Equals(StringUtil:IsNull(?), true).
        Assert:Equals(StringUtil:IsNull("value"), false).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotNull method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNotNull():
       
        Assert:Equals(StringUtil:IsNotNull(?), false).
        Assert:Equals(StringUtil:IsNotNull("value"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNullOrEmpty method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNullOrEmpty():
       
        Assert:Equals(StringUtil:IsNullOrEmpty(""), true).
        Assert:Equals(StringUtil:IsNullOrEmpty("   "), true).
        Assert:Equals(StringUtil:IsNullOrEmpty(?), true).
        Assert:Equals(StringUtil:IsNullOrEmpty("value"), false).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsNotNullOrEmpty method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsNotNullOrEmpty():
        
        Assert:Equals(StringUtil:IsNotNullOrEmpty(""), false).
        Assert:Equals(StringUtil:IsNotNullOrEmpty("   "), false).
        Assert:Equals(StringUtil:IsNotNullOrEmpty(?), false).
        Assert:Equals(StringUtil:IsNotNullOrEmpty("value"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsLowercase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsLowercase():
        
        Assert:Equals(StringUtil:IsLowercase("VAluE"), false).
        Assert:Equals(StringUtil:IsLowercase("value"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test IsUppercase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestIsUppercase():
        
        Assert:Equals(StringUtil:IsUppercase("VAluE"), false).
        Assert:Equals(StringUtil:IsUppercase("value"), false).
        Assert:Equals(StringUtil:IsUppercase("VALUE"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test ContainsNumber method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestContainsNumber():
        
        Assert:Equals(StringUtil:ContainsNumber("value"), false).
        Assert:Equals(StringUtil:ContainsNumber("value1"), true).
        Assert:Equals(StringUtil:ContainsNumber("va123lue"), true).
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test StartWithCapital method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestStartWithCapital():
        
        Assert:Equals(StringUtil:StartWithCapital("value"), "Value").
        Assert:Equals(StringUtil:StartWithCapital("hello, world!"), "Hello, world!").
        Assert:Equals(StringUtil:StartWithCapital("Value"), "Value").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test StartWithLowercase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestStartWithLowercase():
        
        Assert:Equals(StringUtil:StartWithLowercase("Value"), "value").
        Assert:Equals(StringUtil:StartWithLowercase("Hello, world!"), "hello, world!").
        Assert:Equals(StringUtil:StartWithLowercase("value"), "value").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test StringToPascalCase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestStringToPascalCase():
        
        Assert:Equals(StringUtil:StringToPascalCase("hello world test", " "), "HelloWorldTest").
        Assert:Equals(StringUtil:StringToPascalCase("hello-world-test", "-"), "HelloWorldTest").
        Assert:Equals(StringUtil:StringToPascalCase("hello=world=test", "="), "HelloWorldTest").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test StringToCamelCase method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestStringToCamelCase():
        
        Assert:Equals(StringUtil:StringToCamelCase("hello world test", " "), "helloWorldTest").
        Assert:Equals(StringUtil:StringToCamelCase("Hello-world-test", "-"), "helloWorldTest").
        Assert:Equals(StringUtil:StringToCamelCase("hello=world=test", "="), "helloWorldTest").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test Quote method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestQuote():
        
        Assert:Equals(StringUtil:Quote("value"), '"value"').
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test UnQuote method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestUnQuote():
        
        Assert:Equals(StringUtil:UnQuote('"value"'), "value").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test GetTokenValueFromString method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestGetTokenValueFromString():
        define variable cToken as character no-undo.
        
        cToken = "token1=value1,token2=value2,token3=value3".
        
        Assert:Equals(StringUtil:GetTokenValueFromString(cToken, 1), "value1").
        Assert:Equals(StringUtil:GetTokenValueFromString(cToken, 2), "value2").
        Assert:Equals(StringUtil:GetTokenValueFromString(cToken, 3), "value3").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test SetTokenValueInString method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestSetTokenValueInString():
        define variable cToken as character no-undo.
        
        cToken = "token1=value1,token2=,token3=value3".
        
        Assert:Equals(StringUtil:SetTokenValueInString(cToken, "newvalue", 1), "token1=newvalue,token2=,token3=value3").
        Assert:Equals(StringUtil:SetTokenValueInString(cToken, "newvalue", 2), "token1=value1,token2=newvalue,token3=value3").
        Assert:Equals(StringUtil:SetTokenValueInString(cToken, "newvalue", 3), "token1=value1,token2=,token3=newvalue").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test RemoveTokenFromString method
    ------------------------------------------------------------------------------*/    
    @Test.
    method public void TestRemoveTokenFromString():
        define variable cToken as character no-undo.
        
        cToken = "token1=value1,token2=value2,token3=value3".
        
        Assert:Equals(StringUtil:RemoveTokenFromString(cToken, 1), "token2=value2,token3=value3").
        Assert:Equals(StringUtil:RemoveTokenFromString(cToken, 2), "token1=value1,token3=value3").
        Assert:Equals(StringUtil:RemoveTokenFromString(cToken, 3), "token1=value1,token2=value2").
        
    end method.
    
end class.
