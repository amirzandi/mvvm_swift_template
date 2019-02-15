//
//  RegistrationViewController.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/9/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    private var registrationViewModel: RegistrationViewModel!
    private var userModel:UserViewModel!
    
    
    @IBOutlet weak var usernameTextField:BindingTextField!{
        didSet {
            self.usernameTextField.bind { self.registrationViewModel.username = $0}
        }
    }
    @IBOutlet weak var passwordTextField:BindingTextField! {
        didSet {
            self.passwordTextField.bind{ self.registrationViewModel.password = $0 }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationViewModel = RegistrationViewModel()
        
        self.userModel = UserViewModel.init(username: "Amir Zandi", password: "applepaper")
        
        self.userModel.username.bind{ self.usernameTextField.text = $0 }
        self.userModel.password.bind{ self.passwordTextField.text = $0 }
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
       
        self.userModel.username.value = "amir"
        self.userModel.password.value = "11"
    }
}
