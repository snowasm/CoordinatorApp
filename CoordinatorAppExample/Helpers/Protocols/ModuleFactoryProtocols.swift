//
//  ModuleFactoryProtocols.swift
//  CoordinatorAppExample
//
//  Created by Александр on 25.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

protocol AuthViewsFactoryProtocol: AnyObject {
    func setCoordinator(coordinator: AuthCoordinatorProtocol)
    func createSignInViewController() -> (Presentable & SingInProtocol)
    func createForgotViewController() -> (Presentable & ForgotProtocol)
    func createRegisterViewController() -> (Presentable & RegisterProtocol)
}


protocol MainViewsFactoryProtocol {
    func setCoordinator(coordinator: MainCoordinatorProtocol)
    func createMainScreen() -> (Presentable & MainScreenProtocol)
    func createSecondScreen(data: [String]) -> (Presentable & SecondScreenProtocol)
    func createThirdScreenr(data: [String]) -> (Presentable & ThirdScreenProtocol)
}
