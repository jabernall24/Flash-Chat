//
//  LogInViewController.swift
//  Flash Chat
//
//  Created by Jesus Andres Bernal Lopez on 12/20/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    
    private let emailTextField: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.placeholder = "Email"
        t.textAlignment = .center
        t.backgroundColor = .white
        t.textColor = .black
        t.layer.cornerRadius = 10
        t.clipsToBounds = true
        t.keyboardType = .emailAddress
        return t
    }()
    
    private let passwordTextField: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.placeholder = "Password"
        t.textAlignment = .center
        t.backgroundColor = .white
        t.textColor = .black
        t.layer.cornerRadius = 10
        t.clipsToBounds = true
        t.isSecureTextEntry = true
        return t
    }()
    
    private let logInButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)
        b.setTitle("Log In", for: .normal)
        b.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        b.layer.cornerRadius = 10
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(onLogIn), for: .touchUpInside)
        return b
    }()
    
    private let warningLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.isHidden = true
        l.textColor = .red
        l.backgroundColor = .white
        l.numberOfLines = 0
        l.textAlignment = .center
        l.font = UIFont.boldSystemFont(ofSize: 12)
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
        navigationItem.title = "Log In"
        setUpView()
    }
    
    @objc func onLogIn(){
//        logInButton.isEnabled = false
//        guard let email = emailTextField.text else {return}
//        guard let password = passwordTextField.text else {return}
//
//        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//            self.logInButton.isEnabled = true
//            if error == nil{
                let vc = ChatViewController()
                self.navigationController?.pushViewController(vc, animated: true)
//            }else{
//                self.warningLabel.isHidden = false
//                if let warning = error?.localizedDescription {
//                    self.warningLabel.text = warning
//                }
//            }
//        }
    }
    
    fileprivate func setUpView(){
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(logInButton)
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(warningLabel)
        warningLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -2).isActive = true
        warningLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        warningLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        warningLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
    }

    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}
