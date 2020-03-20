//
//  MainScreen.swift
//  CoordinatorAppExample
//
//  Created by Александр on 19.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    var onNext: ((String, String)->())?
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func nextPressed(_ sender: UIButton) {
        guard
            let name = nameTF.text,
            let lastName = lastNameTF.text
        else { return }
            
        onNext?(name, lastName)
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
