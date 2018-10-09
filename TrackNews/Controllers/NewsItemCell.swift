//
//  NewsItemCell.swift
//  TrackNews
//
//  Created by Seth Mosgin on 10/9/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import UIKit

class NewsItemCell: UITableViewCell {

    @IBOutlet var headlineLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var imagePreview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
