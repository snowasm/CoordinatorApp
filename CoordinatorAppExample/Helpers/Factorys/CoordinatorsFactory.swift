//
//  CoordinatorsFactory.swift
//  CoordinatorAppExample
//
//  Created by Александр on 20.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class CoordinatorsFactory {
    
    var router: Routable
    
    init(router: Routable) {
        self.router = router
    }
    
    
    func createAuthCoordinator() -> AuthCoordinator {
        return AuthCoordinator(router: router, factory: AuthViewsFactory())
    }
    
    func createMainCoordinator() -> MainCoordinator {
        return MainCoordinator(router: router, factory: MainViewsFactory())
    }
    
}
