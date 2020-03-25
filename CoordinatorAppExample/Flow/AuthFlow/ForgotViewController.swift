//
//  ForgotViewController.swift
//  CoordinatorAppExample
//
//  Created by Александр on 19.03.2020.
//  Copyright © 2020 Александр. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController, ForgotProtocol {
    @IBOutlet weak var emailTF: UITextField!
    
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

    @IBAction func resetPressed(_ sender: UIButton) {
        guard let email = emailTF.text else { return }
        let alert = UIAlertController(title: "Reset password",
                                      message: "New password sended to email \(email)",
                                        preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] (action) in
            self?.coordinator.onResetPassword()
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
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
