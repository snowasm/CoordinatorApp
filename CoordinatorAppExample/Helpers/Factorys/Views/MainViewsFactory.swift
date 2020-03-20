//
//  MainViewsFactory.swift
//  CoordinatorAppExample
//
//  Created by Александр on 20.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit


class MainViewsFactory {
    
    func createMainScreen() -> MainScreen {
        let mainScreen = MainScreen(nibName: "MainScreen", bundle: .main)
        return mainScreen
    }
    
    
    func createSecondScreen() -> SecondScreen {
        let secondScreen = SecondScreen(nibName: "SecondScreen", bundle: .main)
        return secondScreen
    }
    
    func createThirdScreenr() -> ThirdScreen {
        let thirdScreen = ThirdScreen(nibName: "ThirdScreen", bundle: .main)
        return thirdScreen
    }
    
}
