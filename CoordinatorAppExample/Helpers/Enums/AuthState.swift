//
//  AuthState.swift
//  CoordinatorAppExample
//
//  Created by Александр on 24.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

enum AuthState {
    case non
    case auth(String)
    case forgot
    case register
}
