

import UIKit

class AboutApplicationViewController: UIViewController {

    
    private let textAboutApplication: UILabel = {
       let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.text = " Информация в ближайшее время будет добавлена sdbdfdvevebfaedavtjelemgmtlakcfntotuhaslxmkacnjbnrkssvfjsncfjdkznfjomekeutjvncjdjzkfhcbxnzkjfghvncjsd"
        txt.backgroundColor = .systemGray5
        txt.numberOfLines = 0
        txt.textAlignment = .left
        txt.clipsToBounds = true
        txt.layer.cornerRadius = 20
        return txt
    }()
    
    private let exitLabel: UIImageView = {
       let cross = UIImageView()
        cross.translatesAutoresizingMaskIntoConstraints = false
        cross.backgroundColor = .white
        cross.image = UIImage(named: "cross")
        cross.isUserInteractionEnabled = true
        return cross
    }()
    
    @objc fileprivate func exitButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            exitLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 100),
            exitLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            exitLabel.widthAnchor.constraint(equalToConstant: 25),
            exitLabel.heightAnchor.constraint(equalToConstant: 25),
            
            textAboutApplication.topAnchor.constraint(equalTo: exitLabel.bottomAnchor, constant: 30),
            textAboutApplication.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            textAboutApplication.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
            textAboutApplication.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
         let recognizer = UITapGestureRecognizer(target: self, action: #selector(exitButtonTapped))
        exitLabel.addGestureRecognizer(recognizer)
        view.addSubview(textAboutApplication)
        view.addSubview(exitLabel)
        setConstraints()
    }
}
