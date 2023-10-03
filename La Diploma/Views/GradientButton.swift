

import Foundation
import UIKit


class GradientButton: UIButton {
   var startColor: UIColor = UIColor(red: 0.318, green: 0.318, blue: 0.776, alpha: 1)
     var endColor: UIColor = UIColor(red: 0.533, green: 0.545, blue: 0.957, alpha: 1)
    var cornerRadius = CGFloat(25.0)

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.25, y: 0.5)
        (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.75, y: 0.5)
        (layer as! CAGradientLayer).locations = [0,1]
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
        layer.cornerRadius = cornerRadius
    }
}
