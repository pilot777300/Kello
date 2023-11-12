

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    private lazy var backView: UILabel = {
       let bv = UILabel()
        bv.translatesAutoresizingMaskIntoConstraints = false
        bv.backgroundColor = .systemGray6//.white
        bv.clipsToBounds = true
        bv.layer.cornerRadius = 10
        return bv
    }()
    
    lazy var newsImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .systemGray6//.white
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        return img
    }()
    
    lazy var titleOfNews: UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 16)
        title.numberOfLines = 0
       // title.textColor = //.black
       
        return title
    }()
    
    lazy var date: UILabel = {
       let date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
//date.backgroundColor = .blue
        date.textAlignment = .left
        date.font = UIFont.systemFont(ofSize: 10)
        return date
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(newsImage)
        backView.addSubview(titleOfNews)
        backView.addSubview(date)
        setCellConstraints()
    }
    
    override func  prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
    }
    
    fileprivate func setCellConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 4),
            backView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -4),
            backView.topAnchor.constraint(equalTo: safeArea.topAnchor),
           // backView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            backView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -4),
            
            newsImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 3),
            newsImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 3),
            newsImage.widthAnchor.constraint(equalToConstant: 120),
            newsImage.heightAnchor.constraint(equalToConstant: 100),
            newsImage.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -3),
            
            titleOfNews.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            titleOfNews.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 5),
            titleOfNews.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -3),
            titleOfNews.heightAnchor.constraint(equalToConstant: 80),
            
            date.topAnchor.constraint(equalTo: titleOfNews.bottomAnchor, constant: 2),
            date.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -5),
            date.widthAnchor.constraint(equalToConstant: 200),
            date.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
//extension UIImageView {
//    func downloadImage(from url: URL) {
//        let dataTask = URLSession.shared.dataTask(with: url) {
//            (data, response, error) in
//            guard let httpUrlResponse = response as? HTTPURLResponse,
//                  httpUrlResponse.statusCode == 200,
//                  let mimeType = response?.mimeType,
//                  mimeType.hasPrefix("image"),
//                  let data = data,
//                  error == nil,
//                  let image = UIImage(data: data)
//                else {
//                      return
//                  }
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//        dataTask.resume()
//    }
//}
