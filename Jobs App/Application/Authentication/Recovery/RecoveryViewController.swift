//
//  RecoveryViewController.swift
//  Jobs App
//
//  Created by Arlid Henao Rueda on 8/6/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit

class RecoveryViewController: UIViewController {
    
    //Se llaman los elementos del storiboard
    @IBOutlet weak var emailTextField: UITextField!
    
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
    
    //funcion que valida los campos de la interfaz de login
    private func areFieldsValid() -> Bool {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(
                tittle: Constants.Texts.error,
                message: Constants.Texts.SignIn.userFieldEmpty
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
        
        return true
    }
    //fin
    
    // Alerta que se ejecuta al oprimir el boton de recuperar
    @IBAction func alertRecovery(_ sender: Any) {
        if areFieldsValid(){
            let alertController = UIAlertController(
                title: Constants.Texts.Recover.tittleCondition,
                message: Constants.Texts.Recover.messageCondition,
                preferredStyle: .alert
            )
            
            alertController.addAction(UIAlertAction(
                title: Constants.Texts.Recover.buttonCondition,
                style: .default)
            )
            
            self.present(
                alertController,
                animated: true,
                completion: nil
            )
            
        }
    }
    
    
    // se crea la funcion que llama el storyboard cuando se presiona el boton de atras (1)
    @objc func goToLogin(sender: UIButton) {
        dismiss(
            animated: true,
            completion: nil
        )
    }
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
