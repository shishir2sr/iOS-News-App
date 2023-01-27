//
//  DetailsViewController.swift
//  The News Explorer
//
//  Created by bjit on 27/1/23.
//

import UIKit

class DetailsViewController: UIViewController {

    // outlets
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var contentText: UILabel!

    // ViewModel
    var viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    func configView(){
        newsTitle.text = viewModel.articleTitle
        sourceName.text = viewModel.articleSource
        publishedDate.text = viewModel.articleDate
        contentText.text = viewModel.article.content
        newsImage.sd_setImage(with: viewModel.articleImage, placeholderImage: UIImage(systemName: "photo"))
    }

}
