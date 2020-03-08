//
//  Model.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import Foundation

struct JsonData: Codable {
    let type: String
    let value: [Joke]
}

// MARK: - Value
struct Joke: Codable {
    let id: Int
    let joke: String
}
