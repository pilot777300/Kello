

import UIKit

class SettingsViewController: UIViewController {
    
   private let settingsList = ["Профиль", "Изменить пароль", "Уведомления", "Безопасность", "О приложении"]
    
    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "dark background-2")
        return view
    }()

    private lazy var rectangle: UILabel = {
       let rectangle = UILabel()
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        rectangle.backgroundColor = .systemGray5.withAlphaComponent(0.1)
        rectangle.layer.cornerRadius = 10
        rectangle.clipsToBounds = true
        return rectangle
    }()
    
     lazy var avatar: UIImageView = {
      let avatar = UIImageView()
      avatar.translatesAutoresizingMaskIntoConstraints = false
      avatar.backgroundColor = .white
      avatar.image = UIImage(named: "Avatar80")
      avatar.layer.cornerRadius = 40
      avatar.layer.borderWidth = 2
      avatar.layer.masksToBounds = true
      avatar.layer.borderColor = UIColor.white.cgColor
      return avatar
  }()
    
    private lazy  var userName: UILabel = {
     let userName = UILabel()
       userName.translatesAutoresizingMaskIntoConstraints = false
       userName.text = "Mister Developer"
       userName.textAlignment = .left
       userName.backgroundColor = .clear
        userName.textColor = .white
       userName.font = UIFont.boldSystemFont(ofSize: 20)
       return userName
   }()

    private lazy var occupation: UILabel = {
      let occupation = UILabel()
       occupation.translatesAutoresizingMaskIntoConstraints = false
       occupation.text = "Junior Ios engeneer"
       occupation.textAlignment = .left
       occupation.backgroundColor = .clear
       occupation.font = UIFont.systemFont(ofSize: 16)
        occupation.textColor = .white
       return occupation
   }()
    
   private lazy var logOutButton: UILabel = {
        let btn = UILabel()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.textAlignment = .center
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.clipsToBounds = true
        btn.font = UIFont.systemFont(ofSize: 16)
       let attachment = NSTextAttachment()
       attachment.image = UIImage(named: "Log out")
       let attachmentString = NSAttributedString(attachment: attachment)
       let myString = NSMutableAttributedString(string: "Выйти " )
       myString.append(attachmentString)
        btn.attributedText = myString
       return btn
   }()
    
   private let settingstableView = UITableView()
   private let reuseidentifier = "Cell"
    
    fileprivate func configureSettingsTableView() {
        settingstableView.delegate = self
        settingstableView.dataSource = self
        settingstableView.allowsSelection = true
        settingstableView.translatesAutoresizingMaskIntoConstraints = false
        settingstableView.separatorColor = .black
        settingstableView.backgroundColor = .clear
        settingstableView.isScrollEnabled = false
        settingstableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: reuseidentifier)
        view.addSubview(settingstableView)
    }

    fileprivate func configureView() {
        view.addSubview(backgroundView)
        view.addSubview(rectangle)
        view.addSubview(avatar)
        view.addSubview(userName)
        view.addSubview(occupation)
        view.addSubview(logOutButton)
    }
    
    fileprivate func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: -10),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 20),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            rectangle.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            rectangle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            rectangle.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            rectangle.heightAnchor.constraint(equalToConstant: 90),
            
            avatar.topAnchor.constraint(equalTo: rectangle.topAnchor, constant: 5),
            avatar.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 5),
            avatar.heightAnchor.constraint(equalToConstant: 80),
            avatar.widthAnchor.constraint(equalToConstant: 80),
            
            userName.topAnchor.constraint(equalTo: rectangle.topAnchor, constant: 20),
            userName.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 15),
            userName.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor,constant: -5),
            userName.heightAnchor.constraint(equalToConstant: 20),
            
            occupation.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 5),
            occupation.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 15),
            occupation.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -5),
            occupation.heightAnchor.constraint(equalToConstant: 18),
            
            settingstableView.topAnchor.constraint(equalTo: rectangle.bottomAnchor, constant: 40),
            settingstableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            settingstableView.widthAnchor.constraint(equalToConstant: 250),
            settingstableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -140),
            
            logOutButton.topAnchor.constraint(equalTo: settingstableView.bottomAnchor, constant: 20),
            logOutButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            logOutButton.heightAnchor.constraint(equalToConstant: 30),
            logOutButton.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
       // self.title = ""
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 21)
        ]
        configureView()
        configureSettingsTableView()
        setConstraints()
    }
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingstableView.dequeueReusableCell(withIdentifier: reuseidentifier, for: indexPath) as! SettingsTableViewCell
        cell.contentView.backgroundColor = .clear
        cell.cellText.text = settingsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = BasicSettingsViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {
            let vc = ChangePasswordViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 2 {
            let vc = NotificationsViewController()
            navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 3 {
          
        
        } else if indexPath.row == 4 {
            let vc = AboutApplicationViewController()
            self.present(vc, animated: true, completion: nil)
        }
    }
}
