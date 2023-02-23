//
//  APIClient.swift
//  MovieLibrary
//
//  Created by Andres Aleu on 16/2/23.
//

import Foundation

class APIClient {
   static let shared: APIClient = APIClient()
    let urlSession = URLSession.shared
    
    //Petición que devuelve un listad de peliculas populares
    func getPopularFilms(url: String, completion: @escaping (Result<[Outcome], Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1)))
            return
        }
   
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data or invalid response", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let parseJsonPopularFilms = try JSONDecoder().decode(PopularFilms.self, from: data)
                if let results = parseJsonPopularFilms.results {
                    completion(.success(results))
                }
            }catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
}

