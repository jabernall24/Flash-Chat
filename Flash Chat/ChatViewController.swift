//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Jesus Andres Bernal Lopez on 12/20/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    lazy private var logOutButton: UIBarButtonItem = {
        let b = UIBarButtonItem()
        b.title = "Log Out"
        b.target = self
        b.action = #selector(onLogOut)
        return b
    }()
    
    @objc func onLogOut(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setRightBarButton(logOutButton, animated: true)
        view.backgroundColor = .white
        navigationItem.title = "Flash Chat"
    }

}
