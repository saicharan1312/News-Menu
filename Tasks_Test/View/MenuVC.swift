//
//  MenuVC.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var menuTable: UITableView!
    var menuObj = MenuViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        extractMenuData()
        menuTableSetUp()
        
    }
    func menuTableSetUp() {
        menuTable.dataSource = self
        menuTable.delegate = self
       // newsSearchBar.delegate = self
        menuTable.reloadData()
    }
}

extension MenuVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(menuObj.menuArr.count)
        return menuObj.menuArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTable.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let cellData = menuObj.menuArr[indexPath.row]
        cell.setMenuData(data: cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension MenuVC {
    func extractMenuData() {
        menuObj.fetchData {
            DispatchQueue.main.async {
                self.menuTable.reloadData()
            }
        }
    }
}
//
//extension MenuVC: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if !searchText.isEmpty {
//            extractNewsData(text: searchText)
//        }
//        else {
//        newsTable.reloadData()
//            extractNewsData(text: "")
//    }
//    }
//}
