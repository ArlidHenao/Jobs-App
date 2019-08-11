//
//  SignUp.swift
//  futbolcrack
//
//  Created by Arlid Henao Rueda on 1/18/19.
//  Copyright © 2019 Arlid Henao Rueda. All rights reserved.
//

import Foundation


//funcion para validar con una expresion regular si el email o password es valido
func validate(text: String, regex: String) -> Bool{
    let range = NSRange(location: 0, length: text.count)
    let regex = try? NSRegularExpression(pattern: regex)
    return regex?.firstMatch(in: text, options: [], range: range) != nil
}
//fin


