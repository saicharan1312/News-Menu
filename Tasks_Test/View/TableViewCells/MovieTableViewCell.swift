//
//  MovieTableViewCell.swift
//  Tasks_Test
//
//  Created by Sai Charan Thummalapudi on 6/18/24.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var transTitleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var createdTitle: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setMovieData(data: Movies){
        self.createdTitle.text = data.created_at
        self.titleLabel.text = data.title
        for i in data.transcodings! {
            self.heightLabel.text = "\(i.height)"
            self.idLabel.text = i.id
            self.transTitleLabel.text = i.title
        }
    }
}
