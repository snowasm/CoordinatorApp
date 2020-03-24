//
//  AuthCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AuthCoordinator: BaseCoordinator {
    
    var finishFlow: ((String)->())?
    var state: AuthState
    
    
    var router: Routable
    var factory: AuthViewsFactory
    
    init(router: Routable, factory: AuthViewsFactory) {
        self.factory = factory
        self.router = router
        state = .non
    }
    
    
    override func start() {
        switch self.state {
            case .non:
                showSignIn()
            case .forgot:
                showForgot()
            case .auth(let login):
                print("auth complete")
                self.finishFlow?(login)
            case .register:
                showRegister()
        }
        
    }
    
    
    func showSignIn() {
        let vcSignIn = factory.createSignInViewController()
        vcSignIn.onLogin = {[weak self] (login, password) in
            print(login)
            print(password)
            self?.state = .auth(login)
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
        router.setRootModule(vcSignIn, hideBar: true)
    }
    
    func showForgot() {
        let vcForgot = factory.createForgotViewController()
        vcForgot.onOk = { [weak self] in
            self?.state = .non
            self?.router.popModule(animated: true)
        }
        
        router.push(vcForgot, animated: true)
    }
    
    func showRegister() {
        let vcRegister = factory.createRegisterViewController()
        vcRegister.onCreate = {[weak self] (login, pass) in
            self?.state = .non
            print(login)
            print(pass)
            self?.router.popModule(animated: true)
        }
        
        router.push(vcRegister, animated: true)
    }
    
}
