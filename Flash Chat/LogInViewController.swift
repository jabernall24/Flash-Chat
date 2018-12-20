//
//  LogInViewController.swift
//  Flash Chat
//
//  Created by Jesus Andres Bernal Lopez on 12/20/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let usernameTextField: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.placeholder = "Username"
        t.textAlignment = .center
        t.backgroundColor = .white
        t.textColor = .black
        t.layer.cornerRadius = 10
        t.clipsToBounds = true
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
    
    @objc func onLogIn(){
        let vc = ChatViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(patternImage: UIImage(named: "background1")!)
        navigationItem.title = "Log In"
        setUpView()
    }
    
    fileprivate func setUpView(){
        view.addSubview(usernameTextField)
        usernameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        usernameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        usernameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(logInButton)
        logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
