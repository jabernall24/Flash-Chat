//
//  HomeViewController.swift
//  Flash Chat
//
//  Created by Jesus Andres Bernal Lopez on 12/20/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let registerButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = #colorLiteral(red: 0.2459787813, green: 0.6163469745, blue: 0.4070781464, alpha: 1)
        b.setTitle("Register", for: .normal)
        b.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        b.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        return b
    }()
    
    @objc func onRegister(){
        let vc = RegisterViewController()
        self.show(vc, sender: self)
    }
    
    private let logInButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.backgroundColor = #colorLiteral(red: 0.2920248282, green: 0.5271896844, blue: 0.6163469745, alpha: 1)
        b.setTitle("Log In", for: .normal)
        b.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        b.addTarget(self, action: #selector(onLogIn), for: .touchUpInside)
        return b
    }()
    
    @objc func onLogIn(){
        let vc = LogInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        navigationItem.title = "Welcome"
        setUpView()
    }
    
    fileprivate func setUpView(){
        view.addSubview(logInButton)
        logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        logInButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        view.addSubview(registerButton)
        registerButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
