import UIKit

class MainViewController: UIViewController {
    // IBOutlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
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
        view.backgroundColor = .systemGray6
        setupTableView()
    }
}
