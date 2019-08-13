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
            static let errorPassField = "La Contraseña no es valido"
            
            // Se valida el inicio de Sesiòn
            static let errorSignIn    = "El CORREO o la CONTRASEÑA son incorrectos"
            
            // Se valida mediante expresion regular que el correo y contraseña sean cumpla con los requisitos
            static let expresionRegularEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            static let expresionRegularPass = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,}$"
            
            // Se redirecciona al main
            static let goToMain    = "goToMain"
            
            // Titulo del pop-up
            static let titlePopUp    = "Ok"
            
            // Detalle del pop-up cuando no acepta los permisos de Facebook
            static let messagePermission    = "Rechazo los permisos para inicar sesión con Facebook"
            
            // Nombre del LaunchScreem
            static let launchScreen    = "LaunchScreen"
            
            
        }
        
        struct Recover {
            
            // Boton para volver atras
            static let iconBehind = "icon-atras"
            static let tittleCondition = "Felicitaciones"
            static let messageCondition = "Hemos enviado un e-mail a tu cuenta arliid@hotmail.com que te servirá para cambiar tu contraseña"
            static let buttonCondition = "Aceptar"
            
        }
        
        struct API_INFO {
            static let URL = "https://helpdeskmet.singleclick.co/Api/Server.php"
            static let USR = "singleclick"
            static let PASS = "rhinox9999sc"
            static let KEY = "rhinox9999sc"
        }
        
        struct SignUp {
            
            // Boton para volver atras
            static let iconBehind = "icon-atras"
            static let tittleCondition = "Terminos y Condiciones"
            static let messageCondition =
            "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever    since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,"
            static let buttonCondition = "Aceptar"
            static let fieldName = "El campo NOMBRE esta vacio"
            static let fieldIdentification = "El campo CÉDULA esta vacio"
            static let fieldBirth = "El campo FECHA DE NACIMIENTO esta vacio"
            static let fieldEmail = "El campo CORREO ELECTRONICO esta vacio"
            static let fieldCity = "El campo CITY esta vacio"
            static let fieldNumber = "El campo CELULAR esta vacio"
            static let fieldPass = "El campo CONTRASEÑA esta vacio"
            static let fieldPassConfirm = "El campo CONFIRMAR CONTRASEÑA esta vacio"
            static let fieldPassConfirmDiferent = "Las CONTRASEÑAS no son iguales"
            static let wssuccess = "Registro"
            static let wsfailure = "Error"
            static let errorCheckBox = "Se deben aceptar los terminos y condiciones"
        }
        
        struct AppDelegate {
            
            // ApiKey google maps
            static let apiKeyMaps = "AIzaSyCi-BeyCJA-uTd3z1tN9Bqw1y8dTy6RQ8M"
        }
    }
}
