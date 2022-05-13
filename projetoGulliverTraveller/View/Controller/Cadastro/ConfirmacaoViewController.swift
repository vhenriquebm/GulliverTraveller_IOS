//
//  ConfirmacaoViewController.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 11/05/22.
//

import UIKit
import Firebase
import FirebaseAuth

class ConfirmacaoViewController: UIViewController {
    
    let db = Firestore.firestore()
    var ref:DocumentReference? = nil
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAge: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userBirthday: UILabel!
    @IBOutlet weak var userPassword: UILabel!
    @IBOutlet weak var userStreet: UILabel!
    @IBOutlet weak var userStreetNumber: UILabel!
    @IBOutlet weak var userBairro: UILabel!
    @IBOutlet weak var userZIP: UILabel!
    @IBOutlet weak var cadastrar: UIButton!
    
    var showName: String?
    var showAge: String?
    var showEmail: String?
    var showBirthday: String?
    var showPassword: String?
    var showStreet: String?
    var showStreetNumber: String?
    var showBairro: String?
    var showwCEP: String?
    
    
    @IBAction func cadastrar(_ sender: Any) {
        
        showAlertUserRegisteredSuccessfully()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showUserData()
        
        
    }
    
    
    
    
    func showUserData () {
        
        if let EmailDoUsuario = showEmail, let SenhaDoUsuario = showPassword {
            userEmail.text = EmailDoUsuario
            userPassword.text = SenhaDoUsuario
            Auth.auth().createUser(withEmail: EmailDoUsuario, password: SenhaDoUsuario, completion: nil)
        }
        
        if let nomeDoUsuario = showName, let idadeDoUsuario = showAge, let AniversarioDoUsuario = showBirthday, let RuaDoUsuario = showStreet, let numeroRuaDoUsuario = showStreetNumber, let BairroDoUsuario = showBairro, let CepDoUsuario = showwCEP, let EmailDoUsuario = showEmail {
            userName.text = nomeDoUsuario
            userAge.text = idadeDoUsuario
            userBirthday.text = AniversarioDoUsuario
            userStreet.text = RuaDoUsuario
            userStreetNumber.text = numeroRuaDoUsuario
            userBairro.text = BairroDoUsuario
            userZIP.text = CepDoUsuario
            
            ref = db.collection("Usuario").addDocument(data:
                                                        
                                                        ["nome" : nomeDoUsuario,
                                                         "idade": idadeDoUsuario,
                                                         "Data de nascimento":AniversarioDoUsuario,
                                                         "Rua": RuaDoUsuario,
                                                         "numero da Rua": numeroRuaDoUsuario,
                                                         "bairro": BairroDoUsuario,
                                                         "cep":CepDoUsuario,
                                                         "email": EmailDoUsuario
                                                        ])
            
            db.collection("Usuario").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
        }
        
        

    
     
        
        
        
    }
    
    
    func goToHome () {
        
        if let home = navigationController?.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
            navigationController?.pushViewController(home, animated: true)
        }
    }
    
    func showAlertUserRegisteredSuccessfully () {
        
        let alert = UIAlertController(title: "Cadastro", message: "Cadastro realizado com sucesso!", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "ok", style: .default) { acao in
            self.goToHome()
        }
        
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
