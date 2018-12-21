//
//  MessageCell.swift
//  Flash Chat
//
//  Created by Jesus Andres Bernal Lopez on 12/20/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    private let avatarImageView: UIImageView = {
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
    
    private let messageBodyLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .clear
        l.text = "A very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kjaA very long texta ldasf kja"
        l.numberOfLines = 0
        return l
    }()
    
    private let senderUsername: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .red
        return l
    }()
    
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
