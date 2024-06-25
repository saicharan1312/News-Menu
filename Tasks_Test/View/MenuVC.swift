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
    var menuArr: [Meal] = []
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
//    func extractMenuData() {
//        Task {
//            do {
//                let output = try await menuObj.fetchedData(url: dataUrls.menuUrl.rawValue)
//                DispatchQueue.main.async {
//                    self.menuArr = output
//                    self.menuTable.reloadData()
//                }
//            }
//            catch {
//                print("No data")
//            }
//        }
//    }
}

extension MenuVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(menuObj.menuArr.count)
        return menuObj.menuArr.count
        // return menuArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTable.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        let cellData = menuObj.menuArr[indexPath.row]
        cell.setMenuData(data: cellData)
//        let cellData = menuArr[indexPath.row]
//        cell.setMenuData(data: cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailedRecipeVC") as! DetailedRecipeVC
        self.navigationController?.pushViewController(recipeVC, animated: true)
        //detailedNewsVC.newsDetailObj = newsObj.newsArr[indexPath.row]
        recipeVC.recipeObj = menuArr[indexPath.row]
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

//extension MenuVC: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if !searchText.isEmpty {
//            extractMenuData(text: searchText)
//        }
//        else {
//        menuTable.reloadData()
//            extractMenuData(text: "")
//    }
//    }
//}
