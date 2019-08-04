//
//  SignInViewModel.swift
//  ProyectoFutbolCrack
//
//  Created by Arlid Henao Rueda on 1/21/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FirebaseAuth
import GoogleSignIn

typealias SignInHandler = ( (_ success: Bool, _ error: Error?) -> Void )

class SignInViewModel: NSObject {
    
    
    //funciòn para iniciar sesion con facebook
    static func facebookLogin(viewController: UIViewController, handler: SignInHandler?) {
        FBSDKLoginManager().logIn(withReadPermissions: ["email"], from: viewController) { (result, error) in
            if let error = error {
                handler?(false, error)
                return
            }
            
            guard let token = FBSDKAccessToken.current()?.tokenString else { return }
            let credentials = FacebookAuthProvider.credential(withAccessToken: token)
            Auth.auth().signIn(with: credentials, completion: { (authResult, error) in
                
                handler?(true, nil)
            })
        }
    }
}
