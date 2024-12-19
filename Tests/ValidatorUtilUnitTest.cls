/*------------------------------------------------------------------------
   File        : ValidatorUtilUnitTest
   Purpose     : Unit test class for ValidatorUtil
   Syntax      : 
   Description : 
   Author(s)   : Wayfare
   Created     : Wed Nov 06 14:19:35 EET 2024
   Notes       : 
 ----------------------------------------------------------------------*/

block-level on error undo, throw.

using OpenEdge.Core.Assert.
using Utils.ValidatorUtil.

class Tests.ValidatorUtilUnitTest: 
    
    /*------------------------------------------------------------------------------ 
        Purpose: Test validation of email addresses
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateEmailAddress():

        Assert:IsTrue(ValidatorUtil:ValidateEmailAddress("user@example.com"), "Expected valid email to pass").
        Assert:IsFalse(ValidatorUtil:ValidateEmailAddress("user@.com"), "Expected invalid email to fail").
        Assert:IsFalse(ValidatorUtil:ValidateEmailAddress("userexample.com"), "Expected email without @ to fail").
        Assert:IsTrue(ValidatorUtil:ValidateEmailAddress("user.name+tag@example.co.uk"), "Expected complex valid email to pass").
        
    end method.
    
    /*------------------------------------------------------------------------------ 
        Purpose: Test validation of email addresses with unix library
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateEmailAddressUnixLibrary():
        
        Assert:IsTrue(ValidatorUtil:ValidateEmailAddressUnixLibrary("user@example.com"), "Expected valid email to pass").
        Assert:IsFalse(ValidatorUtil:ValidateEmailAddressUnixLibrary("user@.com"), "Expected invalid email to fail").
        Assert:IsFalse(ValidatorUtil:ValidateEmailAddressUnixLibrary("userexample.com"), "Expected email without @ to fail").
        Assert:IsTrue(ValidatorUtil:ValidateEmailAddressUnixLibrary("user.name+tag@example.co.uk"), "Expected complex valid email to pass").
        
    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test validation of credit card numbers using Luhn algorithm
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateCreditCardNumber():

        Assert:IsTrue(ValidatorUtil:ValidateCreditCardNumber("4532015112830366"), "Expected valid credit card to pass").
        Assert:IsFalse(ValidatorUtil:ValidateCreditCardNumber("1234567812345678"), "Expected invalid credit card to fail").
        Assert:IsFalse(ValidatorUtil:ValidateCreditCardNumber(""), "Expected empty string to fail").
        Assert:IsTrue(ValidatorUtil:ValidateCreditCardNumber("378282246310005"), "Expected valid American Express card to pass").

    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test validation of credit card numbers using Luhn algorithm with unix library
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateCreditCardNumberUnixLibrary():

        Assert:IsTrue(ValidatorUtil:ValidateCreditCardNumberUnixLibrary("4532015112830366"), "Expected valid credit card to pass").
        Assert:IsFalse(ValidatorUtil:ValidateCreditCardNumberUnixLibrary("1234567812345678"), "Expected invalid credit card to fail").
        Assert:IsFalse(ValidatorUtil:ValidateCreditCardNumberUnixLibrary(""), "Expected empty string to fail").
        Assert:IsTrue(ValidatorUtil:ValidateCreditCardNumberUnixLibrary("378282246310005"), "Expected valid American Express card to pass").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test validation of IPv4 addresses
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateIPv4Address():

        Assert:IsTrue(ValidatorUtil:ValidateIPv4Address("192.168.1.1"), "Expected valid IPv4 to pass").
        Assert:IsFalse(ValidatorUtil:ValidateIPv4Address("256.256.256.256"), "Expected invalid IPv4 to fail").
        Assert:IsFalse(ValidatorUtil:ValidateIPv4Address("192.168.1"), "Expected incomplete IPv4 to fail").
        Assert:IsTrue(ValidatorUtil:ValidateIPv4Address("0.0.0.0"), "Expected edge-case valid IPv4 to pass").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test validation of IPv6 addresses
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateIPv6Address():

        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("2001:0db8:85a3:0000:0000:8a2e:0370:7334"), "Expected valid IPv6 to pass in 1st test").
        Assert:IsFalse(ValidatorUtil:ValidateIPv6Address("2001:85a3:0370"), "Expected incomplete IPv6 to fail in 2nd").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("2001:db8:85a3:0:0:8a2e:370:7334"), "Expected valid IPv6 to pass in 3rd test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("2001:db8:85a3::8a2e:370:7334"), "Expected valid IPv6 to pass in 4th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("::1"), "Expected valid loopback IPv6 to pass in 5th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("::"), "Expected valid unspecified IPv6 to pass in 6th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("::ffff:192.168.1.1"), "Expected valid IPv4-mapped IPv6 to pass in 7th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("fe80::1ff:fe23:4567:890a"), "Expected valid link-local IPv6 to pass in 8th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("2001:db8:abcd:0012:0000:0000:0000:0001"), "Expected valid IPv6 to pass in 9th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("ff02::1"), "Expected valid IPv6 multicast to pass in 10th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("fd00::1234"), "Expected valid unique local IPv6 to pass in 11th test").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test validation of IPv6 addresses with unix library
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateIPv6AddressUnixLibrary():

        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("2001:0db8:85a3:0000:0000:8a2e:0370:7334"), "Expected valid IPv6 to pass in 1st test").
        Assert:IsFalse(ValidatorUtil:ValidateIPv6Address("2001:85a3:0370"), "Expected incomplete IPv6 to fail in 2nd").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("2001:db8:85a3:0:0:8a2e:370:7334"), "Expected valid IPv6 to pass in 3rd test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("2001:db8:85a3::8a2e:370:7334"), "Expected valid IPv6 to pass in 4th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("::1"), "Expected valid loopback IPv6 to pass in 5th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("::"), "Expected valid unspecified IPv6 to pass in 6th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("::ffff:192.168.1.1"), "Expected valid IPv4-mapped IPv6 to pass in 7th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("fe80::1ff:fe23:4567:890a"), "Expected valid link-local IPv6 to pass in 8th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("2001:db8:abcd:0012:0000:0000:0000:0001"), "Expected valid IPv6 to pass in 9th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("ff02::1"), "Expected valid IPv6 multicast to pass in 10th test").
        Assert:IsTrue(ValidatorUtil:ValidateIPv6Address("fd00::1234"), "Expected valid unique local IPv6 to pass in 11th test").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test validation of URLs
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateURL():

        Assert:IsTrue(ValidatorUtil:ValidateURL("https://www.example.com"), "Expected valid URL to pass").
        Assert:IsFalse(ValidatorUtil:ValidateURL("htp://example.com"), "Expected invalid URL to fail").
        Assert:IsTrue(ValidatorUtil:ValidateURL("http://example.co.uk"), "Expected valid URL with TLD to pass").
        Assert:IsFalse(ValidatorUtil:ValidateURL("https://example"), "Expected invalid URL without TLD to fail").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test validation of URLs with unix library
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidateURLUnixLibrary():

        Assert:IsTrue(ValidatorUtil:ValidateURLUnixLibrary("https://www.example.com"), "Expected valid URL to pass").
        Assert:IsFalse(ValidatorUtil:ValidateURLUnixLibrary("htp://example.com"), "Expected invalid URL to fail").
        Assert:IsTrue(ValidatorUtil:ValidateURLUnixLibrary("http://example.co.uk"), "Expected valid URL with TLD to pass").
        Assert:IsFalse(ValidatorUtil:ValidateURLUnixLibrary("https://example"), "Expected invalid URL without TLD to fail").

    end method.

    /*------------------------------------------------------------------------------
        Purpose: Test validation of phone numbers
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidatePhoneNumber():

        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+1 (555) 555-5555"), "Expected valid US phone number to pass").
        Assert:IsFalse(ValidatorUtil:ValidatePhoneNumber("123-abc-7890"), "Expected invalid phone number with letters to fail").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+44 7911 123456"), "Expected valid UK mobile phone number to pass").
        Assert:IsFalse(ValidatorUtil:ValidatePhoneNumber("555555"), "Expected invalid short phone number to fail").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+1-234-567-8901"), "Expected valid phone number with dashes to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+61-234-567-89-01"), "Expected valid phone number with mixed dashes to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+46-234 5678901"), "Expected valid phone number with spaces to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+1 (234) 56 89 901"), "Expected valid phone number with parentheses and spaces to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+1 (234) 56-89 901"), "Expected valid phone number with mixed spaces and dashes to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+46.234.567.8901"), "Expected valid phone number with dots to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumber("+1/234/567/8901"), "Expected valid phone number with slashes to pass").
        
    end method.
    
    /*------------------------------------------------------------------------------
        Purpose: Test validation of phone numbers with unix library
    ------------------------------------------------------------------------------*/
    @Test.
    method public void TestValidatePhoneNumberUnixLibrary():

        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+1 (555) 555-5555"), "Expected valid US phone number to pass").
        Assert:IsFalse(ValidatorUtil:ValidatePhoneNumberUnixLibrary("123-abc-7890"), "Expected invalid phone number with letters to fail").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+44 7911 123456"), "Expected valid UK mobile phone number to pass").
        Assert:IsFalse(ValidatorUtil:ValidatePhoneNumberUnixLibrary("555555"), "Expected invalid short phone number to fail").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+1-234-567-8901"), "Expected valid phone number with dashes to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+61-234-567-89-01"), "Expected valid phone number with mixed dashes to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+46-234 5678901"), "Expected valid phone number with spaces to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+1 (234) 56 89 901"), "Expected valid phone number with parentheses and spaces to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+1 (234) 56-89 901"), "Expected valid phone number with mixed spaces and dashes to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+46.234.567.8901"), "Expected valid phone number with dots to pass").
        Assert:IsTrue(ValidatorUtil:ValidatePhoneNumberUnixLibrary("+1/234/567/8901"), "Expected valid phone number with slashes to pass").

    end method.

end class.
