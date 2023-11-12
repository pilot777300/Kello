
import UIKit

class NotificationsViewController: UIViewController {
    
    let settings = ["Разрешить отправлять уведомления", "Показывать геолокацию в профиле"]
    
    private let headerBackground: UIImageView = {
        let pic = UIImageView()
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.backgroundColor = .systemGray6
        pic.image = UIImage(named: "Header background")
        return pic
    }()

     lazy var avatarForNotificationsController: UIImageView = {
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.backgroundColor = .systemGray6
        avatar.image = UIImage(named: "Avatar80")
        avatar.layer.cornerRadius = 50
        avatar.layer.borderWidth = 5
        avatar.layer.masksToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        return avatar
    }()
    
    private let tableViewForNotificationsController = UITableView()
    private let reuseIdentifier = "Cell"
    
    fileprivate func configureTableVew() {
        tableViewForNotificationsController.delegate = self
        tableViewForNotificationsController.dataSource = self
        tableViewForNotificationsController.translatesAutoresizingMaskIntoConstraints = false
        tableViewForNotificationsController.allowsSelection = true
        tableViewForNotificationsController.separatorColor = .black
        tableViewForNotificationsController.backgroundColor = .systemGray6
        tableViewForNotificationsController.isScrollEnabled = false
        tableViewForNotificationsController.register(NotificationsVCTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableViewForNotificationsController)
    }
    
    fileprivate func configureView() {
        view.addSubview(headerBackground)
        view.addSubview(avatarForNotificationsController)
       
    }
    
   @objc func switchChanged(_ sender : UISwitch!){
          print("table row switch Changed \(sender.tag)")
          print("The switch is \(sender.isOn ? "ON" : "OFF")")
    }
    
    fileprivate func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: view.topAnchor),
            headerBackground.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 150),
            
            avatarForNotificationsController.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            avatarForNotificationsController.widthAnchor.constraint(equalToConstant: 100),
            avatarForNotificationsController.heightAnchor.constraint(equalToConstant: 100),
            avatarForNotificationsController.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            tableViewForNotificationsController.topAnchor.constraint(equalTo: avatarForNotificationsController.bottomAnchor, constant: 50),
            tableViewForNotificationsController.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            tableViewForNotificationsController.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -40)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        configureView()
        configureTableVew()
        setConstraints()
        }
    }

extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewForNotificationsController.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationsVCTableViewCell
        let switchView = UISwitch(frame: .zero)
            cell.nameOfSetting.text = settings[indexPath.row]
            switchView.setOn(false, animated: true)
            switchView.onTintColor = UIColor(named: "BlueCustomColor")
            switchView.tag = indexPath.row
            switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        cell.accessoryView = switchView
        return cell
    }
    
    
}
