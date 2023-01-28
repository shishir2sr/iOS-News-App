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
    
    // number of sections
    func numberOfSections() -> Int {
        return 1
    }
    
    //number of rows
    func numberOfRows(in section: Int) -> Int {
        
        return dataSource?.count ?? 0
    }

    
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
