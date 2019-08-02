//
//  Constants.swift
//  FutbolCrack
//
//  Created by Julian on 3/2/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import Foundation

struct Constants {
    struct Texts {
        static let error = "Error"
        
        struct SignIn {

            // Se valida que los campos No esten vacios
            static let userFieldEmpty = "El campo USUARIO esta vacio"
            static let passFieldEmpty = "El campo CONTRASEÑA esta vacio"
            
            // Se valida que los campos esten llenos
            static let errorUserField = "El correo no es valido"
            static let errorPassField = "El correo no es valido"
            
            // Se valida el inicio de Sesiòn
            static let errorSignIn    = "El CORREO o la CONTRASEÑA son incorrectos"
            
            // Se valida mediante expresion regular que el correo y contraseña sean cumpla con los requisitos
            static let expresionRegularEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            static let expresionRegularPass = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$"
            
            // Se redirecciona al main
            static let goToMain    = "goToMain"
            
            // Titulo del pop-up
            static let titlePopUp    = "Ok"
            
            
        }
        
        struct Recover {
            
            // Boton para volver atras
            static let iconBehind = "icon-atras"
        }
        
        struct SignUp {
            
            // Boton para volver atras
            static let iconBehind = "icon-atras"
        }
        
        struct AppDelegate {
            
            // ApiKey google maps
            static let apiKeyMaps = "AIzaSyCi-BeyCJA-uTd3z1tN9Bqw1y8dTy6RQ8M"
        }
    }
}
