//
//  Cell.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/9/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation
import UIKit

class Cell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel:UILabel!
    @IBOutlet weak var prizeLabel:UILabel!
    @IBOutlet weak var rankLabel:UILabel!
    
    func configure(vm: LeaderboardUserViewModel) {
        self.usernameLabel.text = vm.username
        self.usernameLabel.adjustsFontSizeToFitWidth = true
        let fn = NumberFormatter.init()
        fn.numberStyle = .decimal
        let n = NSNumber.init(value: Int(vm.prize)!)
        self.prizeLabel.text = fn.string(from: n)
        self.prizeLabel.adjustsFontSizeToFitWidth = true
        self.rankLabel.text = "\(vm.rank)"
        self.rankLabel.adjustsFontSizeToFitWidth = true
    }
}
