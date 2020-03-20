//
//  AppCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit



class AppCoordinator: BaseCoordinator, Coordinatable {
    
    var router: UINavigationController
    
    init(router: UINavigationController) {
        self.router = router
    }
    
    
    func start() {
        let authCoordinator = AuthCoordinator(router: router, factory: AuthViewsFactory())
        authCoordinator.finishFlow = {[weak self] in
            self?.removeDependency(coordinator: authCoordinator)
        }
        self.addDependency(child: authCoordinator)
        authCoordinator.start()
    }
    
    
}
