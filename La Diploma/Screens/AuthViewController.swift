

import UIKit

class AuthViewController: UIViewController, UITextViewDelegate {

    
    private func configureView() {
        view.addSubview(backView)
        view.addSubview(enterState)
        view.addSubview(noticeText)
        view.addSubview(emailTxtfield)
        view.addSubview(passTxtfield)
        view.addSubview(signInButton)
    
    }
    
    @objc func togglePassVisible(_ sender: UIButton) {
        passTxtfield.isSecureTextEntry.toggle()
        if passTxtfield.isSecureTextEntry == true {
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            passTxtfield.reloadInputViews()
        } else {
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
            passTxtfield.reloadInputViews()
        }
    }
    
    private func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
                                    
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            enterState.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            enterState.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            enterState.heightAnchor.constraint(equalToConstant: 35),
            enterState.widthAnchor.constraint(equalToConstant: 150),

            noticeText.bottomAnchor.constraint(equalTo: emailTxtfield.topAnchor, constant: -10),
            noticeText.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            noticeText.heightAnchor.constraint(equalToConstant: 15),
            noticeText.widthAnchor.constraint(equalToConstant: 315),
            
            
            emailTxtfield.topAnchor.constraint(equalTo: enterState.bottomAnchor, constant: 60),
            emailTxtfield.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            emailTxtfield.heightAnchor.constraint(equalToConstant: 35),
            emailTxtfield.widthAnchor.constraint(equalToConstant: 315),

            passTxtfield.topAnchor.constraint(equalTo: emailTxtfield.bottomAnchor, constant: 25),
            passTxtfield.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            passTxtfield.heightAnchor.constraint(equalToConstant: 35),
            passTxtfield.widthAnchor.constraint(equalToConstant: 315),
            
            signInButton.topAnchor.constraint(equalTo: passTxtfield.bottomAnchor, constant: 40),
            signInButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.widthAnchor.constraint(equalToConstant: 315)
            
            
            
            ])
        }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
        passTxtfield.createLeftView(withImage: UIImage(systemName: "eye.slash")!, imageOnLeftSide: false, actionOnImageTapped: #selector(togglePassVisible))
    }
}
