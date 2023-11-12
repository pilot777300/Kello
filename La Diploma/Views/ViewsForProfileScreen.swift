
import Foundation
import UIKit

 let headerBackground: UIImageView = {
    let pic = UIImageView()
    pic.translatesAutoresizingMaskIntoConstraints = false
    pic.backgroundColor = .white
    pic.image = UIImage(named: "Header background")
    return pic
}()

    var avatar: UIImageView = {
    let avatar = UIImageView()
    avatar.translatesAutoresizingMaskIntoConstraints = false
    avatar.backgroundColor = .white
    avatar.image = UIImage(named: "Avatar80")
    avatar.layer.cornerRadius = 60
    avatar.layer.borderWidth = 5
    avatar.layer.masksToBounds = true
    avatar.layer.borderColor = UIColor.white.cgColor
    return avatar
}()

 var userName: UILabel = {
  let userName = UILabel()
    userName.translatesAutoresizingMaskIntoConstraints = false
    userName.text = "Mister Developer"
    userName.textAlignment = .center
    userName.backgroundColor = .white
    userName.font = UIFont.boldSystemFont(ofSize: 20)
    return userName
}()

var occupation: UILabel = {
   let occupation = UILabel()
    occupation.translatesAutoresizingMaskIntoConstraints = false
    occupation.text = "Junior Ios engeneer"
    occupation.textAlignment = .center
    occupation.backgroundColor = .white
    occupation.font = UIFont.systemFont(ofSize: 16)
    return occupation
}()

 var location: UILabel = {
 let location = UILabel()
    location.translatesAutoresizingMaskIntoConstraints = false
    location.textAlignment = .center
    location.backgroundColor = .white
    location.font = UIFont.systemFont(ofSize: 16)
    let attachment = NSTextAttachment()
    attachment.image = UIImage(systemName: "location")
    let attachmentString = NSAttributedString(attachment: attachment)
    let myString = NSMutableAttributedString(string: "Moscow  " )
    myString.append(attachmentString)
    location.attributedText = myString
    return location
}()

var logOutLogo: UIImageView = {//ActionOnImageTapped = {
   let logo = UIImageView()//ActionOnImageTapped()
    logo.translatesAutoresizingMaskIntoConstraints = false
    logo.backgroundColor = .white
    logo.image = UIImage(named: "Log out")
    logo.isUserInteractionEnabled = true
    return logo
    
}()

var editProfileLogo: UIImageView = {
   let logo = UIImageView()
    logo.translatesAutoresizingMaskIntoConstraints = false
    logo.backgroundColor = .white
    logo.image = UIImage(named: "Edit Square")
    logo.isUserInteractionEnabled = true
    return logo
}()

var mStackView: UIStackView = {
   let mStackView = UIStackView()
    mStackView.translatesAutoresizingMaskIntoConstraints = false
    mStackView.backgroundColor = .lightGray
    mStackView.axis = .horizontal
    mStackView.distribution = .fillEqually
    mStackView.alignment = .bottom
    mStackView.spacing = 0.5
    
    return mStackView
}()

var scroll: UIScrollView = {
   let scroll = UIScrollView()
    scroll.translatesAutoresizingMaskIntoConstraints = false
    scroll.backgroundColor = .systemGray4
    scroll.showsHorizontalScrollIndicator = true
    scroll.isScrollEnabled = true
    return scroll
}()

var tableView: UITableView = {
   let tv = UITableView()
    tv.translatesAutoresizingMaskIntoConstraints = false
    tv.separatorColor = .black
    tv.allowsSelection = true
    return tv
}()

var myPicturesCollectionView: UICollectionView = {
   let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let width = UIScreen.main.bounds.width / 3.1
    let heigh = UIScreen.main.bounds.height / 6
    layout.itemSize = CGSize(width: width, height: heigh)
    layout.minimumInteritemSpacing = 1
    layout.sectionInset = UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 0)
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.showsVerticalScrollIndicator = true
    cv.backgroundColor = .white
    cv.clipsToBounds = true
    cv.register(MyPicturesCollectionViewCell.self, forCellWithReuseIdentifier: "myPicturesCell")
    return cv
}()

extension UIImageView {
    func actionOnImageTapped (actionOnImageTapped action: Selector?) {
        let button = UIButton(type: .custom)
        if let action = action {
            print(" ALLOWED ONE")
            button.addTarget( self , action: action, for: .touchUpInside)
        } else {
            print("NOT ALLOWED")
            button.isUserInteractionEnabled = false
        }
    }
}
