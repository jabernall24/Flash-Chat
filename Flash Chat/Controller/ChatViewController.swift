//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Jesus Andres Bernal Lopez on 12/20/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import ProgressHUD

class ChatViewController: UIViewController, UITextFieldDelegate {
    
    private let cellID = "MessageCell"
    private var containerDown: NSLayoutConstraint!
    private var containerUp: NSLayoutConstraint!
    private var containerUpNoAutoCorrect: NSLayoutConstraint!
    var messageArray: [Message] = []
    let messageDB = Database.database().reference().child("Messages")
    
    private lazy var tableView: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(MessageCell.self, forCellReuseIdentifier: cellID)
        return t
    }()

    lazy private var logOutButton: UIBarButtonItem = {
        let b = UIBarButtonItem()
        b.title = "Log Out"
        b.target = self
        b.action = #selector(onLogOut)
        return b
    }()
    
    private let sendButton: UIButton = {
        let b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.isEnabled = false
        b.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        b.setTitle("Send", for: .normal)
        b.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        b.layer.cornerRadius = 10
        b.clipsToBounds = true
        b.addTarget(self, action: #selector(onSend), for: .touchUpInside)
        return b
    }()
    
    private let messageTextField: UITextField = {
        let t = UITextField()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        t.textColor = .black
        t.placeholder = "Enter yoour message"
        t.textAlignment = .center
        t.layer.cornerRadius = 10
        return t
    }()
    
    private let containerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .gray
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.setRightBarButton(logOutButton, animated: true)
        navigationItem.title = "Flash Chat"
        
        tableView.separatorInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        tableView.separatorStyle = .none
        
        messageTextField.delegate = self
        
        setUp()
        retrieveMessages()
    }
    
    @objc func onSend(){
        ProgressHUD.show()
        if messageTextField.text == ""{
            return
        }
        messageTextField.isEnabled = false
        sendButton.isEnabled = false
        
        let messageDictionary = [
            "User" : Auth.auth().currentUser?.email,
            "MessageBody": messageTextField.text!
        ]
        
        messageDB.childByAutoId().setValue(messageDictionary){ (error, reference) in
            self.messageTextField.isEnabled = true
            self.sendButton.isEnabled = true
            ProgressHUD.dismiss()
            if error == nil{
                self.messageTextField.text = nil
                self.containerDown.isActive = true
                self.containerUp.isActive = false
                self.containerUpNoAutoCorrect.isActive = false
                UIView.animate(withDuration: 0.5) {
                    self.messageTextField.endEditing(true)
                    self.view.layoutIfNeeded()
                }
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    
    func retrieveMessages(){
        messageDB.observe(.childAdded) { (snapshot) in
            let snapValue = snapshot.value as? [String: String]
            let messages = snapValue.flatMap({(dictionary) -> Message in
                Message(dictionary: dictionary)
            })
            self.messageArray.append(messages!)
            self.tableView.reloadData()
        }
    }

    @objc func onLogOut(){
        do{
            try Auth.auth().signOut()
            self.navigationController?.popToRootViewController(animated: true)
        }catch{
            print("Error: Failed to log out")
        }
    }
    
    fileprivate func setUp() {
        
        view.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        containerDown = containerView.heightAnchor.constraint(equalToConstant: 50)
        containerUp = containerView.heightAnchor.constraint(equalToConstant: 308)
        containerUpNoAutoCorrect = containerView.heightAnchor.constraint(equalToConstant: 264)
        containerDown.isActive = true
        containerUp.isActive = false
        containerUpNoAutoCorrect.isActive = false
        
        containerView.addSubview(messageTextField)
        messageTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        messageTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        messageTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -80).isActive = true
        messageTextField.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        containerView.addSubview(sendButton)
        sendButton.leadingAnchor.constraint(equalTo: messageTextField.trailingAnchor, constant: 8).isActive = true
        sendButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        containerDown.isActive = false
        sendButton.isEnabled = true
        if textField.autocorrectionType == .yes{
            containerUp.isActive = true
            containerUpNoAutoCorrect.isActive = false
        }else{
            containerUp.isActive = false
            containerUpNoAutoCorrect.isActive = true
        }
        UIView.animate(withDuration: 0.5) {
            textField.becomeFirstResponder()
            self.view.layoutIfNeeded()
        }
    }
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! MessageCell
        cell.message = messageArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.containerDown.isActive = true
        self.containerUp.isActive = false
        self.containerUpNoAutoCorrect.isActive = false
        UIView.animate(withDuration: 0.5) {
            self.messageTextField.endEditing(true)
            self.view.layoutIfNeeded()
        }
    }
}
