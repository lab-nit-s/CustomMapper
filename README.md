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

# 1 Convert it directly to an Object
```swift
let model: Response? = dict.convert()
```

# 2 Extract value from dict to an object
```swift
let address: Address? = dict.convert(key: "address")
```

# 3 Use custom Operators to do the same as above
```swift
var model: Response?
model <<- dict


var address: Address?
address <<- (dict, "address")
```

# 4 Extract value for keypath
```swift
let age: Int? = dict.convert(key: "person.age")

var age: Int?
age <<- (dict, "person.age")
```



