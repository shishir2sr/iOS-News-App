//
//  DetailsViewController.swift
//  The News Explorer
//
//  Created by bjit on 27/1/23.
//

import UIKit

class DetailsViewController: UIViewController {
    // outlets
    @IBOutlet private var newsImage: UIImageView!
    @IBOutlet private var sourceName: UILabel!
    @IBOutlet private var publishedDate: UILabel!
    @IBOutlet private var newsTitle: UILabel!
    @IBOutlet private var contentText: UILabel!

    // ViewModel
    var viewModel: DetailsViewModel
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsViewController", bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    // MARK: Refactoring Extract Method https://refactoring.guru/smells/long-method

    // MARK: Refactoring Comment https://refactoring.guru/smells/comments

    ///  This method is responsible for configuring  theview
    func configView() {
        newsTitle.text = viewModel.articleTitle
        sourceName.text = viewModel.articleSource
        publishedDate.text = viewModel.articleDate
        contentText.text = viewModel.article.content
        newsImage.sd_setImage(with: viewModel.articleImage, placeholderImage: UIImage(systemName: "photo"))
    }
}
