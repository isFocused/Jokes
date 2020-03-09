//
//  Networking.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import Foundation

class Networking {
    func parseJson(count: String, completion: @escaping ([Joke]) -> ()) {
        let jsonUrlString = "http://api.icndb.com/jokes/random/\(count)?escape=javascript"
        
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, respons, error) in
            
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(JsonData.self, from: data)
                completion(searchResult.value)
            } catch {
                print(error)
            }
        }.resume()
    }
}
