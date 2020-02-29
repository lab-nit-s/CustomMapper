//
//  Example+Mix.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 26/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import Foundation

extension ViewController {
    func parseCustomMappableMixExample() {
        
        print("********************************************")
        print("********     Mix Example Starts      *******")
        print("********************************************")
        
        // Way 1
        let model1: ResponseMix? = DataMapper<ResponseMix>.map(JSONObject: dict)
        print(model1 ?? "")
        
        // or Way 2
        let model2: ResponseMix? = dict.convert()
        print(model2 ?? "")
        
        print("******************************************")
        print("********     Mix Example Ends      *******")
        print("******************************************")
    }
}

struct ResponseMix: CustomMappable {
    
    var person: PersonCodable!
    var address: AddressObjMap!
    
    init(data: DataItem?) {
        person <<- (data, "person")
        address <<- (data, "address")
    }
}
