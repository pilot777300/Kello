

import UIKit

class FirstViewController: UIViewController {

    private let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19)]
   // private let networkService: NetworkServiceProtocol
    //let netWork = LoadingNews()
    
    let textView: UITextView = {
       let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.text = "TEXT"
        tv.textAlignment = .left
        return tv
    }()
    
    
    var imageOfNews: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .white
        return img
    }()
    
    
//    init(networkService: NetworkServiceProtocol) {
//        self.networkService = networkService
//        super.init(nibName: nil, bundle: nil)
//    }
//    @available(*, unavailable)
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    private func configureView() {
        view.addSubview(textView)
        view.addSubview(imageOfNews)
    }
    
    private func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            imageOfNews.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            imageOfNews.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            imageOfNews.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            imageOfNews.heightAnchor.constraint(equalToConstant: 150),
            
            textView.topAnchor.constraint(equalTo: imageOfNews.bottomAnchor, constant: 20),
            textView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50)
        
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        view.backgroundColor = .blue
        self.title = "Новости"
        configureView()
        setConstraints()
//        netWork.fetchData(completion: { [unowned self] textOfNews, urlImg in
//            self.textView.text = textOfNews
//            if urlImg != nil {
//            self.imageOfNews.downLoadImage(from: urlImg!)
//            } else {
//                self.imageOfNews.image = UIImage(systemName: "person")
//            }
//        })
    }
}
extension UIImageView {
    func downLoadImage(from url: URL) {
        let dataTask = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let httpUrlResponse = response as? HTTPURLResponse,
                  httpUrlResponse.statusCode == 200,
                  let mimeType = response?.mimeType,
                  mimeType.hasPrefix("image"),
                  let data = data,
                  error == nil,
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
