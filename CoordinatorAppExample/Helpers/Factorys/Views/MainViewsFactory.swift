//
//  MainViewsFactory.swift
//  CoordinatorAppExample
//
//  Created by Александр on 20.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit


class MainViewsFactory: MainViewsFactoryProtocol {
    
    weak var coordinator: MainCoordinatorProtocol!
    
    func setCoordinator(coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func createMainScreen() -> (Presentable & MainScreenProtocol) {
        let mainScreen = MainScreen(nibName: "MainScreen", bundle: .main, coordinator: coordinator)
        return mainScreen
    }
    
    
    func createSecondScreen(data: [String]) -> (Presentable & SecondScreenProtocol) {
        let secondScreen = SecondScreen(nibName: "SecondScreen", bundle: .main, coordinator: coordinator, data: data)
        return secondScreen
    }
    
    func createThirdScreenr(data: [String]) -> (Presentable & ThirdScreenProtocol) {
        let thirdScreen = ThirdScreen(nibName: "ThirdScreen", bundle: .main, coordinator: coordinator, data: data)
        return thirdScreen
    }
    
}
