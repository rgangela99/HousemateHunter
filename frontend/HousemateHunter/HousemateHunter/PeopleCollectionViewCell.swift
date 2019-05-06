//
//  MatchesCollectionViewCell.swift
//  HousemateHunter
//
//  Created by Morgan Belous on 4/26/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    
    var nameTextView: UITextView!
    var theirImageData64: String!
    var theirProfileImageView: UIImageView!
    
    
    
    let padding: CGFloat = 2
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let dataDecoded:NSData = NSData(base64Encoded: theirImageData64, options: NSData.Base64DecodingOptions(rawValue: 0))!
        let decodedProfileImage:UIImage = UIImage(data: dataDecoded as Data)!
        
        contentView.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        contentView.layer.cornerRadius = 10
        

        
        nameTextView = UITextView()
        nameTextView.translatesAutoresizingMaskIntoConstraints = false
        nameTextView.backgroundColor = .white
        nameTextView.font = .systemFont(ofSize: 14)
        nameTextView.textColor = .gray
        nameTextView.layer.masksToBounds = true
        nameTextView.layer.cornerRadius = 10
        nameTextView.isScrollEnabled = false
        nameTextView.isEditable = false
        contentView.addSubview(nameTextView)
        
        theirProfileImageView = UIImageView()
        theirProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        theirProfileImageView.contentMode = .scaleAspectFill
        theirProfileImageView.clipsToBounds = true
        theirProfileImageView.layer.cornerRadius = 10
        theirProfileImageView.image = decodedProfileImage
        contentView.addSubview(theirProfileImageView)
        
        
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            nameTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            nameTextView.heightAnchor.constraint(equalToConstant: 50),
            nameTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            ])
        
        NSLayoutConstraint.activate([
            theirProfileImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            theirProfileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            theirProfileImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            theirProfileImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
    
    }
    
    func configure(for person: Person) {
        nameTextView.text = "Name: \(person.name) \nYear: \(person.grad_year)"
        theirImageData64 = person.profile_pic
        //theirProfileImageView.image = person.theirProfileImage
        
        
        
    }
      
}
