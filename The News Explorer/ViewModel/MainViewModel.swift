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
    var errorMessage: Observable<String> = Observable(nil)

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
    func numberOfRows(in _: Int) -> Int {
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
        ApiCaller.getTopArticles { [weak self] result in
            self?.isLoadingData.value = false
            switch result {
            case let .success(articles):
                self?.dataSource = articles
                self?.mapArticles()
            case let .failure(error):
                self?.errorMessage.value = error.localisedDescription
            }
        }
    }

    // MARK: Extract Method https://refactoring.guru/smells/long-method

    private func mapArticles() {
        articles.value = dataSource?.compactMap { ArticleTableCellViewModel(article: $0) }
    }
}
