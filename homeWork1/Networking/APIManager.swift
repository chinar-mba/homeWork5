//
//  APIManager.swift
//  homeWork1
//
//  Created by Chinara on 5/15/23.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    let urlString = "https://dummyjson.com/products"
    
    func getData(completion: @escaping (Result<Welcome, Error>) -> Void) {
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request)
        { data, response, error in
            guard let data else {return}
            do {
                let newsData = try JSONDecoder().decode(Welcome.self, from: data)
                completion(.success(newsData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func postRequest(id: Int, title: String, completion: @escaping (Result<Int, Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products/add") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let products = Welcome(products: [.init(id: id, title: title)], total: 1, skip: 1, limit: 1)
        request.httpBody = try? JSONEncoder().encode(products)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else {return}
            
            if let error {
                completion(.failure(error))
            } else {
                completion(.success(response.statusCode))
            }
        }
        task.resume()
    }
}


