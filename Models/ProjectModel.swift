//
//  ProjectModel.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/14/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation

class ProjectModel {
    var name:Dynamic<String>!
    var budget:Dynamic<Double>!
    var address:Dynamic<String>!
    
    init(name:String,
         budget: Double,
         address:String ) {
        self.name = Dynamic<String>(name)
        self.budget = Dynamic<Double>(budget)
        self.address = Dynamic<String>(address)
    }
    
    init(){
        self.name = Dynamic<String>("")
        self.budget = Dynamic<Double>(0)
        self.address = Dynamic<String>("")
        
    }
}
