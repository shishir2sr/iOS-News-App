// ApiCaller.swift
import Foundation
public class ApiCaller {
    static func getTopArticles(completionHandler: @escaping (_ result: Result<[Article], NetworkError>) -> Void) {
        let urlString = NetworkConstants.shared.apiEndPoint +
                NetworkConstants.shared.apiKey
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        URLSession.shared.dataTask(with: url) { dataResponse, _, err in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .iso8601
            if err == nil,
               let data = dataResponse,
               let resultData = try? decoder.decode(NewsModel.self, from: data) {
                completionHandler(.success(resultData.articles))
            } else {
                print(err.debugDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }.resume()
    }
}
enum NetworkError: Error {
    case urlError
    case canNotParseData
}
