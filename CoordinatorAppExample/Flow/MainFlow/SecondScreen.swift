//
//  SecondScreen.swift
//  CoordinatorAppExample
//
//  Created by Александр on 19.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class SecondScreen: UIViewController {
    
    var onNext: (([String])->())?
    var name: String?
    var lastName: String?
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var adresTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = name
        lastNameTF.text = lastName
        // Do any additional setup after loading the view.
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        guard
            let age = ageTF.text,
            let adres = adresTF.text
        else { return }
        let outData = [self.name!, self.lastName!, age, adres]
        onNext?(outData)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
