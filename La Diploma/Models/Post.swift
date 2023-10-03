
import Foundation

struct Post: Codable {
    let response: Items
}

struct Items: Codable {
    let items: [Item]
}

struct Item: Codable {
    let comments: Comment
   // let likes: Like
    let text: String
}

struct Comment: Codable {
    let count: Int
}

//struct Like: Codable {
//    let count: Int
//}

var attributesForPost = [Item]()
