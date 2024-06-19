//
//  MovieVC.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import UIKit

class MovieVC: UIViewController {

    @IBOutlet weak var movieTable: UITableView!
    var movieObj = MovieViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableSetUp()
        extractMovieData()
    }
    func movieTableSetUp() {
        movieTable.dataSource = self
        movieTable.delegate = self
        movieTable.reloadData()
    }
}

extension MovieVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieObj.movieArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTable.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        let cellData = movieObj.movieArr[indexPath.row]
        cell.setMovieData(data: cellData)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension MovieVC {
    func extractMovieData() {
        movieObj.fetchData {
            DispatchQueue.main.async {
                self.movieTable.reloadData()
            }
        }
    }
}
