//
//  SignInViewController.swift
//  CoordinatorAppExample
//
//  Created by Александр on 17.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, SingInProtocol {
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    weak var coordinator: AuthCoordinatorProtocol!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        guard
            let login = loginTF.text,
            let pass = passTF.text
        else { return }
        self.coordinator.onLogin(login: login, password: pass)
    }
    
    @IBAction func forgotPressed(_ sender: UIButton) {
        self.coordinator.onForgot()
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        self.coordinator.onRegister()
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
