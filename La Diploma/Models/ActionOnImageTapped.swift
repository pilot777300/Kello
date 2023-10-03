

import Foundation
import UIKit

class ActionOnImageTapped: UIImageView {
    
    func actionOnImageTapped (actionOnImageTapped action: Selector?) {
        let button = UIButton(type: .custom)
       // button.setImage(image, for: .normal)
       // button.sizeToFit()
        if let action = action {
            print(" ALLOWED ONE")
            button.addTarget( self , action: action, for: .touchUpInside)
        } else {
            print("NOT ALLOWED")
            button.isUserInteractionEnabled = false
        }
    }
}
