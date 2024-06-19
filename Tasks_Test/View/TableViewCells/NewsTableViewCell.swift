//
//  NewsTableViewCell.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setNewsData( data : Artcle) {
        self.authorLabel.text = data.author
        //self.dateLabel.text = data.publishedAt
        self.descriptionLabel.text = data.description
        //APIManager.sharedInstance.fetchDataFromAPI(for: , url: data.urlToImage, completion: T##((Decodable & Encodable)?, Error?) -> ())
        //if let recievedImage = Image
    }
}
