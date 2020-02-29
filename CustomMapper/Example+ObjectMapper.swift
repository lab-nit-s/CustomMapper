//
//  Example+ObjectMapper.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 26/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import Foundation
import ObjectMapper

extension ViewController {
    func parseObjectMapperExample() {
        
        print("*************************************************")
        print("********     Mappable Example Starts      *******")
        print("*************************************************")
        
        // Way 1
        if !JSONSerialization.isValidJSONObject(dict as Any) { return }
        let data: ResponseObjMap? = Mapper<ResponseObjMap>().map(JSONObject: dict)
        print(data ?? "")
        
        // or Way 2
        let model1: ResponseObjMap? = DataMapper<ResponseObjMap>.map(JSONObject: dict)
        print(model1 ?? "")
        
        // or Way 3
        let model2: ResponseObjMap? = dict.convert()
        print(model2 ?? "")
        
        print("***********************************************")
        print("********     Mappable Example Ends      *******")
        print("***********************************************")
    }
}

// MARK:- Object Mapper classes

struct ResponseObjMap: Mappable {
    
    var person: PersonObjMap!
    var address: AddressObjMap!
    
    init?(map: Map) {
        //
    }
    
    mutating func mapping(map: Map) {
        person <- map["person"]
        address <- map["address"]
    }
}

struct PersonObjMap: Mappable {
    init?(map: Map) {
        //
    }
    
    mutating func mapping(map: Map) {
        name <- map["name"]
        age <- map["age"]
    }
    
    var name: String!
    var age: Int!
}

struct AddressObjMap: Mappable {

    init?(map: Map) {
        //
    }
    
    mutating func mapping(map: Map) {
        line1 <- map["line1"]
        pincode <- map["pincode"]
    }
    
    var line1: String!
    var pincode: Int!
}
