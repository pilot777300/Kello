

import Foundation

struct MyPictures: Codable {
    let response: Pictures
}

struct Pictures: Codable {
    let count: Int
    let items: [Photo]
}

struct Photo: Codable {
    let sizes: [Adress]
}

struct Adress: Codable {
    let url: String
}

var listOfMyPhoto = [Photo]()
//var listOfMyPhoto = [Adress]()
