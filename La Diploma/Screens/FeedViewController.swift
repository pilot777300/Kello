
import UIKit
import CoreData

class FeedViewController: UIViewController {
    
   private lazy var feedTableView = UITableView()
   private let reuseIdentifier = "Cell"
   private var postImg: UIImageView = UIImageView(image: UIImage(named: "no photo"))
  
    private let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19)]
   // private let netWork = NetworkService()
    private let internetService = NetworkManager()
    private lazy var activityIndicator: UIActivityIndicatorView = {
         let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.hidesWhenStopped = true
        var center = self.view.center
        if let navigationBarFrame = self.navigationController?.navigationBar.frame {
            center.y -= (navigationBarFrame.origin.y + navigationBarFrame.size.height)
        }
        activityIndicatorView.center = center
        self.view.addSubview(activityIndicatorView)
        return activityIndicatorView
    }()
    
    private lazy var heartImg: UIImageView = {
      let heart = UIImageView()
        heart.image = UIImage(systemName: "heart.fill")
        heart.translatesAutoresizingMaskIntoConstraints = false
        heart.isHidden = true
        heart.backgroundColor = .clear
        heart.tintColor = .red
        return heart
    }()
  
    
   fileprivate func configureFeedTableView() {
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.allowsSelection = true
       feedTableView.isUserInteractionEnabled = true
        feedTableView.separatorColor = .black
       feedTableView.register(FeedTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        feedTableView.translatesAutoresizingMaskIntoConstraints = false
       feedTableView.backgroundColor = .systemGray4
        view.addSubview(feedTableView)
       view.addSubview(heartImg)
    }
    
    fileprivate func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            feedTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            feedTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            feedTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            feedTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            heartImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heartImg.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            heartImg.widthAnchor.constraint(equalToConstant: 100),
            heartImg.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        view.backgroundColor = .white
        self.title = "Лента"
        configureFeedTableView()
        setupConstraints()
        activityIndicator.startAnimating()
        
//        netWork.fetchPostData (completion:{ [weak self] getPosts in
//            self!.feedTableView.reloadData()
//            self!.activityIndicator.stopAnimating()
//        })
        
        internetService.fetchData(urlString: "https://api.vk.com/method/wall.get?owner_id=7663807&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131") { (post:Post?) in
            attributesForPost = post!.response.items
            self.feedTableView.reloadData()
            self.activityIndicator.stopAnimating()
        }
        
     //   netWork.fetchPostPictures { [weak self] getPictures in
//            self!.feedTableView.reloadData()
//        }
        internetService.fetchData(urlString: "https://api.vk.com/method/photos.getAll?owner_id=7663807&extended=1&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131") { (picsForFeed: PicturesForFeed?) in
            picturesForFeed = picsForFeed!.response.items
            self.feedTableView.reloadData()
        }
        
//        netWork.fetchDataOfViewers { [weak self] getViewers in
//            self!.feedTableView.reloadData()
//        }
        
        internetService.fetchData(urlString: "https://api.vk.com/method/friends.get?user_id=7663807&&fields=photo_100,city&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131") { (spectators: Viewers?) in
            listOfViewers = spectators!.response.items
        }
    }
}

extension UIImageView {
    func downloadSPostImages(url: URL) {
        contentMode = .scaleAspectFit
        let dataTask = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        dataTask.resume()
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attributesForPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FeedTableViewCell
        let list = attributesForPost[indexPath.row]
        let listOfPictures = picturesForFeed[indexPath.row]
        let newArray = listOfViewers[indexPath.row]
        let url = URL(string: listOfPictures.sizes[4].url)
        let urlForViewers = URL(string: newArray.photo_100)
        if list.text != "" {
        cell.postTxt.text = list.text
        } else {
            cell.postTxt.text = "Комментариев пока нет"
            }
        cell.likes.text = String(listOfPictures.likes.count)
        cell.postImage.downloadSPostImages(url: url!)
        postImg = cell.postImage
        cell.postAuthorPicture.downloadSPostImages(url: urlForViewers!)
        cell.postAuthor.text = newArray.first_name + " " + newArray.last_name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.heartImg.isHidden = false
            Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false) { (_) in
                self.heartImg.isHidden = true
            }
        }
        let list = attributesForPost[indexPath.row]
        let newArray = listOfViewers[indexPath.row]
        let coreDataManager = CoredataManager()
        let img = postImg.image
        let compressedImg = img!.jpegData(compressionQuality: 1.0)
        coreDataManager.addPost(author: newArray.first_name + " " + newArray.last_name, text: list.text, picture: compressedImg!)
    }
}
