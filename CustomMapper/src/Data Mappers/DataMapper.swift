//
//  DataMapper.swift
//  Shukran
//
//  Created by labkumar.singh on 19/02/18.
//  Copyright © 2018 Landmark Group. All rights reserved.
//

import Foundation
import ObjectMapper

public struct DataMapper <T> { }

public extension DataMapper where T: Codable {
    
    static func map (JSONObject: Any?) -> T? {
        if JSONObject == nil || !JSONSerialization.isValidJSONObject(JSONObject as Any) { return nil }
        do {
            let data = try JSONSerialization.data(withJSONObject: JSONObject as Any, options: .prettyPrinted)
            let model: T? = try T.decoder.decode(T.self, from: data)
            return model
        } catch (let error) {
            print(error)
            return nil
        }
    }
    
    static func mapArray (JSONObject: Any?) -> [T]? {
        if JSONObject == nil || !JSONSerialization.isValidJSONObject(JSONObject as Any) { return nil }
        do {
            let data = try JSONSerialization.data(withJSONObject: JSONObject as Any, options: .prettyPrinted)
            let model: [T]? = try T.decoder.decode([T].self, from: data)
            return model
        } catch (let error) {
            print(error)
            return nil
        }
    }
}

public extension DataMapper where T: BaseMappable {
    
    static func map (JSONObject: Any?) -> T? {
        if JSONObject == nil { return nil }
        let data: T? = Mapper<T>().map(JSONObject: JSONObject)
        return data
    }
    
    static func mapArray (JSONObject: Any?) -> [T]? {
        if JSONObject == nil { return nil }
        let data: [T]? = Mapper<T>().mapArray(JSONObject: JSONObject)
        return data
    }
}

public extension DataMapper where T: CustomMappable {
    
    static func map (JSONObject: Any?) -> T? {
        if JSONObject == nil { return nil }
        let data: T? = T.init(data: JSONObject as? [String : Any])
        return data
    }
    
    static func mapArray (JSONObject: Any?) -> [T]? {
        if JSONObject == nil { return nil }
        let dataArr = JSONObject as? [[String: Any]]
        let data = dataArr?.map({T.init(data: $0)})
        return data
    }
}

