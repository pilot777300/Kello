
import Foundation
import UIKit


class CustomTextField: UITextField {
   
    var padding = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    func createLeftView(withImage image: UIImage, imageOnLeftSide: Bool, actionOnImageTapped action: Selector?) {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)

        switch imageOnLeftSide {
        case true:
            leftView = button
            leftViewMode = .always
        case false:
            rightView = button
            rightViewMode = .always
        }
        button.sizeToFit()

        if let action = action {
            button.addTarget(self.delegate, action: action, for: .touchUpInside)
        } else {
            
            button.isUserInteractionEnabled = false
        }
    }
}
