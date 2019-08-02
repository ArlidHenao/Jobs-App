//
//  SignUpViewController.swift
//  futbolcrack
//
//  Created by Arlid Henao Rueda on 1/18/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {

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
    
    // se crea la funcion que llama el storyboard cuando se presiona el boton de atras (1)
    @objc func goToLogin(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
