//
//  LogadoViewController.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 12/05/22.
//

import UIKit
import FirebaseAuth

class LogadoViewController: UIViewController {
    
    let logOut = Auth.auth()
    
    @IBAction func sair (sender: Any) {
        
        do {
        try logOut.signOut()
            navigationController?.popViewController(animated: true)
        } catch {
            
        }
        

    }
    
    
    
    
    
    
}
