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
            request.setValue("3UMoElphjyqndoBW97pLqoidpbNyGC2d86fbks3yrrXVsaPEmor1GCazrvRqcsHfgVAxIER7mPdZh5SdpChOjkgvueoBL1pVpwO2OCrxvsfuQJqARV1EHHewegnV81ZuRQbhY09zhZHUAcGul5BW4v/xkJ01ma1bDi8mbFYmhXKcYKupR4rwhk1ahs2X0/TsEf+wqr1PWpZw20dMiIDGS2FRvSimpPHMef/Nv97dcUSTkcZiSDL4Y8SUVc2h3rzszKAOu78uK5KvvkyW7j3NPPNk16ECGIDMKzXiB5sqTv9LtAshDjfdDDT7mJeaw/Ug2bPpbggz7+4F/A2dw3V2su7cXgVv3cVW8OwnGSn8EllFcUxwOgAdKav7ROrDuPo5xeCAMnVOBJBVKXrAnN6lKHmVltGodk88evKkNOP68PuyMr0xVFuU+uLAEjZka8ojoQTY9XTJ0pBx3zRHs2eKdb0nkbnRxxCKpWcrRc27tJoS6HX1TkPv8JKmgkI/KAbdllpuJdyceE1vtu2/Lo1yLBm3v95c+ywAsSK/56yrhxPX9RPP0pdZmf/wNnpLi1XnfkgKvQqsb+wWeZdtNv/0wi6xrw3ANehg4vU2EwvWc4S5U8VBd7k0C+93Lr+nS01+P6+a8uKwJLoGPVGA2kNi7rf+T4hLeKHkpPYhr9OtjXoPjcLz4zEZ7+WF4/laVfwBFOqhe1Fi8NBT/hQ4rh8qoA//5cFxBvnJgYSrWeYEbZMwU+I2U3z9tMuvxrefymbzu00EjLEqsl47aHZRkJOkNxxJ6jX5u/+Jh1qrFXup27L5zG8JvZL+/kTqzgnJ88dhzm8FmJzzFi6qyaBHYi2eSJ1pYA8Tyc/dR4r9ds1KSU44DOr1aN2dXqCZeRchE4ePZKXs8JAmNabx27fjkpb4uaItPmG52I8J0Z2RVNrJfryI3a/lWKEozWKOnkAd6mbHw+h+/1mc18eAYluaBTBzf10QSav1IAfu4jnUPUPInN9k+LCn0Q57pQgmPBIcYntD7EQE0T4E7Lp//zvYRHGEgw==", forHTTPHeaderField: "Authorization")
            
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
