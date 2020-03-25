//
//  CoordinatorFactoryProtocol.swift
//  CoordinatorAppExample
//
//  Created by Александр on 24.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProtocol: AnyObject {
    func createAuthCoordinator() -> Coordinatable & AuthCoordinatorProtocol
    func createMainCoordinator() -> Coordinatable & MainCoordinatorProtocol
}
