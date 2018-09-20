import XCTest
@testable import SpyApp

class AlphaNumericTests: XCTestCase {
    
    var cipher : Cipher!
    override func setUp() {
        super.setUp()
        cipher = AlphaNumeric()
    }
    
    func test_lowercaseOfInputWillConvertedUppercase(){
        
        let plaintext = "a"
        let result = cipher.encode(plaintext, secret: "0")
        XCTAssertEqual("A", result)
    }
    
    func test_nonAlphaNumericInputForPlainttext(){
        let result = cipher.encode("#", secret: "0")
    }
    func test_plainTextWithNonAlphaNumericaInput(){
        let result = cipher.encode("111#", secret: "0")
    }
    func test_nonNumericInputForSecret(){
        
        let result = cipher.encode("b", secret: "nonNumberic")
    }
    func test_mappedWithSecret_one(){
        let plaintext = "abcd"
        let result = cipher.encode(plaintext, secret: "1")
        XCTAssertEqual("BCDE", result)
        
    }
    func test_mappingWithSecret_Two(){
        let plaintext = "abcd"
        let result = cipher.encode(plaintext, secret: "2")
        XCTAssertEqual("CDEF", result)
        
    }
    func test_mappingCyclicalInEitherDirection_With_secret_One(){
        let plaintext = "z9"
        let result = cipher.encode(plaintext, secret: "1")
        XCTAssertEqual("0A", result)
        
    }
    func test_whenPlainTextIsSetToNil(){
        let plainttext = ""
        let result = cipher.encode(plainttext, secret: "1")
    }
    func test_whenSecretIsSetToNil(){
        
        let result = cipher.encode("a", secret: "")
    }
    
    
    
    
}
