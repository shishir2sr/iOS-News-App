//
//  MainTableViewCell.swift
//  The News Explorer
//
//  Created by bjit on 27/1/23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    // Outlets
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsHeadline: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backView.round()
        backView.addBorder(color: .lightGray, width: 1)
        
        newsImage.round(5)
    }
    
}
