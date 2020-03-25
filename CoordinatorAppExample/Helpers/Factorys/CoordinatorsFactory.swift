//
//  CoordinatorsFactory.swift
//  CoordinatorAppExample
//
//  Created by Александр on 20.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class CoordinatorsFactory: CoordinatorFactoryProtocol {
    
    var parentCoordinator: AppCoordinatorProtocol
    var router: Routable
    
    init(parentCoordinator: AppCoordinatorProtocol, router: Routable) {
        self.parentCoordinator = parentCoordinator
        self.router = router
    }
    
    
    func createAuthCoordinator() -> Coordinatable & AuthCoordinatorProtocol {
        return AuthCoordinator(parentCoordinator: parentCoordinator, router: router, factory: AuthViewsFactory())
    }
    
    func createMainCoordinator() -> Coordinatable & MainCoordinatorProtocol {
        return MainCoordinator(parentCoordinator: parentCoordinator, router: router, factory: MainViewsFactory())
    }
    
}
