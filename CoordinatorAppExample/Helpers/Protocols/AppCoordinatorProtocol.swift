//
//  AppCoordinatorProtocol.swift
//  CoordinatorAppExample
//
//  Created by Александр on 24.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

protocol AppCoordinatorProtocol: AnyObject {
    func finishAuthFlow(coordinator: (Coordinatable & AuthCoordinatorProtocol), login: String)
    func finishMainFlow(coordinator: (Coordinatable & MainCoordinatorProtocol), data: [String])
}
