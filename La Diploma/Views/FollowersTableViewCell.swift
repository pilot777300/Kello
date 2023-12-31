
import UIKit

class FollowersTableViewCell: UITableViewCell {


    private let downloaderFromInternet = NetworkManager()
    lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .horizontal
       let width = UIScreen.main.bounds.width / 4.5
        let heigh = UIScreen.main.bounds.height / 11
        layout.itemSize = CGSize(width: width, height: heigh)
        layout.minimumInteritemSpacing = 7
        layout.sectionInset = UIEdgeInsets(top: 35, left: 12, bottom: 12, right: 12)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.clipsToBounds = true
       cv.isScrollEnabled = true
        cv.backgroundColor = .systemGray6
        cv.register(FollowersCollectionView.self, forCellWithReuseIdentifier: "FollowersCell")
        return cv
    }()
    
    private lazy var followersLbl: UILabel = {
        let txt = UILabel()
         txt.text = "Подписчики"
        txt.backgroundColor = .systemGray6
         txt.font = UIFont.systemFont(ofSize: 13)
         txt.translatesAutoresizingMaskIntoConstraints = false
         return txt
     }()

    private lazy var seeMore: UILabel = {
         let arr = UILabel()
        arr.font = UIFont.systemFont(ofSize: 13)
        arr.text = "See more"
        arr.backgroundColor = .systemGray6
         arr.translatesAutoresizingMaskIntoConstraints = false
        return arr
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        }
    override func layoutSubviews() {
        configureUI()
        downloaderFromInternet.fetchData(urlString: "https://api.vk.com/method/friends.get?user_id=203293513&fields=photo_100&access_token=vk1.a.4bpS6wrXVP58-y4pwdhmhEINUPFL9K88dIwQ0xaYGdzE2euE3WEXkKBMpSgv4kAiZ1V1z8BOozHL0g6EuJ6bsiLOuEbHDdu6OBciFWBqs4kKH2xMw2hzT7ZRfs58v270HG5vPHKZiyoAj5XXlGRfY2dteV89NqFIotPLyX1FWp3TZ-0KG2QJzYbia2R84Muxy-5BCF07WeAxAMgvOvC2NQ&v=5.131") { (subscribers: Subscribers?) in
            subcsribersList = (subscribers?.response.items)!
            self.collectionView.reloadData()
        }
    }
}

private extension UIImageView {
    func downloadPictures(url: URL) {
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

private extension FollowersTableViewCell {
    private func configureUI() {
        addSubview(collectionView)
        addSubview(followersLbl)
        addSubview(seeMore)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: mStackView.bottomAnchor, constant: 7),
            collectionView.leadingAnchor.constraint(equalTo: mStackView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: mStackView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 120),
           
            followersLbl.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 12),
            followersLbl.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 12),
            followersLbl.widthAnchor.constraint(equalToConstant: 120),
            followersLbl.heightAnchor.constraint(equalToConstant: 12),
            
            seeMore.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -12),
            seeMore.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 12),
            seeMore.widthAnchor.constraint(equalToConstant: 80),
            seeMore.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
}

extension FollowersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subcsribersList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowersCell", for: indexPath) as! FollowersCollectionView
        let list = subcsribersList[indexPath.row]

        if list.photo_100 != nil {
            let url = URL(string: list.photo_100)
            cell.image.downloadPictures(url: url!)
            cell.image.contentMode = .scaleToFill
            } else {
                cell.image.image = UIImage(named: "no photo")!
            }
        return cell
    }
}
