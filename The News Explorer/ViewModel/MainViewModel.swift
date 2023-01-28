//
//  MainViewModel.swift
//  The News Explorer
//
//  Created by Yeasir Arefin Tusher on 26/1/23.
//

import Foundation

class MainViewModel {
    // Variables
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: [Article]?
    var articles: Observable<[ArticleTableCellViewModel]> = Observable(nil)
    // MARK: Refactoring Comment https://refactoring.guru/smells/comments
    /// Returns number of section for tableview
    ///
    /// - Parameters:
    ///   -
    ///   -
    /// - Returns: Number of Sections (Int)
    func numberOfSections() -> Int {
        return 1
    }
    // MARK: Refactoring Comment https://refactoring.guru/smells/comments
    /// Returns number of rows in section for tableview
    ///
    /// - Parameters:
    ///   - in: Integer value of section number
    ///   -
    /// - Returns: Number of Rows (Int)
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.count ?? 0
    }

    // MARK: Refactoring Comment https://refactoring.guru/smells/comments
    // MARK: Duplicate code into a single method https://refactoring.guru/smells/duplicate-code
    /// API call
    ///
    /// - Parameters:
    ///   -
    ///   -
    /// - Returns: void()
    func getData() {
        if isLoadingData.value ?? true {
            return
        }

        isLoadingData.value = true
        APICaller.getTopArticles { [weak self] result in
            self?.isLoadingData.value = false
            switch result {
            case .success(let articles):
                self?.dataSource = articles
                self?.mapArticles()
            case .failure(let err):
                print(err)
            }
        }
    }
    // MARK: Extract Method https://refactoring.guru/smells/long-method
    private func mapArticles() {
        articles.value = self.dataSource?.compactMap({ArticleTableCellViewModel(article: $0)})
    }

}
