//
//  Operators+Codable.swift
//  CustomMapper
//
//  Created by Lab Kumar Singh on 06/02/20.
//  Copyright © 2020 Lab Kumar Singh. All rights reserved.
//

import Foundation

// MARK:- Mapping Optional parameteres for KeyedDataItem
public func <<- <T: Codable>(left: inout T?, right: KeyedDataItem) {
    
    left = KeyedDataMapper<T>.mapWith(data: right.data, keyPath: right.key)
}

public func <<- <T: Codable>(left: inout [T]?, right: KeyedDataItem) {
    
    left = KeyedDataMapper<T>.mapArrayWith(data: right.data, keyPath: right.key)
}

// MARK:- Mapping Optional parameteres for DataItem
public func <<- <T: Codable>(left: inout T?, right: DataItem) {
    
    left = DataMapper<T>.map(JSONObject: right)
}

public func <<- <T: Codable>(left: inout [T]?, right: DataItem) {
    
    left = DataMapper<T>.mapArray(JSONObject: right)
}

