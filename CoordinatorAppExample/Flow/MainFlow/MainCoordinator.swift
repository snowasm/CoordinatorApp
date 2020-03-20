//
//  MainCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 20.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

enum MainState {
    case first
    case second(String, String)
    case third([String])
}

class MainCoordinator: BaseCoordinator, Coordinatable {
    
    var finishFlow: (()->())?
    var state: MainState
    
    
    var router: UINavigationController
    var factory: MainViewsFactory
    
    init(router: UINavigationController, factory: MainViewsFactory) {
        self.factory = factory
        self.router = router
        router.isNavigationBarHidden = true
        state = .first
    }
    
    
    
    func start() {
        switch state {
            case .first:
                showMainScreen()
            case let .second(name, lastName):
                showSecondScreen(name: name, lastName: lastName)
            case let .third(data):
                showThirdScreen(data: data)
        }
    }
    
    
    func showMainScreen() {
        let vcMain = factory.createMainScreen()
        vcMain.onNext = {[weak self] (name, lastName) in
            self?.state = .second(name, lastName)
            self?.start()
        }
        router.setViewControllers([vcMain as UIViewController], animated: true)
        
    }
    
    
    func showSecondScreen(name: String, lastName: String) {
        let vcSecondScreen = factory.createSecondScreen()
        vcSecondScreen.name = name
        vcSecondScreen.lastName = lastName
        vcSecondScreen.onNext = {[weak self] (data) in
            self?.state = .third(data)
            self?.start()
        }
        router.pushViewController(vcSecondScreen, animated: true)
    }
    
    func showThirdScreen(data: [String]) {
        let vcThirdScreen = factory.createThirdScreenr()
        vcThirdScreen.data = data
        vcThirdScreen.onConfirm = {(data) in
            
            
        }
        router.pushViewController(vcThirdScreen, animated: true)
        
        
        
    }
    
    
}
