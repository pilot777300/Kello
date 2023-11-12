
import Foundation
import UIKit

 var newPostAuthorAvatar: UIImageView = {
   let avatar = UIImageView()
    avatar.translatesAutoresizingMaskIntoConstraints = false
    avatar.backgroundColor = .white
    avatar.image = UIImage(named: "Avatar80")
    avatar.layer.cornerRadius = 30
    avatar.layer.borderWidth = 1
     avatar.layer.borderColor = UIColor(named: "BlueCustomColor")?.cgColor
    avatar.layer.masksToBounds = true
  //  avatar.layer.borderColor = UIColor.white.cgColor
    return avatar
}()

 var newPostAuthor: UILabel = {
   let name = UILabel()
    name.translatesAutoresizingMaskIntoConstraints = false
    name.text = "Mister Developer"
    name.textAlignment = .left
    name.backgroundColor = .clear
    name.font = UIFont.boldSystemFont(ofSize: 18)
    return name
}()

var pictureForNewPost: UIImageView = {
  let picture = UIImageView()
    picture.translatesAutoresizingMaskIntoConstraints = false
    picture.backgroundColor = .purple
    picture.layer.masksToBounds = true
    picture.layer.cornerRadius = 15
    picture.image = UIImage(named: "no photo")
    picture.isUserInteractionEnabled = true
    return picture
}()


var textForNewPost: UITextView = {
   let post = UITextView()
    post.translatesAutoresizingMaskIntoConstraints = false
    post.backgroundColor = .systemGray6
    post.textAlignment = .left
    post.font = UIFont.systemFont(ofSize: 16)
    post.layer.masksToBounds = true
    post.layer.cornerRadius = 15
    return post
}()

var newPostAuthorLocation: UILabel = {
    let location = UILabel()
       location.translatesAutoresizingMaskIntoConstraints = false
       location.textAlignment = .left
       location.backgroundColor = .clear
       location.font = UIFont.systemFont(ofSize: 15)
       let attachment = NSTextAttachment()
       attachment.image = UIImage(systemName: "location")
       let attachmentString = NSAttributedString(attachment: attachment)
       let myString = NSMutableAttributedString(string: "Moscow  ")
       myString.append(attachmentString)
       location.attributedText = myString
       return location
}()

var placeholder: UILabel = {
   let placeholder = UILabel()
    placeholder.translatesAutoresizingMaskIntoConstraints = false
    placeholder.text = "Начните писать пост..."
    placeholder.font = .italicSystemFont(ofSize: (textForNewPost.font?.pointSize)!)
    placeholder.sizeToFit()
    textForNewPost.addSubview(placeholder)
    placeholder.textColor = .tertiaryLabel
    placeholder.isHidden = !textForNewPost.text.isEmpty
    return placeholder
}()
