//
//  NewProjectViewController.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/14/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation
import UIKit

class NewProjectViewController: UIViewController {
    
    private var projectModel:ProjectModel!
    private var projectViewModel:NewProjectViewModel!
    
    
    @IBOutlet weak var projectNameTextField:BindingTextField!{
        didSet{
            self.projectNameTextField.bind { self.projectViewModel.projectName = $0 }
        }
    }
    
    @IBOutlet weak var projectBudgetTextField:BindingTextField! {
        didSet {
            self.projectBudgetTextField.bind { self.projectViewModel.projectBudget = Double($0)}
        }
    }
    @IBOutlet weak var projectAddressTextField:BindingTextField! {
        didSet {
            self.projectAddressTextField.bind { self.projectViewModel.projectAddress = $0 }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        self.projectViewModel = NewProjectViewModel()
        self.projectModel = ProjectModel.init()
        
        
        self.projectModel.name.bind { self.projectNameTextField.text = $0 }
        self.projectModel.address.bind{ self.projectAddressTextField.text = $0 }
        self.projectModel.budget.bind { self.projectBudgetTextField.text = "\($0)" }
        
    }
    
    
    
    @IBAction func saveButton_Pressed(_ sender: UIButton) {
        self.projectModel.name.value = "پروژه تست شماره یک"
    }
    
    
}
