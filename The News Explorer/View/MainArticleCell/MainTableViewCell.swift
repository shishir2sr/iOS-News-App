//
//  MainTableViewCell.swift
//  The News Explorer
//
//  Created by bjit on 27/1/23.
//
import SDWebImage
import UIKit

class MainTableViewCell: UITableViewCell {
    // Outlets
    @IBOutlet private var newsImage: UIImageView!
    @IBOutlet private var newsHeadline: UILabel!
    @IBOutlet private var publishedDate: UILabel!
    @IBOutlet private var source: UILabel!
    @IBOutlet private var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.round()
        backView.addBorder(color: .systemGray6, width: 0.1)
        newsImage.round(5)
    }

    func setupCell(viewModel: ArticleTableCellViewModel) {
        let placeHolderImageName = "photo"
        newsHeadline.text = viewModel.title
        publishedDate.text = viewModel.publishedDate
        source.text = viewModel.sourceName
        newsImage.sd_setImage(with: viewModel.image, placeholderImage: UIImage(named: placeHolderImageName))
    }
}
