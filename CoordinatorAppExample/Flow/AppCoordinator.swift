//
//  AppCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator, AppCoordinatorProtocol {
    
    var state: AppState = .nonAuth
    
    var router: Routable
    var factory: CoordinatorFactoryProtocol!
    
    init(router: Routable) {
        self.router = router
        super.init()
        self.factory = CoordinatorsFactory(parentCoordinator: self, router: router)
    }
    
    override func start() {
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
        self.addDependency(child: authCoordinator)
        authCoordinator.start()
    }
    
    func finishAuthFlow(coordinator: (Coordinatable & AuthCoordinatorProtocol), login: String) {
        self.removeDependency(coordinator: coordinator)
        self.state = .auth
        self.start()
    }
    
    private func mainFlow() {
        let mainCoordinator = factory.createMainCoordinator()
        self.addDependency(child: mainCoordinator)
        mainCoordinator.start()
        
    }
    
    func finishMainFlow(coordinator: (Coordinatable & MainCoordinatorProtocol), data: [String]) {
        self.removeDependency(coordinator: coordinator)
        print(data)
        self.state = .nonAuth
        self.start()
    }
    
}
