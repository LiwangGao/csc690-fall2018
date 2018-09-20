import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "ceaser": CeaserCipher(),
        "alphanumeric": AlphaNumeric(),
        "substitution": Substitution()
        ]
    
    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
  
}
