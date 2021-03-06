//
//  LoginWorker.swift
//  TesteIOS
//
//  Created by khalid ait bellahs on 21/01/19.
//  Copyright (c) 2019 ti alto nivel. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class LoginWorker {
    func doLogin(request: Login.doLogin.Request, callback: @escaping (_ request: Login.doLogin.Response?) -> Void) {
        if !(Validator.isValidEmail(email: request.user) || Validator.isValidCPF(cpf: request.user)) {
            let response = Login.doLogin.Response(userAccount: nil, error: ["Nome do usuário incorreto": "O nome do usuário deve ser um email ou CPF válido"])
            callback(response)
        } else if !Validator.isValidPassword(password: request.password) {
            let response = Login.doLogin.Response(userAccount: nil, error: ["Senha inválida": "A senha deve ser mais que 7 caracteres com pelo menos uma letra maiuscula, um caracter especial e um caracter alfanumérico"])
            callback(response)
        } else {
            RestApi.doLogin(user: request.user, password: request.password, callback: {
                response in
                let response = Login.doLogin.Response(userAccount: response!, error: nil)
                callback(response)
            }, error:{
                
            })
        }
    }
}
