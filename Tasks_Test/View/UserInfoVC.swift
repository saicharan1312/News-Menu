//
//  UserInfoVC.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import UIKit

class UserInfoVC: UIViewController {
    
    @IBOutlet weak var userTable: UITableView!
    var userInfoObj = UserInfoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetUp()
        extractData()
    }
    func tableSetUp() {
        userTable.dataSource = self
        userTable.delegate = self
        userTable.reloadData()
    }
}

extension UserInfoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoObj.usersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTable.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let cellData = userInfoObj.usersArr[indexPath.row]
        cell.setData(data: cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension UserInfoVC {
    func extractData() {
        userInfoObj.fetchData {
            DispatchQueue.main.async {
                self.userTable.reloadData()
            }
        }
    }
}



