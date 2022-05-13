//
//  CadastriViewController.swift
//  projetoGulliverTraveller
//
//  Created by Vitor Henrique Barreiro Marinho on 02/05/22.
//

import Foundation
import UIKit

class CadastroViewController: UIViewController {
    
    
    @IBAction func nameChanged(_ sender: Any)
        
        {
            if let userName = userName.text
            {
                if let errorMessage = invalidUserName(userName)
                {
                    userError.text = errorMessage
                    userError.isHidden = false
                }
                else
                {
                    userError.isHidden = true
                }
            }
            checkForValidForm()
        }
    
    
    func isValidName (value: String) -> String {
        
        if value.count < 8 {
            
            return "Por gentileza Digitar o nome completo"
        }
        
        return ""
    }
    
    
    
    @IBAction func passwordChanged(_ sender: Any) {
        if let password = userPassword.text
        {
            if let errorMessage = invalidPassword(password)
            {
                passwordError.text = errorMessage
                passwordError.isHidden = false
            }
            else
            {
                passwordError.isHidden = true
            }
        }
        
        checkForValidForm()
    }
    

  


    
    @IBAction func EmailChanged(_ sender: Any) {
        
        
        if let email = userEmail.text
        {
            if let errorMessage = invalidEmail(email)
            {
                emailError.text = errorMessage
                emailError.isHidden = false
            }
            else
            {
                emailError.isHidden = true
            }
        }
        
        checkForValidForm()
    }
    
    
    
    
    override func viewDidLoad() {
        dataPicker()
        resetForm()
        }
    
    //MARK: - Outlets
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var userAge: UITextField!
    
    @IBOutlet weak var userBirthDay: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet weak var adicionarEndereco: UIButton!

    @IBOutlet weak var passwordError: UILabel!
    
    @IBOutlet weak var userError: UILabel!
    
    
    
    //MARK: - Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let AdicionarEndereco = segue.destination as? AdicionarEnderecoViewController {
            AdicionarEndereco.nomeUser = userName.text
            AdicionarEndereco.idade = userAge.text
            AdicionarEndereco.aniversario = userBirthDay.text
            AdicionarEndereco.emailSend = userEmail.text
            AdicionarEndereco.senhaSend = userPassword.text
        }
            
    }
    
    @IBAction func selectProfileImageButton(_ sender: Any) {
        
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
        userProfileImage.layer.masksToBounds = true
        let profileImage = UIImagePickerController()
        profileImage.delegate = self
        profileImage.sourceType = .photoLibrary
        profileImage.allowsEditing = true
        present(profileImage, animated: true)
        
    }
    
    
 //MARK: - Register new user
    
    @IBAction func registerNewUserButton(_ sender: Any) {
    
        resetForm()
        performSegue(withIdentifier: "goToAdicionarEndereco", sender: self)
        
        }
            
    func goToController () {
        
        if let controller = navigationController?.storyboard?.instantiateViewController(withIdentifier: "goToAdicionarEndereco") {
            
            navigationController?.pushViewController(controller, animated: true)
        }
        
    }
    
    
    func dataPicker () {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dataPickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        userBirthDay.inputView = datePicker
        userBirthDay.text = formatDate(date: Date())
    }
    
    
    @objc func dataPickerValueChanged (sender: UIDatePicker) {
        
        userBirthDay.text = formatDate(date: sender.date)
    }
    
    
    func formatDate (date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dddd yyyy"
        
        return formatter.string(from: date)
    }
    
}

extension CadastroViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            
            userProfileImage.image = image
        }
        
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}

extension CadastroViewController {
    
    func resetForm()
    {
        adicionarEndereco.isEnabled = false
        
        emailError.isHidden = false
        passwordError.isHidden = false
        emailError.text = "Required"
        userEmail.text = ""
        passwordError.text = "Required"
        userPassword.text = ""
        
    }
    
    func invalidPassword(_ value: String) -> String?
    {
        if value.count < 8
        {
            return "A senha deve conter no minimo 8 digitos"
        }
        if containsDigit(value)
        {
            return "A senha deve conter pelo menos 1 digito"
        }
        if containsLowerCase(value)
        {
            return "A senha deve conter pelo menos 1 letra minuscula"
        }
        if containsUpperCase(value)
        {
            return "A senha deve conter pelo menos 1 letra maiuscula"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool
    {
        let reqularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsLowerCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
    func containsUpperCase(_ value: String) -> Bool
    {
        let reqularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }

    
    func invalidEmail(_ value: String) -> String?
    {
        let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value)
        {
            return "Endereço de E - mail invalido"
        }
        
        return nil
    }
    
    
    func invalidUserName(_ value: String) -> String?
    {
        
        if value.count < 8
        {
            return "Por gentileza informar o nome completo"
        }
        return nil
    }

    
    
    
    
    func checkForValidForm()
    {
        if emailError.isHidden
        {
            adicionarEndereco.isEnabled = true
        }
        else
        {
            adicionarEndereco.isEnabled = false
        }
    }
    
    
    
    
    
    
}


     
        
