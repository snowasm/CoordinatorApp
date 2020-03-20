//
//  AppCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

enum State {
    case nonAuth
    case auth
}

class AppCoordinator: BaseCoordinator, Coordinatable {
    
    var state: State = .nonAuth
    
    var router: UINavigationController
    var factory: CoordinatorsFactory
    
    init(router: UINavigationController) {
        self.router = router
        self.factory = CoordinatorsFactory(router: router)
    }
    
    
    func start() {
        switch state {
            case .nonAuth:
                authFlow()
            case .auth:
                mainFlow()
        }
    }
    
    func awake() {
        authFlow()
    }
    
    private func authFlow() {
        let authCoordinator = factory.createAuthCoordinator()
        authCoordinator.finishFlow = {[weak self] (login) in
            self?.removeDependency(coordinator: authCoordinator)
            self?.state = .auth
            self?.start()
        }
        self.addDependency(child: authCoordinator)
        authCoordinator.start()
    }
    
    private func mainFlow() {
        let mainCoordinator = factory.createMainCoordinator()
        mainCoordinator.finishFlow = {[weak self] in
            self?.removeDependency(coordinator: mainCoordinator)
        }
        self.addDependency(child: mainCoordinator)
        mainCoordinator.start()
        
    }
    
    
}
