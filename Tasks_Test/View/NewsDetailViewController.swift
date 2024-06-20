//
//  NewsDetailViewController.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/19/24.
//

import UIKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel2: UILabel!
    @IBOutlet weak var newsSourceLabel: UILabel!
    @IBOutlet weak var newsContentLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageLabel: UIImageView!
    var newsDetailObj: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        getDetailedNews()
        
    }
    
    func getDetailedNews() {
        titleLabel2.text = newsDetailObj?.title
        if let data = newsDetailObj?.publishedAt {
            newsDateLabel.text = String(data.prefix(10))
        }
        newsTitleLabel.text = newsDetailObj?.title
        newsAuthorLabel.text = newsDetailObj?.author
        newsSourceLabel.text = newsDetailObj?.source?.name
        newsContentLabel.text = newsDetailObj?.description
        APIManager.sharedInstance.getImageData(url: newsDetailObj?.urlToImage ?? "image") { data in
            if let recievedImage = data {
                DispatchQueue.main.async {
                    self.newsImageLabel.image = UIImage(data: recievedImage)
                }
            }
        }
    }
}
