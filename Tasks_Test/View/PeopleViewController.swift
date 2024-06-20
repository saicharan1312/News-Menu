//
//  PeopleViewController.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import UIKit

class PeopleViewController: UIViewController {
    var peopleObj = PeopleViewModel()
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        extractPeopleData()
    }
}

extension PeopleViewController {
    func extractPeopleData() {
        peopleObj.fetchData {
            DispatchQueue.main.async {
                self.nameLabel.text = self.peopleObj.peopleData?.name
                self.birthYear.text = self.peopleObj.peopleData?.birth_year
                self.genderLabel.text = self.peopleObj.peopleData?.gender
                self.heightLabel.text = self.peopleObj.peopleData?.height
                if let date = self.peopleObj.peopleData?.created?.stringToDate() {
                    self.createdLabel.text = "\(date)"
                }
            }
        }
    }
}
