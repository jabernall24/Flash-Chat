//
//  MessageCell.swift
//  Flash Chat
//
//  Created by Jesus Andres Bernal Lopez on 12/20/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit
import FirebaseAuth

class MessageCell: UITableViewCell {

    let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "egg")
        return iv
    }()
    
    private let messageBackgroundView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        v.backgroundColor = .orange
        return v
    }()
    
    let messageBodyLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .clear
        l.numberOfLines = 0
        return l
    }()
    
    let senderUsername: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    var message: Message!{
        didSet{
            messageBodyLabel.text = message.message
            senderUsername.text = message.user
            if senderUsername.text == Auth.auth().currentUser!.email as! String{
                avatarImageView.backgroundColor = #colorLiteral(red: 0.07143225948, green: 0.1624974843, blue: 0.6000669215, alpha: 1)
                messageBodyLabel.textColor = .white
                senderUsername.textColor = .white
                messageBackgroundView.backgroundColor = #colorLiteral(red: 0.1957436426, green: 0.3074185645, blue: 0.7914094002, alpha: 1)
            }else{
                avatarImageView.backgroundColor = #colorLiteral(red: 0.0338047779, green: 0.7254902124, blue: 0.6777571072, alpha: 1)
                messageBodyLabel.textColor = .black
                senderUsername.textColor = .black
                messageBackgroundView.backgroundColor = #colorLiteral(red: 0.5576030932, green: 0.9024550642, blue: 0.9607843161, alpha: 1)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    fileprivate func setUpView() {
        addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(messageBackgroundView)
        messageBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        messageBackgroundView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8).isActive = true
        messageBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        messageBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        messageBackgroundView.addSubview(senderUsername)
        senderUsername.centerXAnchor.constraint(equalTo: messageBackgroundView.centerXAnchor).isActive = true
        senderUsername.topAnchor.constraint(equalTo: messageBackgroundView.topAnchor).isActive = true
        senderUsername.widthAnchor.constraint(greaterThanOrEqualToConstant: 25).isActive = true
        senderUsername.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        messageBackgroundView.addSubview(messageBodyLabel)
        messageBodyLabel.topAnchor.constraint(equalTo: senderUsername.bottomAnchor).isActive = true
        messageBodyLabel.leadingAnchor.constraint(equalTo: messageBackgroundView.leadingAnchor, constant: 8).isActive = true
        messageBodyLabel.trailingAnchor.constraint(equalTo: messageBackgroundView.trailingAnchor, constant: -8).isActive = true
        messageBodyLabel.bottomAnchor.constraint(equalTo: messageBackgroundView.bottomAnchor, constant: -8).isActive = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
