import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!

    let factory = CipherFactory()
    var cipher: Cipher?
   

    @IBAction func encodeButtonPressed(_ sender: UIButton) {
        if input.text!.isEmpty{output.text = "please enter the code need to be encrypted"}else{
            let plaintext = input.text!
           
            let secret = self.secret.text!
            
            
            if let cipher = self.cipher{
                output.text = cipher.encode(plaintext, secret: secret)
               
            }else{
                output.text = "no cipher selected"
            }
            
        }
    }

    @IBAction func decryptButtonPressed(_ sender: UIButton) {
       if input.text!.isEmpty{output.text = "To decrypted the code ,please encrypted your code first"}else{
            let plaintext = output.text!
            let secret = self.secret.text!
            if let cipher = self.cipher{
                output.text = cipher.decrypt(plaintext, secret: secret)
            }else{
                output.text = "no cipher selected"
            }
        
        }
        
    }
   
    @IBAction func ceaserButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
           
            else{
                output.text = "No button or button yet"
                return
        }
        cipher = factory.cipher(for: buttonText)
        
    }
    @IBAction func substituteButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            
            else{
                output.text = "No button or button yet"
                return
        }
        cipher = factory.cipher(for: buttonText)
    }
    
    @IBAction func alphacipherButtonPressed(_ sender: UIButton) {
        guard
            let buttonLable = sender.titleLabel,
            let buttonText = buttonLable.text
            else {
                output.text = "No button or no button yet"
                return
        }
        cipher = factory.cipher(for: buttonText)
        
    }
    
   
}

