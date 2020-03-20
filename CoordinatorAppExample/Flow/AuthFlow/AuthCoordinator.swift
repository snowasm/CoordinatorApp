//
//  AuthCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

enum AuthState {
    case non
    case auth
    case forgot
    case register
}

class AuthCoordinator: BaseCoordinator, Coordinatable {
    
    var finishFlow: (()->())?
    var state: AuthState
    
    
    var router: UINavigationController
    var factory: AuthViewsFactory
    
    init(router: UINavigationController, factory: AuthViewsFactory) {
        self.factory = factory
        self.router = router
//        router.isNavigationBarHidden = true
        state = .non
    }
    
    
    func start() {
        switch self.state {
            case .non:
                showSignIn()
            case .forgot:
                showForgot()
            case .auth:
                print("auth complete")
            case .register:
                showRegister()
        }
        
    }
    
    
    func showSignIn() {
        let vcSignIn = factory.createSignInViewController()
        vcSignIn.onLogin = {[weak self] (login, password) in
            print(login)
            print(password)
            self?.state = .auth
            self?.start()
        }
        vcSignIn.onForgot = {[weak self] in
            self?.state = .forgot
            self?.start()
        }
        vcSignIn.onRegister = {[weak self] in
            self?.state = .register
            self?.start()
        }
        router.pushViewController(vcSignIn, animated: true)
    }
    
    func showForgot() {
        let vcForgot = factory.createForgotViewController()
        vcForgot.onOk = { [weak self] in
            self?.state = .non
            self?.router.popViewController(animated: true)
        }
        
        router.pushViewController(vcForgot, animated: true)
    }
    
    func showRegister() {
        let vcRegister = factory.createRegisterViewController()
        vcRegister.onCreate = {[weak self] (login, pass) in
            self?.state = .non
            print(login)
            print(pass)
            self?.router.popViewController(animated: true)
        }
        
        router.pushViewController(vcRegister, animated: true)
    }
    
}
