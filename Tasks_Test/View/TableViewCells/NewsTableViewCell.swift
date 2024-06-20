//
//  NewsTableViewCell.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setNewsData( data : Article) {
        self.authorLabel.text = data.author
        self.sourceLabel.text = (data.source?.name ?? "") + "   4y ago"
        self.titleLabel.text = data.title
        APIManager.sharedInstance.getImageData(url: data.urlToImage ?? "image") { data in
            if let recievedImage = data {
                DispatchQueue.main.async {
                    self.articleImage.image = UIImage(data: recievedImage)
                }
            }
        }
    }
}
