//
//  DetailedRecipeVC.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/20/24.
//

import UIKit

class DetailedRecipeVC: UIViewController {
    
    @IBOutlet weak var recipeTable: UITableView!
    @IBOutlet weak var dishLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    var recipeObj: Meal?
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTable.dataSource = self
        dishLabel.text = recipeObj?.strMeal
        APIManager.sharedInstance.getImageData(url: recipeObj?.strMealThumb ?? "image") { data in
            if let recievedImage = data {
                DispatchQueue.main.async {
                    self.recipeImage.image = UIImage(data: recievedImage)
                }
            }
        }
    }
}

extension DetailedRecipeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeTable.dequeueReusableCell(withIdentifier: "RecipeTableViewCell") as! RecipeTableViewCell
        cell.recipeLabel.text = recipeObj?.strInstructions
        return cell
    }
    
    
}
