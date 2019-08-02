//
//  SignInViewModel.swift
//  ProyectoFutbolCrack
//
//  Created by Arlid Henao Rueda on 1/21/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import UIKit
//import FBSDKLoginKit
//import FirebaseAuth

typealias SignInHandler = ( (_ success: Bool, _ error: Error?) -> Void )

class SignInViewModel: NSObject {
    
    
    //funciòn para iniciar sesion con facebook
    //static func facebookLogin(viewController: UIViewController, handler: SignInHandler?){
        //LoginManager().logIn(readPermissions: ["email"], from: UIViewController()) { (result, error) in
            //if let error = error {
                //handler?(false, error)
                //return
            //}
            
            //guard let token = AccessToken.current?.tokenString
                //else {
                    //return
               // }
            //let credentials = FacebookAuthProvider.credential(withAccessToken: token)
            //Auth.auth().signInAndRetrieveData(with: credentials, completion: { (AuthResult, error) in
                //if let error = error {
                    //handler?(false, error)
                    //return
                //}
                //handler?(true, nil)
            //})
        //}
    //}
}
