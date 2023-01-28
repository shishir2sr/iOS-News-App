import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        self.registerCells()
    }
    func registerCells() {
        self.tableView.register(ArticleTableCellViewModel.register(),
                                forCellReuseIdentifier: ArticleTableCellViewModel.identifier)
    }
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.numberOfRows(in: section)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        mainViewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableCellViewModel.identifier,
                                                       for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.setupCell(viewModel: self.articles[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.openDetails(detailedArticle: self.articles[indexPath.row])
    }
}
