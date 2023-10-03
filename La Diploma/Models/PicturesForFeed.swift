

import Foundation

struct PicturesForFeed: Codable {
    let response: PictureForPost
}

struct PictureForPost: Codable {
    let items: [Pic]
}

struct Pic: Codable {
    let sizes: [PicForFeed]
    let likes: Like
}

struct PicForFeed: Codable {
    let url: String
}

struct Like:Codable {
    let count: Int
}

var picturesForFeed = [Pic]()
