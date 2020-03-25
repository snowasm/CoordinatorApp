//
//  ThirdScreen.swift
//  CoordinatorAppExample
//
//  Created by Александр on 19.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class ThirdScreen: UIViewController, ThirdScreenProtocol {
    
    var name: String?
    var lastName: String?
    var age: String?
    var adres: String?
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var adresTF: UITextField!
    
    weak var coordinator: MainCoordinatorProtocol!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, coordinator: MainCoordinatorProtocol, data: [String]) {
        self.coordinator = coordinator
        self.name = data[0]
        self.lastName = data[1]
        self.age = data[2]
        self.adres = data[3]
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.text = name
        lastNameTF.text = lastName
        ageTF.text = age
        adresTF.text = adres
    }


    @IBAction func confirmPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Well done",
                                      message: "Well done",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] (action) in
            guard
                let name = self?.name,
                let lastName = self?.lastName,
                let age = self?.age,
                let adres = self?.adres
            else { return }
            
            let outData = [name, lastName, age, adres]
            self?.coordinator.onConfirm(data: outData)
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}
