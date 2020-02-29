//
//  DataItem+Extension.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 06/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import Foundation
import ObjectMapper

public extension DataItem {
    func convert<T: Codable>(key: String? = nil) -> T? {
        guard let _key = key else {
            return DataMapper<T>.map(JSONObject: self)
        }
        return KeyedDataMapper<T>.mapWith(data: self, keyPath: _key)
    }
    
    func convert<T: Codable>(key: String? = nil) -> [T]? {
        guard let _key = key else {
            return DataMapper<T>.mapArray(JSONObject: self)
        }
        return KeyedDataMapper<T>.mapArrayWith(data: self, keyPath: _key)
    }
}

public extension DataItem {
    func convert<T: BaseMappable>(key: String? = nil) -> T? {
        guard let _key = key else {
            return DataMapper<T>.map(JSONObject: self)
        }
        return KeyedDataMapper<T>.mapWith(data: self, keyPath: _key)
    }
    
    func convert<T: BaseMappable>(key: String? = nil) -> [T]? {
        guard let _key = key else {
            return DataMapper<T>.mapArray(JSONObject: self)
        }
        return KeyedDataMapper<T>.mapArrayWith(data: self, keyPath: _key)
    }
}

public extension DataItem {
    func convert<T: CustomMappable>(key: String? = nil) -> T? {
        guard let _key = key else {
            return DataMapper<T>.map(JSONObject: self)
        }
        return KeyedDataMapper<T>.mapWith(data: self, keyPath: _key)
    }
    
    func convert<T: CustomMappable>(key: String? = nil) -> [T]? {
        guard let _key = key else {
            return DataMapper<T>.mapArray(JSONObject: self)
        }
        return KeyedDataMapper<T>.mapArrayWith(data: self, keyPath: _key)
    }
}
