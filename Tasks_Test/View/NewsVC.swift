//
//  NewsVC.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var newsTable: UITableView!
    var newsObj = NewsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableSetUp()
        extractNewsData()
    }
    func newsTableSetUp() {
        newsTable.dataSource = self
        newsTable.delegate = self
        newsTable.reloadData()
    }
}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsObj.newsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let cellData = newsObj.newsArr[indexPath.row]
        cell.setNewsData(data: cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension NewsVC {
    func extractNewsData() {
        newsObj.fetchData {
            DispatchQueue.main.async {
                self.newsTable.reloadData()
            }
        }
    }
}
