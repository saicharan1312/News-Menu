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
    var  movieArr : [Movies] = []
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
    func extractMovieData() {
        Task {
            do {
                let output = try await movieObj.fetchedData()
                DispatchQueue.main.async {
                    self.movieArr = output
                    //print(self.movieArr)
                    self.movieTable.reloadData()
                }
            }
            catch {
                print("No data")
            }
        }
    }
}

extension MovieVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return movieObj.movieArr.count
        return movieArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTable.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
//        let cellData = movieObj.movieArr[indexPath.row]
//        cell.setMovieData(data: cellData)
        let cellData = movieArr[indexPath.row]
        cell.setMovieData(data: cellData)
        return cell
    }
}

//
//extension MovieVC {
//    func extractMovieData() {
//        movieObj.fetchData {
//            DispatchQueue.main.async {
//                self.movieTable.reloadData()
//            }
//        }
//    }
//}
