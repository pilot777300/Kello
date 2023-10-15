
//import Foundation
//import UIKit
//
//
//final class NetworkService {
//    func fetchSubscribersData(completion: @escaping(String) -> Void) {
//        guard  let url = URL(string:"https://api.vk.com/method/friends.get?user_id=203293513&fields=photo_100&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
//          else {
//              print("Ошибка в адресе")
//              return
//          }
//          let task = URLSession.shared.dataTask(with: url) { (data,_, _) in
//        guard let data = data
//        else {
//            print("Ошибка в получении данных")
//            return
//        }
//
//        var subscribersData: Subscribers?
//        do {
//            subscribersData = try JSONDecoder().decode(Subscribers.self, from: data)
//
//        }
//        catch {
//            print("Ошибка в декодировании данных")
//        }
//        subcsribersList = subscribersData!.response.items
//
//        DispatchQueue.main.async {
//            completion("Showing subscribers list in progress")
//        }
//    }
//    task.resume()
//    }
//
//   func fetchMyPictures(completion: @escaping(String) -> Void) {
//        guard let url = URL(string:"https://api.vk.com/method/photos.get?user_id=203293513&album_id=profile&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
//        else {
//           print("Error in URL adress")
//            return
//        }
//        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data
//            else {
//                print("ошибка в получении данных")
//                return
//            }
//
//            var myPicturesList: MyPictures?
//            do {
//                myPicturesList = try JSONDecoder().decode(MyPictures.self, from: data)
//            } catch {
//                print("Ошибка в декодировании данных из фото")
//            }
//            listOfMyPhoto = myPicturesList!.response.items
//            DispatchQueue.main.async {
//                completion("showing my pictures")
//            }
//        }
//        task.resume()
//    }

//
//    func fetchPostData(completion: @escaping(String) -> Void) {
//    guard let url = URL(string:"https://api.vk.com/method/wall.get?owner_id=7663807&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
//    else {
//        print("ERROR IN URL ADRESS FOR FETCH POST DATA")
//        return
//    }
//    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
//        guard let data = data
//        else {
//            print("ERROR IN Loading data")
//            return
//        }
//        var postList: Post?
//        do {
//            postList = try JSONDecoder().decode(Post.self, from: data)
//        } catch {
//            print("ОШИБКА В ДЕКОДИРОВАНИИ ДАННЫХ")
//
//        }
//        attributesForPost = postList!.response.items
//        DispatchQueue.main.async {
//            completion("updating tableview")
//            }
//        }
//    task.resume()
//    }


//func fetchPostPictures(completion: @escaping(String)->Void) {
//    guard let url = URL(string:"https://api.vk.com/method/photos.getAll?owner_id=7663807&extended=1&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
//    else {
//        print("Ошибка в адресе")
//        return
//    }
//    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
//        guard let data = data
//        else {
//            print("Ошибка данных")
//            return
//        }
//            var picsList: PicturesForFeed?
//            do {
//                picsList = try JSONDecoder().decode(PicturesForFeed.self, from: data)
//            }
//            catch {
//                print("Ошибка в дкодировании")
//            }
//        picturesForFeed = picsList!.response.items
//        DispatchQueue.main.async {
//            completion("reload data")
//        }
//        }
//    task.resume()
//    }
//
//    func fetchDataOfViewers(completion: @escaping(String)->Void) {
//        guard let url = URL(string:"https://api.vk.com/method/friends.get?user_id=7663807&&fields=photo_100,city&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
//
//        else {
//            print("Jшибка в адресе")
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
//            guard let data = data else {
//                print("Ошибка данных")
//                return
//            }
//            var viewerList: Viewers?
//            do {
//                viewerList = try JSONDecoder().decode(Viewers.self, from: data)
//            } catch {
//                print("Ошибка в декодировании данных")
//            }
//            listOfViewers = viewerList!.response.items
//            DispatchQueue.main.async {
//                completion("reload data")
//            }
//        }
//        task.resume()
//    }
//}


