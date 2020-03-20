//
//  AuthViewsFactory.swift
//  CoordinatorAppExample
//
//  Created by Александр on 20.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AuthViewsFactory {
    
    func createSignInViewController() -> SignInViewController {
        let vcSignIn = SignInViewController(nibName: "SignInViewController", bundle: .main)
        return vcSignIn
    }
    
    
    func createForgotViewController() -> ForgotViewController {
        let vcForgot = ForgotViewController(nibName: "ForgotViewController", bundle: .main)
        return vcForgot
    }
    
    func createRegisterViewController() -> RegisterViewController {
        let vcRegister = RegisterViewController(nibName: "RegisterViewController", bundle: .main)
        return vcRegister
    }
    
}
