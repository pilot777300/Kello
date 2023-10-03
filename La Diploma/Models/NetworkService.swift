
import Foundation
import UIKit

//protocol NetworkServiceProtocol {
    //func getRandomJoke(completion: @escaping(String) -> Void)
 //  func getWeatherData(completion: @escaping(String) -> Void)
    //func getImageNews(completion: @escaping(UIImageView) -> Void)
//}

//var listOfMyPhoto = [Adress]()

final class NetworkService {
    func fetchSubscribersData(completion: @escaping(String) -> Void) {
        guard  let url = URL(string:"https://api.vk.com/method/friends.get?user_id=203293513&fields=photo_100&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
          else {
              print("Ошибка в адресе")
              return
          }
          let task = URLSession.shared.dataTask(with: url) { (data,_, _) in
        guard let data = data
        else {
            print("Ошибка в получении данных")
            return
        }
      //  print(">>>>>>DATA = \(data)")
        var subscribersData: Subscribers?
        do {
            subscribersData = try JSONDecoder().decode(Subscribers.self, from: data)
           // print("----------\(subscribersData!.response)")
        }
        catch {
            print("Ошибка в декодировании данных")
        }
        subcsribersList = subscribersData!.response.items
       // print("><><><><>\(subcsribersList.count)")
        DispatchQueue.main.async {
            completion("Showing subscribers list in progress")
        }
    }
    task.resume()
    }
    
   func fetchMyPictures(completion: @escaping(String) -> Void) {
        guard let url = URL(string:"https://api.vk.com/method/photos.get?user_id=203293513&album_id=profile&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
        else {
           print("Error in URL adress")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data
            else {
                print("ошибка в получении данных")
                return
            }
           // print("FOTODATA ===============\(data)")
            var myPicturesList: MyPictures?
            do {
                myPicturesList = try JSONDecoder().decode(MyPictures.self, from: data)
              //  print(":::::::::::::!!!!!!!!!!\(myPicturesList!)")
            } catch {
                print("Ошибка в декодировании данных из фото")
            }
         
            listOfMyPhoto = myPicturesList!.response.items  //[0].sizes
           // print(":::::::::::::!!!!!!!!!!\(myPicturesList)")
            //listOfMyPhoto = myPicturesList!.response
           // print(":::::::::::::!!!!!!!!!!\(listOfMyPhoto)")
            DispatchQueue.main.async {
                completion("showing my pictures")
            }
        }
        task.resume()
    }


    func fetchPostData(completion: @escaping(String) -> Void) {
    guard let url = URL(string:"https://api.vk.com/method/wall.get?owner_id=7663807&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
    else {
        print("ERROR IN URL ADRESS FOR FETCH POST DATA")
        return
    }
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
        guard let data = data
        else {
            print("ERROR IN Loading data")
            return
        }
       // print("DATA???!!!!++++++=====\(data)")
        var postList: Post?
        do {
            postList = try JSONDecoder().decode(Post.self, from: data)
        } catch {
            print("ОШИБКА В ДЕКОДИРОВАНИИ ДАННЫХ")
            
        }
        //print("POSTLIST ==\(postList)")
        attributesForPost = postList!.response.items
        DispatchQueue.main.async {
            completion("updating tableview")
            }
        }
    task.resume()
    }


func fetchPostPictures(completion: @escaping(String)->Void) {
    guard let url = URL(string:"https://api.vk.com/method/photos.getAll?owner_id=7663807&extended=1&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
    else {
        print("Ошибка в адресе")
        return
    }
    let task = URLSession.shared.dataTask(with: url) { data, _, _ in
        guard let data = data
        else {
            print("Ошибка данных")
            return
        }
            var picsList: PicturesForFeed?
            do {
                picsList = try JSONDecoder().decode(PicturesForFeed.self, from: data)
            }
            catch {
                print("Ошибка в дкодировании")
            }
        picturesForFeed = picsList!.response.items
        DispatchQueue.main.async {
            completion("reload data")
        }
        }
    task.resume()
    }
    
    func fetchDataOfViewers(completion: @escaping(String)->Void) {
        guard let url = URL(string:"https://api.vk.com/method/friends.get?user_id=7663807&&fields=photo_100,city&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131")
                
        else {
            print("Jшибка в адресе")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                print("Ошибка данных")
                return
            }
            var viewerList: Viewers?
            do {
                viewerList = try JSONDecoder().decode(Viewers.self, from: data)
            } catch {
                print("Ошибка в декодировании данных")
            }
            print("DATA???!!!!++++++=====\(data)")
            listOfViewers = viewerList!.response.items
            DispatchQueue.main.async {
                completion("reload data")
            }
        }
        task.resume()
    }
}
//
//    func getWeatherData(completion: @escaping(String) -> Void) {
//
//       // var img = UIImage(systemName: "person")
//        guard let url = URL(string: "https://newsdata.io/api/1/news?country=ru&apikey=pub_265722b7bb33f141948a5b128247efe8402d2") else {return}
//
//        let request = URLRequest(url: url)
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest) { (data, _, _)  in
//
//            guard let data = data,
//                  let news = try? JSONDecoder().decode(News.self, from: data)
//               //   let actualNew = news.results.first?.content
//                //  let newsImageURL = news.results.first?.image_url
//                 // let url2 = URL(string: "\(newsImageURL)")
//
//            else {
//                DispatchQueue.main.async {
//
//                    print("NO DATA")
//
//                   // completion("NO DATA" )
//                }
//               return
//            }
           // let actualNew = news.results.first?.content,
           // let newsImageURL = news.results.first?.image_url
           // let url2 = URL(string: "\(newsImageURL)")
           // print(url2!)
//            URLSession.shared.dataTask(with: newsImageURL) { (data, _,_) in
//                guard let data = data,
//                let image = UIImage(data: data)
//
//                else {return}
//            //    img = image
//                DispatchQueue.main.async {
//                    print("DATA::::\(image)")
//                    let x = FirstViewController(networkService: NetworkService.self as! NetworkServiceProtocol)
//                    x.imageOfNews.image = image
//                }
//
//            }.resume()
            //
           
//            guard let requestForImage = URL(string: "\(newsImageURL)") else { return }
//            let task2 = URLSession.shared.dataTask(with: requestForImage) { (data, _, _) in
//                guard let data = data,
//                      let img = UIImage(data: data)
//                else {return}
//                 newsPicture = img
////                DispatchQueue.main.async {
////                    let vc = FirstViewController(networkService: NetworkService)
////                    vc.imageOfNews.image = UIImage(data: data)
////                }
//            }
//            task2.resume()
            //
          //  DispatchQueue.global().async {
              //  let x = try? Data(contentsOf: url2)
              //  let y = UIImage(data: x!)
      //          DispatchQueue.main.async {
                    
                 //   print(actualNew)
                 //   completion(actualNew)//, y!)
           //     }
          //  }
//            DispatchQueue.main.async {
//
//                print(actualNew)
//                completion("\(actualNew)", newsPicture! )
//            }
            
           
//            guard let data = data,
//                          let object = try? JSONSerialization.jsonObject(with: data) as? [Any],//[String: Any],
//                           // let dict = object["articlesName"] as? [Any]
//                    let firstNew = object.first as? [String: Any],
//                  let txt = firstNew["articlesDescription"] as? String
//                 // let firstTxt = txt(0)//["content"]
//                //  let x = firstTxt["content"] as? String
//
//
//                      else {
//                          DispatchQueue.main.async {
//                              print("NO DATA")
//                             // print(object)
//                              completion("NO DATA")
//                          }
//                          return
//                      }
//            txt.forEach() {[self] _ in
//                      DispatchQueue.main.async {
//                         // print("____++++++++++")
//                //print($0)
//                completion($0)
//
//                     }
//                      }
     //             }


//    dataTask.resume()
//    }
    
//}
