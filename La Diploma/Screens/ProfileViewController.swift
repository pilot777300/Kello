

import UIKit

class ProfileViewController: UIViewController {
    
   private let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19)]
   private let myPictures = NetworkService()
   private let followersCollection = FollowersTableViewCell()
    
    
   fileprivate func setConstraints() {
        let safAarea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: view.topAnchor),
            headerBackground.widthAnchor.constraint(equalTo: safAarea.widthAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 150),
            
            avatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            avatar.widthAnchor.constraint(equalToConstant: 120),
            avatar.heightAnchor.constraint(equalToConstant: 120),
            avatar.centerXAnchor.constraint(equalTo: safAarea.centerXAnchor),
            
            logOutLogo.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: 20),
            logOutLogo.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor, constant: 30),
            logOutLogo.heightAnchor.constraint(equalToConstant: 25),
            logOutLogo.widthAnchor.constraint(equalToConstant: 25),
            
            editProfileLogo.topAnchor.constraint(equalTo: headerBackground.bottomAnchor, constant: 20),
            editProfileLogo.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor, constant: -30),
            editProfileLogo.heightAnchor.constraint(equalToConstant: 25),
            editProfileLogo.widthAnchor.constraint(equalToConstant: 25),
            
            userName.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 3),
            userName.heightAnchor.constraint(equalToConstant: 30),
            userName.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor, constant: 35),
            userName.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor, constant: -35),
            
            occupation.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 3),
            occupation.heightAnchor.constraint(equalToConstant: 20),
            occupation.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor, constant: 35),
            occupation.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor, constant: -35),
            
            location.topAnchor.constraint(equalTo: occupation.bottomAnchor, constant: 3),
            location.heightAnchor.constraint(equalToConstant: 20),
            location.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor, constant: 35),
            location.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor, constant: -35),
            
            mStackView.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 10),
            mStackView.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor, constant: 5),
            mStackView.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor, constant: -5),
            mStackView.heightAnchor.constraint(equalToConstant: 50),
            
            scroll.topAnchor.constraint(equalTo: mStackView.bottomAnchor, constant: 5),
            scroll.bottomAnchor.constraint(equalTo: safAarea.bottomAnchor),
            scroll.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor),
            
            myPicturesCollectionView.topAnchor.constraint(equalTo: mStackView.bottomAnchor, constant: 127),
            myPicturesCollectionView.leadingAnchor.constraint(equalTo: safAarea.leadingAnchor),
            myPicturesCollectionView.trailingAnchor.constraint(equalTo: safAarea.trailingAnchor),
            myPicturesCollectionView.bottomAnchor.constraint(equalTo: safAarea.bottomAnchor),
        ])
    }
    
    fileprivate func configureView() {
        let tapForEditProfile = UITapGestureRecognizer(target: self, action: #selector(startEditProfile))
        editProfileLogo.addGestureRecognizer(tapForEditProfile)
        let tapForLogOutApp = UITapGestureRecognizer(target: self, action: #selector(logOutApp))
        logOutLogo.addGestureRecognizer(tapForLogOutApp)
        let rightView = configureStackView("Подписки", number: 20)
        mStackView.addArrangedSubview(rightView)
        let centerView = configureStackView("Посты", number: 30)
        mStackView.addArrangedSubview(centerView)
        
        view.addSubview(headerBackground)
        view.addSubview(avatar)
        view.addSubview(logOutLogo)
        view.addSubview(editProfileLogo)
        view.addSubview(userName)
        view.addSubview(occupation)
        view.addSubview(location)
        view.addSubview(mStackView)
        view.addSubview(scroll)
        scroll.addSubview(followersCollection)
        view.addSubview(myPicturesCollectionView)
        myPicturesCollectionView.delegate = self
        myPicturesCollectionView.dataSource = self
    }
    
    @objc func startEditProfile(tapGestureRecognizer: UITapGestureRecognizer) {
        print("EDIT Profile is started")
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logOutApp() {
        print("LEAVE THE APP")
        
    }
    
    func configureStackView(_ nameOfVstack: String, number: Int) -> UIView {

            let myView = UIView()
            myView.backgroundColor = .white
            let vStackView = UIStackView()
            vStackView.axis  = .vertical
            vStackView.alignment = .center
            vStackView.distribution  = .fill
            vStackView.spacing = 5
            let quantity = number
            let value = String(quantity)
            let valueLabel = UILabel()
            valueLabel.text = value
           valueLabel.backgroundColor = .white//.blue
           valueLabel.textColor = UIColor(named: "BlueCustomColor")
           valueLabel.textAlignment = .center
           valueLabel.font = UIFont.boldSystemFont(ofSize: 26)
            let nameLabel = UILabel()
           nameLabel.text = nameOfVstack
           nameLabel.textColor = .darkGray
           nameLabel.font = nameLabel.font.withSize(14)
           nameLabel.backgroundColor = .white
            myView.addSubview(vStackView)
            vStackView.addArrangedSubview(valueLabel)
            vStackView.addArrangedSubview(nameLabel)
            myView.translatesAutoresizingMaskIntoConstraints = false
            vStackView.translatesAutoresizingMaskIntoConstraints = false
           valueLabel.translatesAutoresizingMaskIntoConstraints = false
           nameLabel.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([

                valueLabel.widthAnchor.constraint(equalTo: myView.widthAnchor),
                valueLabel.heightAnchor.constraint(equalToConstant: 30.0),

                vStackView.topAnchor.constraint(equalTo: myView.topAnchor),
                vStackView.bottomAnchor.constraint(equalTo: myView.bottomAnchor),
                vStackView.leadingAnchor.constraint(equalTo: myView.leadingAnchor),
                vStackView.trailingAnchor.constraint(equalTo: myView.trailingAnchor),

                ])
            return myView
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        myPictures.fetchMyPictures(completion: {getPics in
            myPicturesCollectionView.reloadData()
        })
        configureView()
        setConstraints()
    }
}
extension UIImageView {
    func downloadSubscriberImage(url: URL) {
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

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfMyPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myPicturesCollectionView.dequeueReusableCell(withReuseIdentifier: "myPicturesCell", for: indexPath) as! MyPicturesCollectionViewCell
        
        let list = listOfMyPhoto[indexPath.row]

        if list.sizes[0].url != nil {
            let url = URL(string: list.sizes[0].url)
            cell.image.downloadImage(url: url!)
            cell.image.contentMode = .scaleToFill
            } else {
                cell.image.image = UIImage(named: "no photo")!
            }
        return cell
        }
    }
    
    
    

