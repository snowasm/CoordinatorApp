//
//  AuthCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AuthCoordinator: BaseCoordinator, AuthCoordinatorProtocol {
    
    var state: AuthState
    
    weak var parentCoordinator: AppCoordinatorProtocol!
    var router: Routable
    var factory: AuthViewsFactoryProtocol
    
    init(parentCoordinator: AppCoordinatorProtocol, router: Routable, factory: AuthViewsFactoryProtocol) {
        self.parentCoordinator = parentCoordinator
        self.router = router
        self.state = .non
        self.factory = factory
        super.init()
        self.factory.setCoordinator(coordinator: self)
    }
    
    
    override func start() {
        switch self.state {
            case .non:
                showSignIn()
            case .forgot:
                showForgot()
            case .auth(let login):
                print("auth complete")
                self.finishFlow(login: login)
            case .register:
                showRegister()
        }
        
    }
    
    func onLogin(login: String, password: String) {
        print(login)
        print(password)
        self.state = .auth(login)
        self.start()
    }
    
    func onForgot() {
        self.state = .forgot
        self.start()
    }
    
    func onRegister() {
        self.state = .register
        self.start()
    }
    
    func onResetPassword() {
        self.state = .non
        self.router.popModule(animated: true)
    }
    
    func onCreate(login: String, password: String) {
        self.state = .non
        print(login)
        print(password)
        self.router.popModule(animated: true)
    }
    
    func finishFlow(login: String) {
        self.parentCoordinator.finishAuthFlow(coordinator: self, login: login)
    }
    
    
    private func showSignIn() {
        let vcSignIn = factory.createSignInViewController()
        router.setRootModule(vcSignIn, hideBar: true)
    }
    
    private func showForgot() {
        let vcForgot = factory.createForgotViewController()
        router.push(vcForgot, animated: true)
    }
    
    private func showRegister() {
        let vcRegister = factory.createRegisterViewController()
        router.push(vcRegister, animated: true)
    }
    
}
