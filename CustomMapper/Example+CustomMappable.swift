//
//  Example+CustomMappable.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 26/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import Foundation

extension ViewController {
    func parseCustomMappableExample() {
        
        print("********************************************************")
        print("********     Custom Mappable Example Starts      *******")
        print("********************************************************")
        
        // Way 1
        let model1: ResponseCustom? = DataMapper<ResponseCustom>.map(JSONObject: dict)
        print(model1 ?? "")
        
        // or Way 2
        let model2: ResponseCustom? = dict.convert()
        print(model2 ?? "")
        print("******************************************************")
        print("********     Custom Mappable Example Ends      *******")
        print("******************************************************")
    }
}

// MARK:- Custom Mappable classes

struct ResponseCustom: CustomMappable {
    
    var person: PersonCustom!
    var address: AddressCustom!
    
    init(data: DataItem?) {
        person <<- (data, "person")
        address <<- (data, "address")
    }
}

struct PersonCustom: CustomMappable {
    
    init(data: DataItem?) {
        name <<- (data, "name")
        age <<- (data, "age")
    }
    
    var name: String!
    var age: Int!
}

struct AddressCustom: CustomMappable {
    
    init(data: DataItem?) {
        line1 <<- (data, "line1")
        pincode <<- (data, "pincode")
    }
    
    var line1: String!
    var pincode: Int!
}
