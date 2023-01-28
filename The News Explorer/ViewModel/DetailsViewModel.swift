//
//  DetailsViewModel.swift
//  The News Explorer
//
//  Created by bjit on 27/1/23.
//

import Foundation

class DetailsViewModel {
    var article: ArticleTableCellViewModel
    var articleImage: URL?
    var articleTitle: String
    var articleContent: String
    var articleDate: String
    var articleSource: String
    init(article: ArticleTableCellViewModel) {
        self.article = article
        articleTitle = article.title
        articleContent = article.content ?? ""
        articleDate = article.publishedDate
        articleSource = article.sourceName
        articleImage = article.image
    }

    private func makeImageURL(_ url: String) -> URL? {
        URL(string: url)
    }
}
