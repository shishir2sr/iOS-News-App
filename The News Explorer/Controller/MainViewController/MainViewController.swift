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
    
    // variables
    var articles: [ArticleTableCellViewModel] = []
    
    // View WIll Apear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainViewModel.getData()
    }
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewDidLoad()
        bindViewModel()
    }
    
    // MARK: Extract Method https://refactoring.guru/smells/long-method
    fileprivate func configViewDidLoad() {
        title = "The News Explorer"
        self.view.backgroundColor = .systemGray6
        setupTableView()
       
    }
    
    // MARK: Extract Method https://refactoring.guru/smells/long-method
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
    
    func openDetails(detailedArticle: ArticleTableCellViewModel){
                DispatchQueue.main.async {
                    let detailsViewModel = DetailsViewModel(article: detailedArticle)
                    let controller = DetailsViewController(viewModel: detailsViewModel)
                    self.navigationController?.pushViewController(controller, animated: true)
                }
        }
}
