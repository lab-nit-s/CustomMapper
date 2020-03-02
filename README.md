# CustomMapper
A Efficient and Scalable way to map JSON Response/Dictionary to Objects
That can handle both Codable & ObjectMapper

Suppose you have a dictionary like
```swift
let dict: [String: Any] = [
        "person": [
            "name": "demo",
            "age": 20,
        ],
        "address": [
            "line1": "line 1 here",
            "pincode": 2500
        ]
    ]
```

### 1 Convert it directly to an Object
```swift
let model: Response? = dict.convert()
```

### 2 Extract value from dict to an object
```swift
let address: Address? = dict.convert(key: "address")
```

### 3 Use custom Operators to do the same as above
```swift
var model: Response?
model <<- dict


var address: Address?
address <<- (dict, "address")
```

### 4 Extract value for keypath
```swift
let age: Int? = dict.convert(key: "person.age")

var age: Int?
age <<- (dict, "person.age")
```

### 5 Combine Codable and ObjectMapper together using Composition and `CustomMappable`
Suppose we have a Codable Person Struct & and the Address struct is Conforming to ObjectMapper.
Then we can combine them both using this framework's `CustomMappable` protocol as:
```swift
struct PersonCodable: Codable {
    var name: String
    var age: Int
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
```
```swift
struct ResponseMix: CustomMappable {
    
    var person: PersonCodable!
    var address: AddressObjMap!
    
    init(data: DataItem?) {
        person <<- (data, "person")
        address <<- (data, "address")
    }
}
```
```swift
let model: ResponseMix? = dict.convert()

var model: ResponseMix?
model <<- dict
```
