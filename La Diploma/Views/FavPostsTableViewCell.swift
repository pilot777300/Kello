
import UIKit

class FavPostsTableViewCell: UITableViewCell {
    
    private lazy var backView: UILabel = {
       let bv = UILabel()
        bv.translatesAutoresizingMaskIntoConstraints = false
        bv.backgroundColor = .white
        bv.clipsToBounds = true
        bv.layer.cornerRadius = 10
        return bv
    }()
    
    lazy var postImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    
    lazy var author: UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 16)
        title.numberOfLines = 0
        title.textAlignment = .center
        return title
    }()
    
    lazy var text: UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 16)
        title.numberOfLines = 0
        return title
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapFunction))
//        doubleTap.numberOfTapsRequired = 2
//        self.addGestureRecognizer(doubleTap)
    }
//    @objc func doubleTapFunction() {
//        print("TAAAPPPPP22222")
   // }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(postImage)
        backView.addSubview(author)
        backView.addSubview(text)
        setCellConstraints()
    }
    
    override func  prepareForReuse() {
        super.prepareForReuse()
        postImage.image = nil
    }
    
    fileprivate func setCellConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 4),
            backView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -4),
            backView.topAnchor.constraint(equalTo: safeArea.topAnchor),
           // backView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            backView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -4),
            
            postImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 3),
            postImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 3),
            postImage.widthAnchor.constraint(equalToConstant: 150),
            postImage.heightAnchor.constraint(equalToConstant: 100),
            postImage.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -3),
            
            author.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            author.leadingAnchor.constraint(equalTo: postImage.trailingAnchor, constant: 5),
            author.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -3),
            author.heightAnchor.constraint(equalToConstant: 20),
            
            text.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 5),
            text.leadingAnchor.constraint(equalTo: postImage.trailingAnchor, constant: 5),
            text.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -3),
            text.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

}
//extension UIImageView {
//    func downloadPostImage(url: URL) {
//        contentMode = .scaleAspectFit
//        let dataTask = URLSession.shared.dataTask(with: url) {
//            (data, response, error) in
//            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
//                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                  let data = data, error == nil,
//                  let image = UIImage(data: data)
//            else {
//                return
//            }
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//        dataTask.resume()
//    }
//}
