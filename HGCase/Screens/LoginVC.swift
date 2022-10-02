//
//  LoginVC.swift
//  HGCase
//
//  Created by Burak AKCAN on 2.09.2022.
//

import UIKit

class LoginVC: UIViewController {
    
    
    
    //MARK: - Views
    
    let titleLabel         = HGTitleLabel(textAlign: .center, fontSize: 24)
    let forgetLabel        = HGBodyLabel(textAlign: .center, fontSize: 16)
    let logoImage          = UIImageView()
   
    let haveAccountLabel   = HGBodyLabel(textAlign: .center, fontSize: 16)
    let signLabel          = HGBodyLabel(textAlign: .center, fontSize: 16)
    let stackView          = UIStackView()
    
    let userNameTextField  = HGTextField(placeHolder: "Kullanıcı ismi", textAlign: .center, radius: 26)
    let passwordTextField  = HGTextField(placeHolder: "Parola", textAlign: .center, radius: 26)
    let loginButton        = HGButton(backgroundColor: Colors.loginButtonColors, title: "Giriş Yap",radius: 26)
    
    
    
    
    
    //MARK: - Properties
    
    var isUserNameEntered:Bool{
        return !(userNameTextField.text!.isEmpty)
    }
    var height:CGFloat!
    var width:CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        //View Sizes
        height             = view.frame.size.height
        width              = view.frame.size.width
        
        hideKeyboard()
        tapForgetPassword()
        configureLogo()
        configureTitleLabel()
        configureUserTextField()
        configurePasswordTextField()
        configureForgetLabel()
        configureButton()
        configureStackView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func hideKeyboard(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clikHideKeyboard))
        view.addGestureRecognizer(gesture)
    }
    
    func tapForgetPassword(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickChangePassword))
        forgetLabel.addGestureRecognizer(tapGesture)
        forgetLabel.isUserInteractionEnabled = true
        
    }
    
    func configureLogo(){
        view.addSubview(logoImage)
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.contentMode                               = .scaleAspectFit
        if let logoImageName = Images.ghLogo{
            logoImage.image  = logoImageName
        }
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: height*0.178),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: height*0.15),
            logoImage.widthAnchor.constraint(equalToConstant: width * 0.24)
       ])
    }
    func configureTitleLabel(){
        view.addSubview(titleLabel)
        titleLabel.text      = Text.titleText
        titleLabel.textColor = Colors.textColor
        titleLabel.font      = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: height*0.047),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: height*0.043),
            titleLabel.widthAnchor.constraint(equalToConstant: width*0.46)
        ])
        
    }
    
    func configureUserTextField(){
        view.addSubview(userNameTextField)
                                         
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.keyboardType                              = .emailAddress
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: height*0.038),
            userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameTextField.widthAnchor.constraint(equalToConstant: width*0.77),
            userNameTextField.heightAnchor.constraint(equalToConstant: height*0.07)
        ])
        
    }
    
    func configurePasswordTextField(){
        view.addSubview(passwordTextField)
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate                                  = self
        passwordTextField.keyboardType                              = .default
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: height*0.024),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: width*0.77),
            passwordTextField.heightAnchor.constraint(equalToConstant: height*0.07)
        ])
    }
    
    func configureForgetLabel(){
        view.addSubview(forgetLabel)
        
        
        forgetLabel.text                                      = Text.forgetText
        forgetLabel.textColor                                 = Colors.textColor
        forgetLabel.translatesAutoresizingMaskIntoConstraints = false
       
        
        
        NSLayoutConstraint.activate([
            forgetLabel.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            forgetLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: height*0.038),
            forgetLabel.heightAnchor.constraint(equalToConstant: height*0.02),
            forgetLabel.widthAnchor.constraint(equalToConstant: width*0.265)
        ])
        
    }
    
    func configureButton(){
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.addTarget(self, action: #selector(pushHomeVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgetLabel.bottomAnchor, constant: height*0.07),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: width*0.6),
            loginButton.heightAnchor.constraint(equalToConstant: height*0.07)
        ])
    }
    
    
    func configureStackView(){
        view.addSubview(stackView)
        
        stackView.axis             = .horizontal
        stackView.distribution     = .equalSpacing
        haveAccountLabel.textColor = Colors.textColor
        signLabel.textColor        = Colors.loginButtonColors
        haveAccountLabel.text      = Text.haveAcoount
        signLabel.text             = Text.signText
        
       
        
        stackView.addArrangedSubview(haveAccountLabel)
        stackView.addArrangedSubview(signLabel)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: height*0.028),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: height*0.02),
            stackView.widthAnchor.constraint(equalToConstant: width*0.4)
        ])
    }
    
}

extension LoginVC:UITextFieldDelegate{
    
    @objc func pushHomeVC(){
        passwordTextField.resignFirstResponder()
        validateEmailPassword()
    }

    
    @objc func clikHideKeyboard(){
        view.endEditing(true)
    }
    
    @objc func clickChangePassword(){
        print("test forgetPassword Clicked")
        let userVC = UserVC()
        navigationController?.pushViewController(userVC, animated: true)
       }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushHomeVC()
        return true
    }

   func validateEmailPassword(){
       let tabbar = HGTabbarController()
       guard  !(userNameTextField.text!.isEmpty),
               !(passwordTextField.text!.isEmpty)
       else{
           presentHGAlertOnMainThread(title: "Hata", message: "Lütfen tüm alanları doldurunuz.", buttonTitle: "Tamam")
           return
       
       }
       
       if userNameTextField.text!.isValidEmail && passwordTextField.text!.isPasswordValid{
           navigationController?.pushViewController(tabbar, animated: true)
       }else{
           presentHGAlertOnMainThread(title: "Hata", message: "Hatalı e mail veya hatalı parola girdiniz.", buttonTitle: "Tamam")
       }
   }
}
