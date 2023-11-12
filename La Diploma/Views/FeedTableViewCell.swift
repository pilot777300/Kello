
import UIKit

class FeedTableViewCell: UITableViewCell {
    
    
    
   private lazy var backView: UILabel = {
       let bv = UILabel()
        bv.translatesAutoresizingMaskIntoConstraints = false
       bv.backgroundColor = .white
       bv.clipsToBounds = true
       bv.layer.cornerRadius = 5
        return bv
    }()
    
       lazy var postAuthorPicture: UIImageView = {
       let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.backgroundColor = .clear
        picture.layer.borderColor = UIColor.white.cgColor
        picture.layer.borderWidth = 2
        picture.clipsToBounds = true
        picture.layer.cornerRadius = 25
        return picture
    }()
    
      lazy var postAuthor: UILabel = {
       let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.boldSystemFont(ofSize: 18)
        author.numberOfLines = 2
        author.textColor = .black
        author.backgroundColor = .white
        author.text = "Vasily"
        return author
    }()
    
    lazy var postTxt: UILabel = {
       let ptxt = UILabel()
       ptxt.translatesAutoresizingMaskIntoConstraints = false
       ptxt.font = UIFont.systemFont(ofSize: 17)
       ptxt.numberOfLines = 0
        ptxt.backgroundColor = .white
        ptxt.text = ""
       return ptxt
   }()
    
    lazy var postImage: UIImageView = {
       let postImg = UIImageView()
       postImg.translatesAutoresizingMaskIntoConstraints = false
       postImg.contentMode = .scaleAspectFill
       postImg.clipsToBounds = true
        postImg.layer.cornerRadius = 10
        postImg.image = UIImage(named: "no photo")
       return postImg
   }()
    
      lazy var views: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14)
          lbl.backgroundColor = .white
          lbl.text = "324"
        return lbl
    }()
    
    private lazy var likesLogo: UIImageView = {
       let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.backgroundColor = .white
        logo.image = UIImage(systemName: "hand.thumbsup.fill")
        return logo
    }()
    
    private lazy var viewsLogo: UIImageView = {
       let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.backgroundColor = .white
        logo.image = UIImage(systemName: "person.fill")
        return logo
    }()
    
     lazy var likes: UILabel = {
       let like = UILabel()
        like.translatesAutoresizingMaskIntoConstraints = false
        like.font = UIFont.systemFont(ofSize: 14)
         like.backgroundColor = .white
         like.text = "216"
        return like
    }()
    
   lazy var heartAddToFavorite: UIButton = {
        let heart = UIButton(type: .custom)
       heart.translatesAutoresizingMaskIntoConstraints = false
        heart.setImage(UIImage(systemName: "heart.fill"), for: .normal)
       return heart
   }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.clipsToBounds = true
        
    }

 //   override func prepareForReuse() {
 //       super.prepareForReuse()
       
   //     heartAddToFavorite.tintColor = isPushed ? .red : nil
//        self.accessoryType = .none
//        accessoryView = heartAddToFavorite
        
   // }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       addSubview(backView)
        backView.addSubview(postAuthor)
        backView.addSubview(postTxt)
        backView.addSubview(postImage)
        backView.addSubview(views)
        backView.addSubview(likes)
        backView.addSubview(likesLogo)
        backView.addSubview(viewsLogo)
        backView.addSubview(postAuthorPicture)
        addSubview(heartAddToFavorite)
        setCellConstraints()
    }
    
    fileprivate func setCellConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            backView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            backView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
            backView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 5),
            backView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -1),
            
            postAuthorPicture.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            postAuthorPicture.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            postAuthorPicture.heightAnchor.constraint(equalToConstant: 50),
            postAuthorPicture.widthAnchor.constraint(equalToConstant: 50),
            
            postAuthor.topAnchor.constraint(equalTo: backView.topAnchor, constant: 25),
            postAuthor.leadingAnchor.constraint(equalTo: postAuthorPicture.trailingAnchor, constant: 15),
            postAuthor.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            postAuthor.heightAnchor.constraint(equalToConstant: 20),
            
            postImage.topAnchor.constraint(equalTo: postAuthorPicture.bottomAnchor, constant: 8),
            postImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 2),
            postImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -2),
            postImage.heightAnchor.constraint(equalToConstant: 220),
  
            postTxt.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 5),
            postTxt.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 15),
            postTxt.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -3),
            postTxt.heightAnchor.constraint(equalToConstant: 50),
       
            likesLogo.topAnchor.constraint(equalTo: postTxt.bottomAnchor, constant: 5),
            likesLogo.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            likesLogo.widthAnchor.constraint(equalToConstant: 22),
            likesLogo.bottomAnchor.constraint(equalTo: backView.bottomAnchor),

            likes.topAnchor.constraint(equalTo: postTxt.bottomAnchor, constant: 5),
            likes.leadingAnchor.constraint(equalTo: likesLogo.trailingAnchor, constant: 4),
            likes.widthAnchor.constraint(equalToConstant: 80),
            likes.bottomAnchor.constraint(equalTo: backView.bottomAnchor),

            viewsLogo.topAnchor.constraint(equalTo: postTxt.bottomAnchor, constant: 5),
            viewsLogo.leadingAnchor.constraint(equalTo: likes.trailingAnchor, constant: 16),
            viewsLogo.widthAnchor.constraint(equalToConstant: 22),
            viewsLogo.bottomAnchor.constraint(equalTo: backView.bottomAnchor),

            views.topAnchor.constraint(equalTo: postTxt.bottomAnchor, constant: 5),
            views.leadingAnchor.constraint(equalTo: viewsLogo.trailingAnchor, constant: 4),
            views.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
            heartAddToFavorite.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -5),
            heartAddToFavorite.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20),
            heartAddToFavorite.widthAnchor.constraint(equalToConstant: 30),
            heartAddToFavorite.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
