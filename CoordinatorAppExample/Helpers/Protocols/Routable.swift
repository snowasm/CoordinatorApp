//
//  Router.swift
//  CoordinatorAppExample
//
//  Created by Александр on 24.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

protocol Routable: Presentable {
  
  func present(_ module: Presentable?, animated: Bool)
  func push(_ module: Presentable?, animated: Bool)
  func popModule(animated: Bool)
  func dismissModule(animated: Bool, completion: (() -> Void)?)
  func setRootModule(_ module: Presentable?, hideBar: Bool)
  func popToRootModule(animated: Bool)
}

