//
//  Router.swift
//  CoordinatorAppExample
//
//  Created by Александр on 24.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

final class Router: Routable {
    
    weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        self.rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        guard
            let controller = module?.toPresent(),
            !(controller is UINavigationController)
        else { return }
        self.rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule(animated: Bool) {
        self.rootController?.popViewController(animated: animated)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        self.rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func setRootModule(_ module: Presentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        self.rootController?.setViewControllers([controller], animated: false)
        self.rootController?.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        self.rootController?.popToRootViewController(animated: animated)
    }
    
    func toPresent() -> UIViewController? {
        return self.rootController
    }
    
    
    
    
    
    
}
