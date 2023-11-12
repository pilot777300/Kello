

import UIKit

class FollowersCollectionView: UICollectionViewCell {
   
    lazy var backView: UILabel = {
        let bv = UILabel()
        bv.translatesAutoresizingMaskIntoConstraints = false
        bv.contentMode = .scaleToFill
        bv.layer.cornerRadius = 12
        bv.backgroundColor = .systemGray6//.white
      return bv
    }()
    
    
    lazy var image: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.backgroundColor = .clear
        img.layer.cornerRadius = 40
       return img
   }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(backView)
        backView.addSubview(image)
    }
    
    func setupConstraints() {
       
        NSLayoutConstraint.activate([
          
            backView.leadingAnchor.constraint(equalTo: leadingAnchor),
           backView.topAnchor.constraint(equalTo: topAnchor),
            backView.trailingAnchor.constraint(equalTo: trailingAnchor),
           backView.heightAnchor.constraint(equalTo: heightAnchor),
           backView.widthAnchor.constraint(equalTo: widthAnchor),
           
           image.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
           image.topAnchor.constraint(equalTo: backView.topAnchor),
           image.heightAnchor.constraint(equalToConstant: 80),
           image.widthAnchor.constraint(equalToConstant: 80)
        
        ])
    }
}
