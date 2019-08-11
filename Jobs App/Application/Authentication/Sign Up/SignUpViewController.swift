//
//  SignUpViewController.swift
//  futbolcrack
//
//  Created by Arlid Henao Rueda on 1/18/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
    
    // Se llaman los elementos del storiboard
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var identificationTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //crear boton de volver atras (1)
        let leftBtn = UIButton(type: .custom)
        leftBtn.setImage(UIImage(named: Constants.Texts.SignUp.iconBehind), for: .normal)
        leftBtn.imageView?.contentMode = .scaleAspectFit
        leftBtn.addTarget(self, action: #selector(goToLogin(sender:)), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftBarButton
        

        // Do any additional setup after loading the view.
    }
    
    //alerta que se ejecuta al oprimir terminos y condiciones
    @IBAction func alertConditions(_ sender: Any) {
        let alertController = UIAlertController(
            title: Constants.Texts.SignUp.tittleCondition,
            message: Constants.Texts.SignUp.messageCondition,
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(
            title: Constants.Texts.SignUp.buttonCondition,
            style: .default)
        )
        
        self.present(
            alertController,
            animated: true,
            completion: nil
        )
    }
    
    // funcion que se ejecuta cuando se envia el formulario
    @IBAction func buttonSignUp(_ sender: Any) {
        if areFieldsValid(){
            let params = [
                "nombre": nameTextField.text as Any,
                "cedula": identificationTextField.text as Any,
                "nacimiento": birthTextField.text as Any,
                "email": emailTextField.text as Any,
                "city": cityTextField.text as Any,
                "number": numberTextField.text as Any,
                "password": passTextField.text as Any
            ]

            // Llama la función .post en el archivo ApiService y le envia los parametros
            ApiService.shared().post(endpoint: "crearPruebas", params: params) {[weak self] (error, response) in
                guard self != nil else { return }

                if error == nil {
                    
                    let response = response as! APIServiceResponseModel
                    if response.messageType == .Confirmation {
                        //lo que se muestra si se registra con exito
                        
                        self?.showAlert(
                            tittle: Constants.Texts.error,
                            message: Constants.Texts.SignUp.tittleCondition
                        )
                        
                    } else {

                        self?.showAlert(
                            tittle: Constants.Texts.error,
                            message: response.messageText
                        )
                    }
                }
            }
        }
    }
    
    //funcion que valida los campos de la interfaz de registro
    private func areFieldsValid() -> Bool {
        
        // Se verifica que los campos no esten vacios
        guard let name = nameTextField.text, !name.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignUp.fieldName
            )
            return false
        }
        
        guard let identification = identificationTextField.text, !identification.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignUp.fieldIdentification
            )
            return false
        }
        
        guard let birth = birthTextField.text, !birth.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignUp.fieldBirth
            )
            return false
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignIn.userFieldEmpty
            )
            return false
        }
        
        guard let city = cityTextField.text, !city.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignUp.fieldCity
            )
            return false
        }
        
        guard let number = numberTextField.text, !number.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignUp.fieldNumber
            )
            return false
        }
        
        guard let pass = passTextField.text, !pass.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignUp.fieldPass
            )
            return false
        }
        
        guard let passConfirm = confirmPassTextField.text, !passConfirm.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignUp.fieldPassConfirm
            )
            return false
        }
        
        if pass != passConfirm{
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignUp.fieldPassConfirmDiferent
            )
            return false
        }
        
        if !validate(text: email, regex: Constants.Texts.SignIn.expresionRegularEmail) {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignIn.errorUserField
            )
            return false
        }
        
        if !validate(text: pass, regex: Constants.Texts.SignIn.expresionRegularPass) {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignIn.errorPassField
            )
            return false
        }
        
        return true
    }
    //fin
    
    //funcion para el pop-up para verificar que se ingresen los datos en email y passworid
    func showAlert(tittle: String, message: String){
        let alertViewEmail = UIAlertController(
            title: tittle,
            message: message,
            preferredStyle: .alert
        )
        alertViewEmail.addAction(UIAlertAction(
            title: Constants.Texts.SignIn.titlePopUp,
            style: .default,
            handler: nil)
        )
        self.present(
            alertViewEmail,
            animated: true,
            completion: nil
        )
    }
    //fin
    
    // se crea la funcion que llama el storyboard cuando se presiona el boton de atras (1)
    @objc func goToLogin(sender: UIButton) {
        dismiss(
            animated: true,
            completion: nil
        )
    }
    
}
