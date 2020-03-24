//
//  BaseCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class BaseCoordinator: Coordinatable {
    
    var childCoordinators: [Coordinatable] = []
    
    func start() {}
    
    func addDependency(child: Coordinatable) {
        guard !childCoordinators.contains(where: {$0 === child}) else { return }
        childCoordinators.append(child)
    }
    
    func removeDependency(coordinator: Coordinatable?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
        else { return }

        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
}
