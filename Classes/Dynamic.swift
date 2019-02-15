//
//  Dynamic.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/14/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> Void
    var listener:Listener!
    
    var value:T? {
        didSet {
            listener?(value!)
        }
    }
    
    func bind(listener:Listener?) {
        self.listener = listener
        listener?(value!)
    }
    init(_ v:T) {
        value = v
    }
}
