
import XCTest
@testable import SpyApp

class CeaserCipherTests: XCTestCase {
    
    var cipher : Cipher!
    override func setUp() {
        super.setUp()
        cipher = CeaserCipher()
    }
    
    func test_oneCharacterStringGetMappedToSelfWith_0_secret(){
        
        let plaintext = "a"
        let result = cipher.encode(plaintext, secret: "0")
        XCTAssertEqual(plaintext, result)
    }
    func test_mappedWithSecret_one(){
        let plaintext = "abcd"
        let result = cipher.encode(plaintext, secret: "1")
        XCTAssertEqual("bcde", result)
        
    }
    func test_nonNumericInputForSecret(){
        
        let result = cipher.encode("b", secret: "nonNumberic")
    }
    func test_whenPlainTextIsSetToNil(){
        let plainttext = ""
        let result = cipher.encode(plainttext, secret: "1")
    }
    func test_whenSecretIsSetToNil(){
        
        let result = cipher.encode("a", secret: "")
    }
    
}
