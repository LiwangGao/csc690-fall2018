

import Foundation
struct Substitution: Cipher {
    
    let alphabetArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"]
    let substitutionArray =  ["B","9","C","F","D","E","1","Y","I","6","K","Q","M","3","J","P","L","S","R","T","Z","V","W","X","H","U","0","2","G","3","N","5","0","7","A","8"]
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        var encoded = ""
        var shiftBy = UInt32(0)
        let unicode = String(plaintext.uppercased())
        
        
        let unicodeArray = Array(unicode)
        var numElementContained = 0
        for item in unicodeArray{
            for item2 in alphabetArray{
                if item2.contains(item) {
                    numElementContained += 1
                }
                
            }
        }
        if numElementContained != unicodeArray.count {
            encoded = " wrong input, please enter code A-Z, a-z and 0-9"
        }
            
            
        else{
            if (!secret.isEmpty){
                if var keyInNumber = Int(secret){
                    shiftBy = UInt32(keyInNumber)
                    for (_,element) in unicodeArray.enumerated(){
                        if let index = alphabetArray.index(of: "\(element)"){
                            encoded = encoded +     String(substitutionArray[index+Int(shiftBy)])
                    
                        }
                    }
                }else{encoded = "Number only for key"}
            }else{encoded = " no key" }
        }
        return encoded
        
    }
    
    
    func decrypt(_ plaintext: String, secret: String) -> String {
        var decrypted = ""
        //let shiftBy = Int(secret)!
        
        let unicodeArray = Array(plaintext)
        for (_,element) in unicodeArray.enumerated(){
            if let index = substitutionArray.index(of: "\(element)"){
                decrypted = decrypted + String(alphabetArray[index])
            }
        }
        return decrypted
        
    }
    
}
