//
//  NetworkService.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/9/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation


struct Resource<T> {
    let url: URL
    var secured:Bool = false
    var parse: (Data) -> T?
}

final class NetworkService {
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        if resource.secured {
            var request = URLRequest.init(url: resource.url)
            request.setValue("token", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTask(with: request) {data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        completion(resource.parse(data))
                    }
                }
                else {
                    completion(nil)
                }
            }.resume()
            
        }
        else {
            URLSession.shared.dataTask(with: resource.url){ data, resonse, error in
                if let data = data {
                    DispatchQueue.main.async {
                        completion(resource.parse(data))
                    }
                }
                else {
                    completion(nil)
                }
            }.resume()
        }
        
    }
}
