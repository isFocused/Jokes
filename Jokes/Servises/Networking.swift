//
//  Networking.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import Foundation

class Networking {
    func parseJokes(count: String, completion: @escaping ([JokeModel]) -> ()) {
        let jsonUrlString = "http://api.icndb.com/jokes/random/\(count)?escape=javascript"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(JsonData.self, from: data)
                completion(result.value)
            } catch {
                print(error)
            }
        }.resume()
    }
}
