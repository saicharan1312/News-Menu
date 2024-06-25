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
    var newsArr: [Article] = []
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
//    func extractNewsData() {
//        Task {
//            do {
//                let output = try await newsObj.fetchedData(url: dataUrls.newsUrl.rawValue)
//                DispatchQueue.main.async {
//                    self.newsArr = output
//                    self.newsTable.reloadData()
//                }
//            }
//            catch {
//                print("No data")
//            }
//        }
}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsObj.newsArr.count
        //return newsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTable.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let cellData = newsObj.newsArr[indexPath.row]
        cell.setNewsData(data: cellData)
//        let cellData = newsArr[indexPath.row]
//        cell.setNewsData(data: cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedNewsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        self.navigationController?.pushViewController(detailedNewsVC, animated: true)
        detailedNewsVC.newsDetailObj = newsObj.newsArr[indexPath.row]
        //detailedNewsVC.newsDetailObj = newsArr[indexPath.row]
        
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

