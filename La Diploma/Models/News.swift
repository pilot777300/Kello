
import Foundation

struct News: Codable {
    let status: String
    let totalResults: Int
    let results: [Results]
    
}

struct Results: Codable {
    let title: String
//    let link: URL
//    let keywords: [String]
 //   let creator: String?
//    let video_url: URL
//    let description: String
     let content: String
    let pubDate: String
    let image_url: URL?//String
//    let source_id: String
//    let category: [String]
//    let country: [String]
//    let language: String
    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.content = try container.decode(String.self, forKey: .content)
//        self.image_url = try container.decode(String.self, forKey: .image_url)
//    }
    
}
//extension Results {
//    enum CodingKeys: String, CodingKey {
//        case content
//        case image_url
//    }
//}

//extension News {
//    enum CodingKeys: String, CodingKey {
//        case status
//        case totalResults
//        case results
//    }
    
//}
