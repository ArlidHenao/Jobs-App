//
//  SignUpViewController.swift
//  futbolcrack
//
//  Created by Arlid Henao Rueda on 1/18/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {
    
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
    @IBAction func alertConditions(_ sender: Any) {
        let alertController = UIAlertController(
            title: Constants.Texts.SignUp.tittleCondition,
            message: Constants.Texts.SignUp.messageCondition,
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: Constants.Texts.SignUp.buttonCondition, style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // se crea la funcion que llama el storyboard cuando se presiona el boton de atras (1)
    @objc func goToLogin(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
