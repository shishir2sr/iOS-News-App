import Foundation
import UIKit
extension MainViewController {
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
        mainViewModel.articles.bind { [weak self] articles in
            guard let self = self, let articles = articles else { return }
            self.articles = articles
            self.reloadTableView()
        }
        mainViewModel.errorMessage.bind { [weak self] errorMessage in
            guard let self = self, let errorMessage = errorMessage else { return }
            self.showErrorAlert(alertMessage: errorMessage)
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

    func showErrorAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
