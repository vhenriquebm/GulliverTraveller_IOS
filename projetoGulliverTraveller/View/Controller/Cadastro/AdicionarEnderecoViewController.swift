//
//  AdicionarEnderecoViewController.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 11/05/22.
//

import UIKit

class AdicionarEnderecoViewController: UIViewController {
    
    override func viewDidLoad() {
     
    }
    
    var nomeUser: String?
    var emailSend: String?
    var senhaSend: String?
    var idade: String?
    var aniversario: String?
    
    
    @IBOutlet weak var ruaTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var bairroTextField: UITextField!
    
    @IBOutlet weak var cepTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let confirmacao = segue.destination as? ConfirmacaoViewController
        
        confirmacao?.showName = nomeUser
        confirmacao?.showEmail = emailSend
        confirmacao?.showPassword = senhaSend
        confirmacao?.showAge = idade
        confirmacao?.showBirthday = aniversario
        
        if let rua = ruaTextField.text {
            confirmacao?.showStreet = rua
        }
        
        if let number = numberTextField.text {
            confirmacao?.showStreetNumber = number
        }
        
        if let bairro = bairroTextField.text {
            confirmacao?.showBairro = bairro
        }
    
        if let cep = cepTextField.text {
            confirmacao?.showwCEP = cep
        }
        
}

}
