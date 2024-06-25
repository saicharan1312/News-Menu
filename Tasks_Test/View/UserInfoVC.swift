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
    //var usersArr: [UserModels] = []
    // var userObj = UserViewModel()
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
    
//    func extractData() {
//        Task {
//            do {
//                let output = try await userObj.fetchedData(url: dataUrls.userInfoUrl.rawValue)
//                DispatchQueue.main.async {
//                    self.usersArr = output
//                    self.userTable.reloadData()
//                }
//            }
//            catch {
//                print("No data")
//            }
//        }
//    }
}

extension UserInfoVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoObj.usersArr.count
        //print(usersArr.count)
        //return usersArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTable.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
       // let cellData = usersArr[indexPath.row]
        let cellData = userInfoObj.usersArr[indexPath.row]
        cell.setData(data: cellData)
        return cell
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


