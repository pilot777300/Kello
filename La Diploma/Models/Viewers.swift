
import Foundation

struct Viewers: Codable {
    let response: Viewer
}

struct Viewer: Codable {
    let items: [Man]
}

struct Man: Codable {
   // let city: City
    let photo_100: String
    let first_name: String
    let last_name: String
}

struct City: Codable {
    let title: String
}

var listOfViewers = [Man]()
