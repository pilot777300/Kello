

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    private lazy var backView: UILabel = {
        let bv = UILabel()
         bv.translatesAutoresizingMaskIntoConstraints = false
        bv.backgroundColor = .clear//.blue
         return bv
     }()
    
    private lazy var grayLayer: UIImageView = {
       let layer = UIImageView()
        layer.translatesAutoresizingMaskIntoConstraints = false
        layer.image = UIImage(named: "Item")
        return layer
    }()

    private lazy var arrow: UIImageView = {
       let lbl = UIImageView()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.image = UIImage(named: "circle")
        return lbl
    }()
    
     lazy var cellText: UILabel = {
       let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .clear
        txt.textColor = .white
        txt.text = "Основные"
        return txt
        
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        backView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(grayLayer)
        backView.addSubview(arrow)
        backView.addSubview(cellText)
        setCellConstraints()
    }
    
    fileprivate func setCellConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            backView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            backView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            grayLayer.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            grayLayer.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            grayLayer.widthAnchor.constraint(equalToConstant: 250),
            grayLayer.heightAnchor.constraint(equalToConstant: 50),
            grayLayer.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            
            arrow.topAnchor.constraint(equalTo: grayLayer.topAnchor, constant: 10),
            arrow.bottomAnchor.constraint(equalTo: grayLayer.bottomAnchor, constant: -10),
            arrow.trailingAnchor.constraint(equalTo: grayLayer.trailingAnchor, constant: -10),
            arrow.widthAnchor.constraint(equalToConstant: 30),
            
            cellText.topAnchor.constraint(equalTo: grayLayer.topAnchor, constant: 10),
            cellText.leadingAnchor.constraint(equalTo: grayLayer.leadingAnchor, constant: 25),
            cellText.bottomAnchor.constraint(equalTo: grayLayer.bottomAnchor, constant: -10),
            cellText.trailingAnchor.constraint(equalTo: arrow.leadingAnchor, constant: -10)
        ])
    }

}
