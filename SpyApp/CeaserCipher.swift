import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String
    func decrypt(_ plaintext: String, secret: String) -> String
   
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String {
        
        var encoded = ""
        var shiftBy = UInt32(0)
        if (!secret.isEmpty){
        
            if var keyInNumber = Int(secret){
                shiftBy = UInt32(keyInNumber)
                for character in plaintext {
                    let unicode = character.unicodeScalars.first!.value
                
                    let shiftedUnicode = unicode + shiftBy
                    let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                    encoded = encoded + shiftedCharacter
                }
            }else{encoded = " number only for key"}
        }else{encoded = " no key" }
     
        
        return encoded
        
    }
    func decrypt(_ plaintext: String, secret: String) -> String {
        var decrypted = ""
        let shiftBy = UInt32(secret)!
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        return decrypted
    }
    
}
