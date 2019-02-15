//
//  BindingTextField.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/9/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation
import UIKit

class BindingTextField:UITextField {
    var textChanged :(String) -> () = {_ in }
    
    func bind(callback: @escaping (String) -> ()) {
        self.textChanged = callback
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    @objc func textFieldDidChange(_ sender:UITextField) {
        self.textChanged(sender.text!)
    }
}
