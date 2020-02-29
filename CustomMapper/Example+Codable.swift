//
//  Example+Codable.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 26/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import Foundation

extension ViewController {
    func parseCodableExample() {
        print("************************************************")
        print("********     Codable Example Starts      *******")
        print("************************************************")
        // Way 1
        if !JSONSerialization.isValidJSONObject(dict as Any) { return }
        do {
            let data = try JSONSerialization.data(withJSONObject: dict as Any, options: .prettyPrinted)
            let model: ResponseCodable? = try JSONDecoder().decode(ResponseCodable.self, from: data)
            print(model ?? "")
        } catch (let error) {
            print(error)
        }
        
        // or Way 2
        let model1: ResponseCodable? = DataMapper<ResponseCodable>.map(JSONObject: dict)
        print(model1 ?? "")
        
        // or Way 3
        let model2: ResponseCodable? = dict.convert()
        print(model2 ?? "")
        
        print("************************************************")
        print("********     Codable Example Ends        *******")
        print("************************************************")
    }
}

// MARK:- Codable classes

struct ResponseCodable: Codable {
    var person: PersonCodable
    var address: AddressCodable
}

struct PersonCodable: Codable {
    var name: String
    var age: Int
}

struct AddressCodable: Codable {
    let line1: String
    let pincode: Int
    
    static var decoder: JSONDecoder {
        return JSONDecoder()
    }
}
