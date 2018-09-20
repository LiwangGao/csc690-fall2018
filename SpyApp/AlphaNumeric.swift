import Foundation



struct AlphaNumeric: Cipher {
    
    let alphabetArray = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","0","1","2","3","4","5","6","7","8","9"]
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        var encoded = ""
        var shiftBy = UInt64(0)
       
       
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
                    shiftBy = UInt64(keyInNumber)
                    for (_,element) in unicodeArray.enumerated(){
                        if let index = alphabetArray.index(of: "\(element)"){
                            encoded = encoded + String(alphabetArray[(abs(36 + index + Int(shiftBy)))%36])
                
                        }
                    }
                }else{encoded = "number only for key"}
            }else{encoded = " no key" }
        }
        return encoded
        
    }
        
    
    func decrypt(_ plaintext: String, secret: String) -> String {
        var decrypted = ""
        let shiftBy = Int(secret)!
        
        let unicodeArray = Array(plaintext)
        for (_,element) in unicodeArray.enumerated(){
            if let index = alphabetArray.index(of: "\(element)"){
                decrypted = decrypted + String(alphabetArray[abs((index - shiftBy))%36])
            }
        }
        return decrypted
        
    }
    
}
