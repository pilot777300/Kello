
import UIKit

class BasicSettingsViewController: UIViewController {
    
   lazy var tempAvatar: UIImageView = UIImageView(image: UIImage(named: "no photo"))

   private let headerBackground: UIImageView = {
       let pic = UIImageView()
       pic.translatesAutoresizingMaskIntoConstraints = false
       pic.backgroundColor = .white
       pic.image = UIImage(named: "Header background")
       return pic
   }()

    lazy var avatarPicture: UIImageView = {
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
    
    private let cameraButton: UIImageView = {
        let camera = UIImageView()
        camera.translatesAutoresizingMaskIntoConstraints = false
        camera.image = UIImage(named: "camera")
        camera.isUserInteractionEnabled = true
        return camera
    }()
    
    private let nameLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .white
        lbl.text = "Имя"
        return lbl
    }()
    
    lazy var nameField: UITextField = {
       let namefield = UITextField()
        namefield.translatesAutoresizingMaskIntoConstraints = false
        namefield.backgroundColor = .systemGray5
        namefield.placeholder = "\(userName.text ?? "Имя")"
        namefield.layer.cornerRadius = 5
        return namefield
    }()
    
    private let surnameLabel: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.backgroundColor = .white
        lbl.text = "Фамилия"
        return lbl
    }()
    
    lazy var surnameField: UITextField = {
       let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .systemGray5
        field.placeholder = "Фамилия"
        field.layer.cornerRadius = 5
        return field
    }()
    
    private let occupationLabel: UILabel = {
       let prof = UILabel()
        prof.translatesAutoresizingMaskIntoConstraints = false
        prof.backgroundColor = .white
        prof.text = "О себе"
        return prof
    }()
    
    lazy var occupationField: UITextField = {
       let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .systemGray5
        field.layer.cornerRadius = 5
        field.placeholder = "\(occupation.text ?? "Профессия")"
        return field
    }()
    
    private lazy var saveChangesButton: GradientButton = {
       let btn = GradientButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .blue
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        btn.setTitle("Cохранить", for: .normal)
        btn.addTarget(self, action: #selector(saveChangesBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    @objc fileprivate func saveChangesBtnTapped() {
     
        avatar.image = self.avatarPicture.image
        userName.text = nameField.text! + " " + surnameField.text!
        occupation.text = occupationField.text!
        dismiss(animated: true, completion: nil)
        print("SAVED")
    }
    
    @objc fileprivate func addPhotoButtonTapped() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        print("ADD NEW Photo")
        
    }
    
    fileprivate func configureView() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(addPhotoButtonTapped))
        cameraButton.addGestureRecognizer(recognizer)
        view.addSubview(headerBackground)
        view.addSubview(avatarPicture)
        view.addSubview(cameraButton)
        view.addSubview(nameLabel)
        view.addSubview(nameField)
        view.addSubview(surnameLabel)
        view.addSubview(surnameField)
        view.addSubview(occupationLabel)
        view.addSubview(occupationField)
        view.addSubview(saveChangesButton)
    }
    
    fileprivate func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            headerBackground.topAnchor.constraint(equalTo: view.topAnchor),
            headerBackground.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            headerBackground.heightAnchor.constraint(equalToConstant: 150),
            
            avatarPicture.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            avatarPicture.widthAnchor.constraint(equalToConstant: 100),
            avatarPicture.heightAnchor.constraint(equalToConstant: 100),
            avatarPicture.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            cameraButton.topAnchor.constraint(equalTo: avatarPicture.bottomAnchor, constant: -30),
            cameraButton.leadingAnchor.constraint(equalTo: avatarPicture.trailingAnchor, constant: -30),
            cameraButton.widthAnchor.constraint(equalToConstant: 30),
            cameraButton.heightAnchor.constraint(equalToConstant: 30),
            
            nameLabel.topAnchor.constraint(equalTo: avatarPicture.bottomAnchor, constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            nameField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            nameField.widthAnchor.constraint(equalToConstant: 300),
            nameField.heightAnchor.constraint(equalToConstant: 30),
            
            surnameLabel.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
            surnameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            surnameLabel.widthAnchor.constraint(equalToConstant: 100),
            surnameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            surnameField.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 5),
            surnameField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            surnameField.widthAnchor.constraint(equalToConstant: 300),
            surnameField.heightAnchor.constraint(equalToConstant: 30),
            
            occupationLabel.topAnchor.constraint(equalTo: surnameField.bottomAnchor, constant: 10),
            occupationLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            occupationLabel.widthAnchor.constraint(equalToConstant: 100),
            occupationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            occupationField.topAnchor.constraint(equalTo: occupationLabel.bottomAnchor, constant: 5),
            occupationField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            occupationField.widthAnchor.constraint(equalToConstant: 300),
            occupationField.heightAnchor.constraint(equalToConstant: 30),
            
            saveChangesButton.topAnchor.constraint(equalTo: occupationField.bottomAnchor, constant: 20),
            saveChangesButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            saveChangesButton.widthAnchor.constraint(equalToConstant: 120),
            saveChangesButton.heightAnchor.constraint(equalToConstant: 35)
        
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
          self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        configureView()
        setConstraints()
       
    }
}

extension BasicSettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            tempAvatar.image = pickedImage
            DispatchQueue.main.async {
                self.avatarPicture.image = pickedImage
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
}
