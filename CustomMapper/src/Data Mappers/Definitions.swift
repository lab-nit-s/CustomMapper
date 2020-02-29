//
//  Definitions.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 06/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import Foundation

public typealias DataItem = [String: Any]
public typealias KeyedDataItem = (data: DataItem?, key: String)

public extension DataItem {
    func value(keyPath: String) -> Any? {
        let val = (self as NSDictionary?)?.value(forKeyPath: keyPath)
        return val
    }
}
