//
//  CustomMappable.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 06/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import Foundation

public protocol CustomMappable {
    init(data: DataItem?)
}

public extension Decodable {
    static var decoder: JSONDecoder {
        return JSONDecoder()
    }
}
