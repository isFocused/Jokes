//
//  Model.swift
//  JsonData
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import Foundation

struct JsonData: Codable {
    let type: String
    let value: [Joke]
}
