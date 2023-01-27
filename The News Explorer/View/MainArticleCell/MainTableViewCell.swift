//
//  MainTableViewCell.swift
//  The News Explorer
//
//  Created by bjit on 27/1/23.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {
    
    // Outlets
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsHeadline: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.round()
        backView.addBorder(color: .systemGray6, width: 0.1)
        newsImage.round(5)
        
    }

     func setupCell(viewModel: ArticleTableCellViewModel) {
        self.newsHeadline.text = viewModel.title
        self.publishedDate.text = viewModel.publishedDate
        self.source.text = viewModel.sourceName
        self.newsImage.sd_setImage(with: viewModel.image, placeholderImage: UIImage(named: "photo"))
    }
    
}
