//
//  MainCoordinator.swift
//  CoordinatorAppExample
//
//  Created by Александр on 20.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class MainCoordinator: BaseCoordinator, MainCoordinatorProtocol {
    
    weak var parentCoordinator: AppCoordinatorProtocol!
    var state: MainState
    
    var router: Routable
    var factory: MainViewsFactoryProtocol
    
    init(parentCoordinator: AppCoordinatorProtocol, router: Routable, factory: MainViewsFactoryProtocol) {
        self.parentCoordinator = parentCoordinator
        state = .first
        self.router = router
        self.factory = factory
        super.init()
        self.factory.setCoordinator(coordinator: self)
    }
    
    
    
    override func start() {
        switch state {
            case .first:
                showMainScreen()
            case let .second(data):
                showSecondScreen(data: data)
            case let .third(data):
                showThirdScreen(data: data)
        }
    }
    
    func onNextMainScreen(data: [String]) {
        self.state = .second(data)
        self.start()
    }
    
    func onNextSecondScreen(data: [String]) {
        self.state = .third(data)
        self.start()
    }
    
    func onConfirm(data: [String]) {
        self.finishFlow(data: data)
    }
    
    func finishFlow(data: [String]) {
        self.parentCoordinator.finishMainFlow(coordinator: self, data: data)
    }
    
    
    private func showMainScreen() {
        let vcMain = factory.createMainScreen()
        router.setRootModule(vcMain, hideBar: true)
    }
    
    
    private func showSecondScreen(data: [String]) {
        let vcSecondScreen = factory.createSecondScreen(data: data)
        router.push(vcSecondScreen, animated: true)
    }
    
    private func showThirdScreen(data: [String]) {
        let vcThirdScreen = factory.createThirdScreenr(data: data)
        router.push(vcThirdScreen, animated: true)
    }
    
    
}
