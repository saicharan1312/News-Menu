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
    var person: People?
    override func viewDidLoad() {
        super.viewDidLoad()
        extractPeopleData()
    }
}

extension PeopleViewController {
    func extractPeopleData() {
        Task {
            do {
                let output = try await peopleObj.fetchedData(url: dataUrls.peopleUrl.rawValue)
                DispatchQueue.main.async {
                    self.person = output
                    self.nameLabel.text = self.person?.name
                    self.birthYear.text = self.person?.birth_year
                    self.genderLabel.text = self.person?.gender
                    self.heightLabel.text = self.person?.height
                    if let date = self.person?.created?.stringToDate() {
                        self.createdLabel.text = String("\(date)".prefix(10))
                    }
                }
            }
            catch {
                print("No data")
            }
        }
    }
    
    //    func extractPeopleData() {
    //        peopleObj.fetchData {
    //            DispatchQueue.main.async {
    //                self.nameLabel.text = self.peopleObj.peopleData?.name
    //                self.birthYear.text = self.peopleObj.peopleData?.birth_year
    //                self.genderLabel.text = self.peopleObj.peopleData?.gender
    //                self.heightLabel.text = self.peopleObj.peopleData?.height
    //                if let date = self.peopleObj.peopleData?.created?.stringToDate() {
    //                    self.createdLabel.text = String("\(date)".prefix(10))
    //                }
    //            }
    //        }
    //    }
}
