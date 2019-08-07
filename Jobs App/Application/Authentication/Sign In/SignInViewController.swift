//
//  SignInViewController.swift
//  ProyectoFutbolCrack
//
//  Created by Arlid Henao Rueda on 1/21/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit
import RevealingSplashView
import FirebaseAuth
import GoogleSignIn

class SignInViewController: UIViewController {
    
    //se llaman los elementos de storyboard
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private var viewModel = SignInViewModel()
    
    // Aqui se administra el splash screem
    let revealingSplashScreem =
        RevealingSplashView(iconImage: UIImage(
            named: "LaunchScreen")!,
            iconInitialSize: CGSize(width: 80, height: 80),
            backgroundColor: UIColor.white
    )
    // fin
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // cuando el splahs carga se hace la animacion
        self.view.addSubview(revealingSplashScreem)
        self.revealingSplashScreem.animationType = SplashAnimationType.popAndZoomOut
        self.revealingSplashScreem.startAnimation()
        //fin
        
        // Do any additional setup after loading the view.
    }
    
    //Se llama el boton de inicio del storyboard
    @IBAction func SignIn(_ sender: Any) {
        if areFieldsValid() {
            //se configura la libreria de Firebase Authentication
            //Se verifica que el correo y la contraseña sean correcto
             Auth.auth().signIn(
             withEmail: emailTextField.text!,
             password: passwordTextField.text!) { [weak self] (result, error) in
                 if error != nil {
                    self?.showAlert(
                        tittle: Constants.Texts.error,
                        message: Constants.Texts.SignIn.errorSignIn)
                    return
                 }
                // si es resultado es correcto redirecciona al Main
                if result != nil {
                    self?.performSegue(
                        withIdentifier: Constants.Texts.SignIn.goToMain,
                        sender: self
                    )
                }
            }
        }
    }
    
    @IBAction func facebookLogin(_ sender: Any) {
        SignInViewModel.facebookLogin(
            viewController: self,
            handler: { [weak self] (success, error) in
            if let error = error {
                let alert = UIAlertController(
                    title: "Error",
                    message: error.localizedDescription,
                    preferredStyle: .alert
                )
                let ok =
                    UIAlertAction(
                        title: Constants.Texts.SignIn.titlePopUp,
                        style: .default,
                        handler: nil
                    )
                alert.addAction(ok)
                self?.present(
                    alert,
                    animated: true,
                    completion: nil
                )
                return
            }
            
            if success {
                self?.performSegue(
                    withIdentifier: Constants.Texts.SignIn.goToMain,
                    sender: self
                )
            }
        })
    }
    
    
    //funcion que valida los campos de la interfaz de login
    private func areFieldsValid() -> Bool {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignIn.userFieldEmpty
            )
            return false
        }
        guard let pass = passwordTextField.text, !pass.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignIn.passFieldEmpty
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
    
    //funcion para validar con una expresion regular si el email o password es valido
    private func validate(text: String, regex: String) -> Bool{
        let range = NSRange(location: 0, length: text.count)
        let regex = try? NSRegularExpression(pattern: regex)
        return regex?.firstMatch(in: text, options: [], range: range) != nil
    }
    //fin
    
}
