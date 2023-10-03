
import UIKit

class CreateNewPostViewController: UIViewController {
    
 
    
    private lazy var publishPostButton: UIButton = {
        let button = UIButton(type: .custom)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = UIColor(named: "BlueCustomColor")
          button.layer.cornerRadius = 5
        button.setTitle("Опубликовать", for: .normal)
        button.addTarget(self, action: #selector(publishPostBtnTapped), for: .touchUpInside)
         return button
     }()
    
    
    @objc fileprivate func publishPostBtnTapped() {
        print("POST IS PUBLISHED")
    }
    
    @objc fileprivate func imageTapped() {
        print("IMAGE TAPPED")
    }
    
    fileprivate func configureView() {
        let recognizer = UITapGestureRecognizer( target:self, action: #selector(imageTapped))
        pictureForNewPost.addGestureRecognizer(recognizer)
        textForNewPost.delegate = self
        view.addSubview(newPostAuthorAvatar)
        view.addSubview(newPostAuthor)
        view.addSubview(pictureForNewPost)
        view.addSubview(textForNewPost)
        view.addSubview(newPostAuthorLocation)
        view.addSubview(publishPostButton)
        
    }
    
    fileprivate func setConstraints() {
        let safearea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        
            newPostAuthorAvatar.topAnchor.constraint(equalTo: safearea.topAnchor, constant: 10),
            newPostAuthorAvatar.leadingAnchor.constraint(equalTo: safearea.leadingAnchor, constant: 20),
            newPostAuthorAvatar.heightAnchor.constraint(equalToConstant: 60),
            newPostAuthorAvatar.widthAnchor.constraint(equalToConstant: 60),
            
            newPostAuthor.topAnchor.constraint(equalTo: safearea.topAnchor, constant: 15),
            newPostAuthor.leadingAnchor.constraint(equalTo: newPostAuthorAvatar.trailingAnchor, constant: 20),
            newPostAuthor.trailingAnchor.constraint(equalTo: safearea.trailingAnchor, constant: -10),
            newPostAuthor.heightAnchor.constraint(equalToConstant: 20),
            
            pictureForNewPost.topAnchor.constraint(equalTo: newPostAuthorAvatar.bottomAnchor, constant: 30),
            pictureForNewPost.leadingAnchor.constraint(equalTo: safearea.leadingAnchor, constant: 3),
            pictureForNewPost.trailingAnchor.constraint(equalTo: safearea.trailingAnchor, constant: -3),
            pictureForNewPost.heightAnchor.constraint(equalToConstant: 220),
            
            textForNewPost.topAnchor.constraint(equalTo: pictureForNewPost.bottomAnchor, constant: 2),
            textForNewPost.leadingAnchor.constraint(equalTo: safearea.leadingAnchor, constant: 3),
            textForNewPost.trailingAnchor.constraint(equalTo: safearea.trailingAnchor, constant: -3),
            textForNewPost.bottomAnchor.constraint(equalTo: safearea.bottomAnchor, constant: -130),
            
            placeholder.topAnchor.constraint(equalTo: textForNewPost.topAnchor, constant: 10),
            placeholder.leadingAnchor.constraint(equalTo: textForNewPost.leadingAnchor, constant: 10),
            
            
            newPostAuthorLocation.topAnchor.constraint(equalTo: newPostAuthor.bottomAnchor, constant: 3),
            newPostAuthorLocation.leadingAnchor.constraint(equalTo: newPostAuthorAvatar.trailingAnchor, constant: 20),
            newPostAuthorLocation.trailingAnchor.constraint(equalTo: safearea.trailingAnchor, constant: -10),
            newPostAuthorLocation.heightAnchor.constraint(equalToConstant: 20),
            
            publishPostButton.topAnchor.constraint(equalTo: textForNewPost.bottomAnchor, constant: 15),
            publishPostButton.centerXAnchor.constraint(equalTo: safearea.centerXAnchor),
            publishPostButton.widthAnchor.constraint(equalToConstant: 150),
            publishPostButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        self.title = "Новый пост"
        configureView()
        setConstraints()

    }
    
}
extension CreateNewPostViewController : UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholder.isHidden = !textForNewPost.text.isEmpty
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        placeholder.isHidden = !textForNewPost.text.isEmpty
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholder.isHidden = true
    }
}
