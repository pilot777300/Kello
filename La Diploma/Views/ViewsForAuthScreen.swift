

import Foundation
import UIKit


 var backView: UIImageView = {
    let backView = UIImageView()
     backView.translatesAutoresizingMaskIntoConstraints = false
     backView.image = UIImage(named: "Dark background")
     return backView
 }()
 
 var enterState: UILabel = {
   let state = UILabel()
     state.translatesAutoresizingMaskIntoConstraints = false
     state.font = UIFont.boldSystemFont(ofSize: 24)
     state.text = "Регистрация"
     state.textAlignment = .center
     state.textColor = .white
     return state
 }()

var noticeText: UILabel = {
  let state = UILabel()
    state.translatesAutoresizingMaskIntoConstraints = false
    state.font = UIFont.boldSystemFont(ofSize: 12)
    state.text = "Для регистрации введите e-mail и пароль"
    state.textAlignment = .center
    state.textColor = .white
    return state
}()
 
 var emailTxtfield: UITextField = {
   let emailTxtField = UITextField()
     emailTxtField.translatesAutoresizingMaskIntoConstraints = false
     emailTxtField.backgroundColor = .systemGray4
     emailTxtField.layer.borderColor = UIColor.white.cgColor
     emailTxtField.layer.cornerRadius = 17
     emailTxtField.placeholder = "Введите e-mail"
     emailTxtField.keyboardType = UIKeyboardType.default
     emailTxtField.clearButtonMode = UITextField.ViewMode.whileEditing
     emailTxtField.returnKeyType = UIReturnKeyType.done
     emailTxtField.resignFirstResponder()
     return emailTxtField
 }()
 
 var passTxtfield: CustomTextField = {
   let passTxtfield = CustomTextField()
     passTxtfield.translatesAutoresizingMaskIntoConstraints = false
     passTxtfield.backgroundColor = .systemGray4
     passTxtfield.layer.cornerRadius = 17
     passTxtfield.placeholder = "Введите пароль"
     passTxtfield.rightViewMode = UITextField.ViewMode.always
     passTxtfield.isSecureTextEntry = true
//     passTxtfield.createLeftView(withImage: UIImage(systemName: "eye.slash")!, imageOnLeftSide: false, actionOnImageTapped: #selector(togglePassVisible))
       
     return passTxtfield
 }()
 
 var signInButton: GradientButton = {
    let signInButton = GradientButton()
     signInButton.translatesAutoresizingMaskIntoConstraints = false
    signInButton.backgroundColor = .blue
     signInButton.clipsToBounds = true
     signInButton.layer.masksToBounds = true
     signInButton.setTitle("Зарегистрироваться", for: .normal)
     return signInButton
 }()



