

import Foundation

struct Subscribers: Codable {
    let response: Subscriber
    
}

struct Subscriber: Codable {
    let count: Int
    let items: [Person]
}

struct Person: Codable {
    let photo_100: String
    let first_name: String
    let last_name: String
}

var subcsribersList = [Person]()

