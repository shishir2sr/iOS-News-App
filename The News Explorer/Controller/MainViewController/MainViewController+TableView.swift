
import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        registerCells()
    }
    
    func registerCells() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        }
    
    func reloadTableView(){
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.articles[indexPath.row].title
        return cell
    }
    
    
}
