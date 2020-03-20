//
//  ThirdScreen.swift
//  CoordinatorAppExample
//
//  Created by Александр on 19.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class ThirdScreen: UIViewController {
    var onConfirm: (([String])->())?
    
    var data: [String]?
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var adresTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = data else { return }
        
        nameTF.text = data[0]
        lastNameTF.text = data[1]
        ageTF.text = data[2]
        adresTF.text = data[3]

        // Do any additional setup after loading the view.
    }


    @IBAction func confirmPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Well done",
                                      message: "Well done",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        guard let data = data else { return }
        onConfirm?(data)
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
