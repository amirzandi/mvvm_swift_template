//
//  LeaderboardViewModel.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/9/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import Foundation

struct LeaderboardViewModel {
    var list:[LeaderboardUserViewModel] = [LeaderboardUserViewModel]()

    func numberOfRows() -> Int {
        return list.count
    }
    func modelAt(index:Int) -> LeaderboardUserViewModel {
        return list[index]
    }
}

struct LeaderboardUserViewModel : Decodable {
    let username:String
    let prize:String
    let rank:Int
    let user_id:Int
    let profile_photo: String?
}

struct LeaderboardUsersViewModel: Decodable {
    let data : [LeaderboardUserViewModel]
}



