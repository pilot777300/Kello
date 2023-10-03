
import UIKit

class NewsViewController: UIViewController {

    private lazy var newsTableView = UITableView()
    private let reuseIdentifier = "Cell"
    private let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 19)]
    private lazy var activityIndicatorView: UIActivityIndicatorView = {
         let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        activityIndicatorView.hidesWhenStopped = true
        var center = self.view.center
        if let navigationBarFrame = self.navigationController?.navigationBar.frame {
            center.y -= (navigationBarFrame.origin.y + navigationBarFrame.size.height)
        }
        activityIndicatorView.center = center
        self.view.addSubview(activityIndicatorView)
        return activityIndicatorView
    }()
   
    var newsList = [Results]()
    
    fileprivate func configureNewsTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.allowsSelection = true
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        newsTableView.backgroundColor = .systemGray5
        view.addSubview(newsTableView)
    }
    
    fileprivate func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -5),
            newsTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    func fetchNewsData() {
        guard let url = URL(string: "https://newsdata.io/api/1/news?country=ru&apikey=pub_265722b7bb33f141948a5b128247efe8402d2") else {
            print("ERROR OCCURED DURING URL ADRESS")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data
            else {
              print("Error occured during access data")
                return
            }
            var newsData: News?
            do {
                newsData = try JSONDecoder().decode(News.self, from: data)
            } catch {
               print("Error during decode Data")
            }
            self.newsList = newsData!.results
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
                self.activityIndicatorView.stopAnimating()
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = attributes
        view.backgroundColor = .white
        self.title = "Новости"
        configureNewsTableView()
        setupConstraints()
        activityIndicatorView.startAnimating()
        fetchNewsData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.newsTableView.reloadData()
    }
}

extension UIImageView {
    
    func downloadImage(url: URL) {
        contentMode = .scaleAspectFit
        let dataTask = URLSession.shared.dataTask(with: url) {
            (data,response,error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
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

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NewsTableViewCell
        
        let list = newsList[indexPath.row]
        cell.titleOfNews.text = list.title
        cell.date.text = "Опубликовано: \(list.pubDate)"
        if list.image_url != nil {
            let url = list.image_url!
            cell.newsImage.downloadImage(url: url)
            cell.newsImage.contentMode = .scaleToFill
        } else {
            cell.newsImage.image = UIImage(named: "no photo")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = NewsContentPage()
        vc.newsContent = newsList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
