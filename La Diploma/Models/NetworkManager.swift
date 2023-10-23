
import Foundation

final class NetworkManager {
    func fetchData <T: Decodable> (urlString: String, completion: @escaping(T) -> ()) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) { data, responce, error in
            if let error = error {
                print("Failed to fetch data:", error)
                return
            }
            guard let data = data else {
                return
            }
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(object)
                }
            } catch let jsonError {
                print("FAILED TO DECODE", jsonError)
            }
        }.resume()
    }
}


