import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        registerCells()
    }

    func registerCells() {
        tableView.register(ArticleTableCellViewModel.register(),
                           forCellReuseIdentifier: ArticleTableCellViewModel.identifier)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel.numberOfRows(in: section)
    }

    func numberOfSections(in _: UITableView) -> Int {
        mainViewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableCellViewModel.identifier,
                                                       for: indexPath) as? MainTableViewCell
        else {
            return UITableViewCell()
        }
        cell.setupCell(viewModel: articles[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        160
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        openDetails(detailedArticle: articles[indexPath.row])
    }
}
