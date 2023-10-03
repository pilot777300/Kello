

import UIKit

class NewsContentPage: UIViewController {
    
    lazy var titleOfNews: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = .white
        title.numberOfLines = 0
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textAlignment = .center
        return title
    }()
    
    lazy var newsImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.layer.cornerRadius = 9
        image.clipsToBounds = true
        return image
    }()
    
    lazy var newsText: UITextView = {
       let news = UITextView()
        news.translatesAutoresizingMaskIntoConstraints = false
        news.backgroundColor = .white
        news.textAlignment = .justified
        news.font = UIFont.systemFont(ofSize: 14)
        return news
    }()
    
   lazy var newsContent: Results = Results(title: "", content: "", pubDate: "", image_url: nil)//Results(title: "", creator: "", content: "", image_url: nil)
    //Results(title: "", content: "", image_url: nil)
    
    fileprivate func configureView() {
        view.addSubview(titleOfNews)
        view.addSubview(newsImage)
        view.addSubview(newsText)
    }
    
    fileprivate func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleOfNews.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -5),
            titleOfNews.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            titleOfNews.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
            titleOfNews.heightAnchor.constraint(equalToConstant: 60),
            
            newsImage.topAnchor.constraint(equalTo: titleOfNews.bottomAnchor, constant: 5),
            newsImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            newsImage.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
            newsImage.heightAnchor.constraint(equalToConstant: 200),
            
            newsText.topAnchor.constraint(equalTo: newsImage.bottomAnchor, constant: 5),
            newsText.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5),
            newsText.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5),
            newsText.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -5)
        
        ])
        
      
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        setupConstraints()
        titleOfNews.text = newsContent.title
        if newsContent.image_url != nil {
            let url = newsContent.image_url
            newsImage.downloadImage(url: url!)
            newsImage.contentMode = .scaleToFill
        }
        else {
            newsImage.image = UIImage(named: "no photo")
        }
        newsText.text = newsContent.content
    }
}
