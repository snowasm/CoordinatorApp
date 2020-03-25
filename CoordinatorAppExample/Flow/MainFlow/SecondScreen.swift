//
//  SecondScreen.swift
//  CoordinatorAppExample
//
//  Created by Александр on 19.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class SecondScreen: UIViewController, SecondScreenProtocol {
    
    var name: String?
    var lastName: String?
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var adresTF: UITextField!
    
    weak var coordinator: MainCoordinatorProtocol!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, coordinator: MainCoordinatorProtocol, data: [String]) {
        self.coordinator = coordinator
        self.name = data[0]
        self.lastName = data[1]
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = name
        lastNameTF.text = lastName
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        guard
            let age = ageTF.text,
            let adres = adresTF.text
        else { return }
        let outData = [self.name!, self.lastName!, age, adres]
        self.coordinator.onNextSecondScreen(data: outData)
    }

}
