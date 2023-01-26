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

// Main ViewModel
    var mainViewModel = MainViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewDidLoad()
    }
    
    fileprivate func configViewDidLoad() {
        title = "The News Explorer"
        setupTableView()
        mainViewModel.getData()
    }

}
