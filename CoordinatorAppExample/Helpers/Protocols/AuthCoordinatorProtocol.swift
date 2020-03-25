//
//  AuthCoordinatorProtocol.swift
//  CoordinatorAppExample
//
//  Created by Александр on 24.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

protocol AuthCoordinatorProtocol: AnyObject {
    func onLogin(login: String, password: String)
    func onForgot()
    func onRegister()
    func finishFlow(login: String)
    
    func onResetPassword()
    
    func onCreate(login: String, password: String)
}


protocol SingInProtocol {}
protocol ForgotProtocol {}
protocol RegisterProtocol {}
