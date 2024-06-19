//
//  HomeScreenVC.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import UIKit

class HomeScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func userInfoBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserInfoVC") as! UserInfoVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func peopleButton(_ sender: Any) {
        let peopleVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PeopleViewController") as! PeopleViewController
        self.navigationController?.pushViewController(peopleVC, animated: true)
    }
    @IBAction func moviesBtn(_ sender: Any) {
        let moviesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieVC") as! MovieVC
        self.navigationController?.pushViewController(moviesVC, animated: true)
    }
    @IBAction func newsBtn(_ sender: Any) {
        let newsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsVC") as! NewsVC
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
}
