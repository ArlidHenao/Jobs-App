//
//  RecoveryViewController.swift
//  Jobs App
//
//  Created by Arlid Henao Rueda on 8/6/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit

class RecoveryViewController: UIViewController {

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
    
    @IBAction func alertRecovery(_ sender: Any) {
        let alertController = UIAlertController(
            title: Constants.Texts.Recover.tittleCondition,
            message: Constants.Texts.Recover.messageCondition,
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: Constants.Texts.Recover.buttonCondition, style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // se crea la funcion que llama el storyboard cuando se presiona el boton de atras (1)
    @objc func goToLogin(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
