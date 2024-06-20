//
//  MenuTableViewCell.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeLabel: UILabel!
    @IBOutlet weak var dishLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setMenuData( data : Meal) {
        self.recipeLabel.text = data.strInstructions
        self.dishLabel.text = data.strMeal
        APIManager.sharedInstance.getImageData(url: data.strMealThumb ?? "image") { data in
            if let recievedImage = data {
                DispatchQueue.main.async {
                    self.foodImage.image =  UIImage(data: recievedImage)
                }
            }
        }
    }
}
