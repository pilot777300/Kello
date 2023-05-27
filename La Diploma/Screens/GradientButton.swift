

import Foundation
import UIKit


class GradientButton: UIButton {
   var startColor: UIColor = UIColor(red: 0.318, green: 0.318, blue: 0.776, alpha: 1)//UIColor(red: 0.533, green: 0.545, blue: 0.957, alpha: 1)
     var endColor: UIColor = UIColor(red: 0.533, green: 0.545, blue: 0.957, alpha: 1)//UIColor(red: 0.318, green: 0.318, blue: 0.776, alpha: 1)
    var cornerRadius = CGFloat(25.0)

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        //This is an advanced gradient we do not use for now
        (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.25, y: 0.5)
        (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.75, y: 0.5)
        (layer as! CAGradientLayer).locations = [0,1]
       // (layer as! CAGradientLayer).transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -1, b: -1, c: 1, d: -60.36, tx: 0.5, ty: 31.18))
        // Simple gradient
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
        layer.cornerRadius = cornerRadius
    }
}
