//
//  ProfileViewController.swift
//  La Diploma
//
//  Created by Mac on 25.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    lazy var headerBackground: UIImageView = {
        let pic = UIImageView()
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.backgroundColor = .white
        pic.image = UIImage(named: "Header background")
        return pic
    }()
    
     lazy var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.backgroundColor = .white
        avatar.image = UIImage(named: "Avatar80")
        avatar.layer.cornerRadius = 50
        avatar.layer.borderWidth = 5
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        return avatar
    }()
    
   lazy var userName: UILabel = {
      let userName = UILabel()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "Mister Pipiskin"
        userName.textAlignment = .center
        userName.backgroundColor = .white
        userName.font = UIFont.boldSystemFont(ofSize: 20)
        return userName
    }()
    
    lazy var location: UILabel = {
     let location = UILabel()
        location.translatesAutoresizingMaskIntoConstraints = false
        //location.text = "Moscow"
        location.textAlignment = .center
        location.backgroundColor = .white
        location.font = UIFont.systemFont(ofSize: 16)
        let attachment = NSTextAttachment()
        attachment.image = UIImage(systemName: "mappin")
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: "Moscow  " )
        myString.append(attachmentString)
        location.attributedText = myString
        return location
    }()
    
   fileprivate func setConstraints() {
        let safAarea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: safAarea.topAnchor),
            headerBackground.widthAnchor.constraint(equalTo: safAarea.widthAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 150),
            
            avatar.topAnchor.constraint(equalTo: safAarea.topAnchor, constant: 130),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            avatar.centerXAnchor.constraint(equalTo: safAarea.centerXAnchor),
            
            userName.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 3),
            userName.heightAnchor.constraint(equalToConstant: 30),
            userName.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor, constant: 35),
            userName.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor, constant: -35),
            
            location.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 3),
            location.heightAnchor.constraint(equalToConstant: 20),
            location.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor, constant: 35),
            location.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor, constant: -35)
        ])
    }
    
    fileprivate func configureView() {
        view.addSubview(headerBackground)
        view.addSubview(avatar)
        view.addSubview(userName)
        view.addSubview(location)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        setConstraints()
    }
    


}
