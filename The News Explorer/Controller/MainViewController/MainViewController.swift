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
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewDidLoad()
        bindViewModel()
    }
    
    fileprivate func configViewDidLoad() {
        title = "The News Explorer"
        setupTableView()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainViewModel.getData()
    }
    
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
        } // end of isloading
        
        mainViewModel.articles.bind {[weak self] articles in
            guard let self = self, let articles = articles else { return }
            
            self.articles = articles
            self.reloadTableView()
            
            
        }
        
    }
}
