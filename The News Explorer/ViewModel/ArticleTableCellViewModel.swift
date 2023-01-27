//
//  ArticleTableCellViewModel.swift
//  The News Explorer
//
//  Created by bjit on 27/1/23.
//

import Foundation
import UIKit
class ArticleTableCellViewModel {
    // variables
    var title: String
    var publishedDate: String
    var sourceName: String
    var image: URL?
    var content: String?
    
    // identifier
    static var identifier: String {
        get {
            "ArticleTableViewCell"
        }
    }
    
    // nib register
    static func register() -> UINib {
        UINib(nibName: "MainTableViewCell", bundle: nil)
    }
    
    init(article: Article) {
        
        self.title = article.title
        self.publishedDate = article.publishedAt.formatted(date: .abbreviated, time: .omitted)
        self.sourceName = article.source.name
        self.image = makeImageURL(article.urlToImage)
        self.content = article.content ?? "No data found!"
    }
    
    private func makeImageURL(_ imageAddress: String?) -> URL? {
        URL(string: imageAddress ??
            "https://cpworldgroup.com/wp-content/uploads/2021/01/placeholder.png")
    }
}
