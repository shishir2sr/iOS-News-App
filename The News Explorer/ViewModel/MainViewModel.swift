//
//  MainViewModel.swift
//  The News Explorer
//
//  Created by Yeasir Arefin Tusher on 26/1/23.
//

import Foundation

class MainViewModel {
//
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: [Article]?
//    var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        return 1
    }
    
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
//                self?.mapMovieData()
                print(articles.count)
            case .failure(let err):
                print(err)
            }
        }
    }
    
//    private func mapMovieData() {
//        movies.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
//    }
//
//    func getMovieTitle(_ movie: Movie) -> String {
//        return movie.title ?? movie.name ?? ""
//    }
//
//    func retriveMovie(withId id: Int) -> Movie? {
//        guard let movie = dataSource?.results.first(where: {$0.id == id}) else {
//            return nil
//        }
//
//        return movie
//    }
}
