

import UIKit
import CoreData

class FafouritesPostsViewController: UIViewController {
    
    let coreManager = CoredataManager.shared
   private let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19)]
    private lazy var favPostTableView = UITableView()
    private let reuseIdentifier = "Cell"
   
    
    fileprivate func configureFavPostTableView() {
        favPostTableView.delegate = self
        favPostTableView.dataSource = self
        favPostTableView.allowsSelection = true
        favPostTableView.register(FavPostsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        favPostTableView.translatesAutoresizingMaskIntoConstraints = false
        favPostTableView.backgroundColor = .systemGray5
        view.addSubview(favPostTableView)
    }
    
    fileprivate func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            favPostTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -5),
            favPostTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            favPostTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            favPostTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Избранные"
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        view.backgroundColor = .systemGray4
        configureFavPostTableView()
        setupConstraints()
    }
}

extension FafouritesPostsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreManager.favPostData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favPostTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FavPostsTableViewCell
//        let feedController = FeedViewController()
//        feedController.temporaryId
        let favPost = coreManager.favPostData[indexPath.row]
        if let data = favPost.postPicture {
            let image = UIImage(data: data)
            cell.text.text = favPost.postText
            cell.author.text = favPost.postAuthor
            cell.postImage.image = image!
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        coreManager.reloadPost()
        favPostTableView.reloadData()
    }
   
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let post = coreManager.favPostData[indexPath.row]
            coreManager.deletePost(post: post)
            favPostTableView.reloadData()
        }
    }
}
