

import UIKit

class ChangePasswordViewController: UIViewController {
    
    private let headerBackground: UIImageView = {
        let pic = UIImageView()
        pic.translatesAutoresizingMaskIntoConstraints = false
        pic.backgroundColor = .systemGray6
        pic.image = UIImage(named: "Header background")
        return pic
    }()

     lazy var avatar: UIImageView = {
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
    
    private let changePasswordLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .systemGray6
        lbl.text = "Новый пароль"
        return lbl
    }()
    
    lazy var newPasswordField: UITextField = {
       let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .systemGray6
        field.placeholder = "Задайте новый пароль"
        field.layer.cornerRadius = 5
        return field
    }()
    
    private let confirmPasswordLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .systemGray6
        lbl.text = "Повторите пароль"
        return lbl
    }()
    
    lazy var confirmPasswordField: UITextField = {
       let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .systemGray6
        field.placeholder = "Повторите пароль"
        field.layer.cornerRadius = 5
        return field
    }()
    
    private lazy var saveChangesButton: GradientButton = {
       let button = GradientButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.setTitle("Сохранить", for: .normal)
        button.addTarget(self, action: #selector(saveChangesButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc fileprivate func saveChangesButtonPressed() {
        print("BUTTON Pressed")
    }
    
    fileprivate func configureView()  {
        view.addSubview(headerBackground)
        view.addSubview(avatar)
        view.addSubview(changePasswordLabel)
        view.addSubview(newPasswordField)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordField)
        view.addSubview(saveChangesButton)
    }
    
    fileprivate func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: view.topAnchor),
            headerBackground.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 150),
            
            avatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            avatar.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            changePasswordLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 45),
            changePasswordLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            changePasswordLabel.widthAnchor.constraint(equalToConstant: 200),
            changePasswordLabel.heightAnchor.constraint(equalToConstant: 20),
            
            newPasswordField.topAnchor.constraint(equalTo: changePasswordLabel.bottomAnchor, constant: 5),
            newPasswordField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            newPasswordField.widthAnchor.constraint(equalToConstant: 300),
            newPasswordField.heightAnchor.constraint(equalToConstant: 30),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: newPasswordField.bottomAnchor, constant: 20),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            confirmPasswordLabel.widthAnchor.constraint(equalToConstant: 200),
            confirmPasswordLabel.heightAnchor.constraint(equalToConstant: 20),
            
            confirmPasswordField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 5),
            confirmPasswordField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            confirmPasswordField.widthAnchor.constraint(equalToConstant: 300),
            confirmPasswordField.heightAnchor.constraint(equalToConstant: 30),
            
            saveChangesButton.topAnchor.constraint(equalTo: confirmPasswordField.bottomAnchor, constant: 20),
            saveChangesButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            saveChangesButton.widthAnchor.constraint(equalToConstant: 150),
            saveChangesButton.heightAnchor.constraint(equalToConstant: 35)
        
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        configureView()
        setConstraints()
    }
    

}
