//
//  UsersTableViewController.swift
//  TestMVVM
//
//  Created by Amir Zandi on 2/9/19.
//  Copyright © 2019 Amir Zandi. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {

    var leaderBoardViewModel = LeaderboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSchedule()
    }

    func loadSchedule() {
        let url = URL.init(string: "https://qsho.net/api/leaderboard/all")
        
        let res = Resource<LeaderboardUsersViewModel>(url: url!, secured: true) { data in
            let vm = try? JSONDecoder().decode(LeaderboardUsersViewModel.self, from: data)
            return vm
        }
        NetworkService().load(resource: res) { result in
            self.leaderBoardViewModel.list = (result?.data)!
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderBoardViewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let model = self.leaderBoardViewModel.modelAt(index: indexPath.row)
        cell.configure(vm: model)
        return cell
    }
    
    
    
    
    
}
