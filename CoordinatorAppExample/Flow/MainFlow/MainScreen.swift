//
//  MainScreen.swift
//  CoordinatorAppExample
//
//  Created by Александр on 19.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class MainScreen: UIViewController, MainScreenProtocol {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    weak var coordinator: MainCoordinatorProtocol!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, coordinator: MainCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        guard
            let name = nameTF.text,
            let lastName = lastNameTF.text
        else { return }
        let data = [name, lastName]
        self.coordinator.onNextMainScreen(data: data)
    }

}
