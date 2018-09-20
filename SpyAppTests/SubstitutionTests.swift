import XCTest
@testable import SpyApp

class SubstitutionTests: XCTestCase {
    
    var cipher : Cipher!
        override func setUp() {
            super.setUp()
            cipher = Substitution()
    }
    func test_lowercaseOfInputWillConvertedUppercase(){
        
        let result = cipher.encode("a", secret: "0")
        XCTAssertEqual("B", result)
    }
    func test_nonNumericInputForSecret(){
        
        let result = cipher.encode("b", secret: "nonNumberic")
    }
    func test_oneCharacterStringGetMappedToSelfWith_0_secret(){
        
        let plaintext = "A"
        let result = cipher.encode(plaintext, secret: "0")
        XCTAssertEqual("B", result)
    }
    
    func test_twoCharacterStringGetMappedToSelfWith_0_secret(){
        
        let plaintext = "ab"
        let result = cipher.encode(plaintext, secret: "0")
        XCTAssertEqual("B9", result)
    }
    func test_twoCharacterStringGetMappedToSelfWith__secret(){
        
        let plaintext = "ab"
        let result = cipher.encode(plaintext, secret: "2")
        XCTAssertEqual("CF", result)
    }
    
    
}
