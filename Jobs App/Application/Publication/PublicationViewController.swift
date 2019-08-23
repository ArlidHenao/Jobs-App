//
//  PublicationViewController.swift
//  Profesiones App
//
//  Created by Arlid Henao Rueda on 7/28/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit

class PublicationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftBtn = UIButton(type: .custom)
        leftBtn.setImage(UIImage(named: Constants.Texts.iconCloset), for: .normal)
        leftBtn.imageView?.contentMode = .scaleAspectFit
        leftBtn.addTarget(self, action: #selector(goToLogin(sender:)), for: .touchUpInside)
        let leftBarButton = UIBarButtonItem(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = leftBarButton

        // Do any additional setup after loading the view.
    }
    
    @objc func goToLogin(sender: UIButton) {
        dismiss(
            animated: true,
            completion: nil
        )
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
