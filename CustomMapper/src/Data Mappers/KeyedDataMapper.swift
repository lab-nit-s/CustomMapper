//
//  ParameterMapper.swift
//  Shukran
//
//  Created by labkumar.singh on 13/03/18.
//  Copyright © 2018 Landmark Group. All rights reserved.
//

import Foundation
import ObjectMapper

// MARK:- ParameterMapper
public struct KeyedDataMapper <T> {
    
    fileprivate static func mapBasicWith(data: DataItem?, keyPath: String) -> T? {
        return (data as NSDictionary?)?.value(forKeyPath: keyPath) as? T
    }
}

public extension KeyedDataMapper where T: Codable {
    
    static func mapWith(data: DataItem?, keyPath: String) -> T? {
        let val = data?.value(keyPath: keyPath)
        
        if let basicValue = KeyedDataMapper<T>.mapBasicWith(data: data, keyPath: keyPath) {
            return basicValue
        }
        
        return DataMapper<T>.map(JSONObject: val)
    }
    
    static func mapArrayWith(data: DataItem?, keyPath: String) -> [T]? {
        let val = data?.value(keyPath: keyPath)
        return DataMapper<T>.mapArray(JSONObject: val)
    }
}

public extension KeyedDataMapper where T: BaseMappable {

    static func mapWith(data: DataItem?, keyPath: String) -> T? {
        let val = data?.value(keyPath: keyPath)
        return DataMapper<T>.map(JSONObject: val)
    }
    
    static func mapArrayWith(data: DataItem?, keyPath: String) -> [T]? {
        let val = data?.value(keyPath: keyPath)
        return DataMapper<T>.mapArray(JSONObject: val)
    }
}

public extension KeyedDataMapper where T: CustomMappable {
    
    static func mapWith(data: DataItem?, keyPath: String) -> T? {
        let val = data?.value(keyPath: keyPath)
        return DataMapper<T>.map(JSONObject: val)
    }
    
    static func mapArrayWith(data: DataItem?, keyPath: String) -> [T]? {
        let val = data?.value(keyPath: keyPath)
        return DataMapper<T>.mapArray(JSONObject: val)
    }
}
