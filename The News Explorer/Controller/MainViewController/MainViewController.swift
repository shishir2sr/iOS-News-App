//
//  MainViewController.swift
//  The News Explorer
//
//  Created by Yeasir Arefin Tusher on 26/1/23.
//

import UIKit

class MainViewController: UIViewController {
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // ViewModel
    var mainViewModel = MainViewModel()
    // Variables
    var articles: [ArticleTableCellViewModel] = []
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainViewModel.getData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewDidLoad()
        bindViewModel()
    }
    // MARK: Extract Method https://refactoring.guru/smells/long-method
    // MARK: Refactoring Comment https://refactoring.guru/smells/comments
    ///  This method is responsible for configuring  the view
    fileprivate func configViewDidLoad() {
        title = "The News Explorer"
        self.view.backgroundColor = .systemGray6
        setupTableView()
    }
    // MARK: Extract Method https://refactoring.guru/smells/long-method
    // MARK: Refactoring Comment https://refactoring.guru/smells/comments
    ///  This method is responsible for binding observable objects
    func bindViewModel() {
        // is loading
        mainViewModel.isLoadingData.bind { [weak self] isLoading in
            guard let isLoading = isLoading else {
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        mainViewModel.articles.bind {[weak self] articles in
            guard let self = self, let articles = articles else { return }
            self.articles = articles
            self.reloadTableView()

        }
    }
    // MARK: Extract Method https://refactoring.guru/smells/long-method
    // MARK: Refactoring Comment https://refactoring.guru/smells/comments
    //// This function calculates the area of a rectangle.
    ///
    /// - Parameters:
    ///   - detailedArticle: An object of ArticleTableViewModel
    ///   -
    /// - Returns: Void( )
    func openDetails(detailedArticle: ArticleTableCellViewModel) {
                DispatchQueue.main.async {
                    let detailsViewModel = DetailsViewModel(article: detailedArticle)
                    let controller = DetailsViewController(viewModel: detailsViewModel)
                    self.navigationController?.pushViewController(controller, animated: true)
                }
        }
}
