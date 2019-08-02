//
//  ProfileViewController.swift
//  Profesiones App
//
//  Created by Arlid Henao Rueda on 7/21/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var ImageProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radiusImage()

        // Do any additional setup after loading the view.
    }
    
    func radiusImage(){
        //Fragemento de codigo que sirve para redondear una imagen
        self.ImageProfile.layer.cornerRadius  = self.ImageProfile.frame.height/2
        self.ImageProfile.layer.masksToBounds = false
        self.ImageProfile.clipsToBounds = true
        self.ImageProfile.contentMode = .scaleAspectFit
        //fin
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
