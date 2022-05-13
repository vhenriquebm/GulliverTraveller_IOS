//
//  LoginViewController.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 04/05/22.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var auth:Auth?
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    
    override func viewDidLoad() {
        self.auth = Auth.auth()
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        guard let email = userEmail.text else {return}
        
        guard let password = userPassword.text else {return}
        
        self.auth?.signIn(withEmail: email, password: password, completion: { result, error in
            
            if error != nil {
                                
               self.alert(title: "Usuário e senha não conferem", message: nil)
                
            } else {
                
                    self.alert(title: "Parabens!", message: "Sucesso ao Logar")
            
                }
        })
    }
    


    
    
    func alert (title: String, message: String?) {
        
        let alertControl = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        alertControl.addAction(alertAction)
    
        self.present(alertControl, animated: true, completion: nil)
        
    }
    
    
    
}




