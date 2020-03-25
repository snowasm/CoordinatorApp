//
//  AuthViewsFactory.swift
//  CoordinatorAppExample
//
//  Created by Александр on 20.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AuthViewsFactory: AuthViewsFactoryProtocol {
    
    weak var coordinator: AuthCoordinatorProtocol!
    
    func setCoordinator(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func createSignInViewController() -> (Presentable & SingInProtocol) {
        let vcSignIn = SignInViewController(nibName: "SignInViewController", bundle: .main, coordinator: coordinator)
        return vcSignIn
    }
    
    
    func createForgotViewController() -> (Presentable & ForgotProtocol) {
        let vcForgot = ForgotViewController(nibName: "ForgotViewController", bundle: .main, coordinator: coordinator)
        return vcForgot
    }
    
    func createRegisterViewController() -> (Presentable & RegisterProtocol) {
        let vcRegister = RegisterViewController(nibName: "RegisterViewController", bundle: .main,  coordinator: coordinator)
        return vcRegister
    }
    
}
