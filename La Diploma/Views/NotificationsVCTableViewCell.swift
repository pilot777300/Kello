

import UIKit

class NotificationsVCTableViewCell: UITableViewCell {

    let backView: UILabel = {
        let bv = UILabel()
         bv.translatesAutoresizingMaskIntoConstraints = false
        bv.backgroundColor = .systemGray6
         return bv
     }()

    lazy var nameOfSetting: UILabel = {
       let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.systemFont(ofSize: 14)
        author.backgroundColor = .systemGray6
        author.text = ""
        return author
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
        backView.addSubview(nameOfSetting)
        setConstraints()
    }
    
    fileprivate func setConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            backView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            nameOfSetting.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            nameOfSetting.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            nameOfSetting.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            nameOfSetting.heightAnchor.constraint(equalToConstant: 30),
            nameOfSetting.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
