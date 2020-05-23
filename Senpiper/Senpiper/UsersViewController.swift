//
//  UsersViewController.swift
//  Senpiper
//
//  Created by Pavan Kalyan Jonnadula on 23/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var usersTableView: UITableView!
    var usersList : Users!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        getAllUsers()
        usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    
    func getAllUsers(){
        WebService.shared.getRequest(urlString: "https://api.jsonbin.io/b/5ec3b9a9e91d1e45d10d0700") { (json, response, error) in
            let decoder = JSONDecoder()
            do {
                self.usersList = try decoder.decode(Users.self, from: json ?? Data())
                self.usersTableView.delegate = self
                self.usersTableView.dataSource = self
                self.usersTableView.reloadData()
            }  catch {
                print("error: ", error.localizedDescription)
            }
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
          let name = usersList.names[indexPath.row]
          cell.textLabel?.text = name
          cell.textLabel?.numberOfLines = 0
          return cell
      }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.names.count
      }
}

struct Users: Codable {
    let names: [String]
}
