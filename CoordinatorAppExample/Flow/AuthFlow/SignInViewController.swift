//
//  SignInViewController.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    var onLogin: ((String, String)->())?
    var onForgot: (()->())?
    var onRegister: (()->())?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        guard
            let login = loginTF.text,
            let pass = passTF.text
        else { return }
        self.onLogin?(login, pass)
    }
    
    @IBAction func forgotPressed(_ sender: UIButton) {
        self.onForgot?()
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        self.onRegister?()
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
