//
//  ProfileViewController.swift
//  HousemateHunter
//
//  Created by Morgan Belous on 4/26/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    var topRect: UILabel!
    var bottomRect: UILabel!
    var theirProfileImagePageView: UIImageView!
    
    var theirUserName: UILabel!
    var theirBioLabel: UILabel!
    var theirFunFactLabel: UILabel!
    var bioView: UITextView!
    var funfactView: UITextView!
    
    var theirInfoLabel: UILabel!
    var theirGenderLabel: UILabel!
    var theirGender: UILabel!
    var theirPriceLabel: UILabel!
    var theirPrice: UILabel!
    
    var theirSleepLabel: UILabel!
    var theirSleep: UILabel!
    var theirCleanlinessLabel: UILabel!
    var theirCleanliness: UILabel!
    
    var theirContactInfoLabel: UILabel!
    var theirPhoneNumberLabel: UILabel!
    var theirPhoneNumber: UILabel!
    var theirEmailLabel: UILabel!
    var theirEmail: UILabel!
    
    var placeHolderTheirUserName: String
    var placeHolderTheirProfileImage: UIImage
    var placeHolderTheirGender: String
    var placeHolderTheirBio: String
    var placeHolderTheirFunFact: String
    var placeHolderTheirPriceMin: Int
    var placeHolderTheirPriceMax: Int
    var placeHolderTheirSleep: String
    var placeHolderTheirCleanliness: String
    var placeHolderTheirPhoneNumber: String
    var placeHolderTheirEmail: String

    

    
    init(placeHolderTheirUserName: String, placeHolderTheirProfileImage: UIImage, placeHolderTheirGender: String, placeHolderTheirBio: String, placeHolderTheirFunFact: String, placeHolderTheirPriceMin: Int, placeHolderTheirPriceMax: Int, placeHolderTheirSleep: String, placeHolderTheirCleanliness: String, placeHolderTheirPhoneNumber: String, placeHolderTheirEmail: String){
        self.placeHolderTheirUserName = placeHolderTheirUserName
        self.placeHolderTheirProfileImage = placeHolderTheirProfileImage
        self.placeHolderTheirGender = placeHolderTheirGender
        self.placeHolderTheirBio = placeHolderTheirBio
        self.placeHolderTheirFunFact = placeHolderTheirFunFact
        self.placeHolderTheirPriceMin = placeHolderTheirPriceMin
        self.placeHolderTheirPriceMax = placeHolderTheirPriceMax
        self.placeHolderTheirSleep = placeHolderTheirSleep
        self.placeHolderTheirCleanliness = placeHolderTheirCleanliness
        self.placeHolderTheirPhoneNumber = placeHolderTheirPhoneNumber
        self.placeHolderTheirEmail = placeHolderTheirEmail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        topRect = UILabel()
        topRect.translatesAutoresizingMaskIntoConstraints = false
        topRect.layer.cornerRadius = 10
        topRect.clipsToBounds = true
        topRect.backgroundColor = .white
        view.addSubview(topRect)
        topRect.layer.shadowColor = UIColor.black.cgColor
        topRect.layer.shadowRadius = 5
        topRect.layer.shadowOpacity = 0.4
        topRect.layer.shadowOffset = CGSize(width: 1, height: 1)
        topRect.layer.masksToBounds = false
        
        bottomRect = UILabel()
        bottomRect.translatesAutoresizingMaskIntoConstraints = false
        bottomRect.layer.cornerRadius = 10
        bottomRect.clipsToBounds = true
        bottomRect.backgroundColor = .white
        view.addSubview(bottomRect)
        bottomRect.layer.shadowColor = UIColor.black.cgColor
        bottomRect.layer.shadowRadius = 5
        bottomRect.layer.shadowOpacity = 0.4
        bottomRect.layer.shadowOffset = CGSize(width: 1, height: 1)
        bottomRect.layer.masksToBounds = false
        
        theirProfileImagePageView = UIImageView()
        theirProfileImagePageView.translatesAutoresizingMaskIntoConstraints = false
        theirProfileImagePageView.image = placeHolderTheirProfileImage
        theirProfileImagePageView.backgroundColor = .white
        theirProfileImagePageView.layer.cornerRadius = 50
        theirProfileImagePageView.clipsToBounds = true
        theirProfileImagePageView.contentMode = .scaleAspectFill
        view.addSubview(theirProfileImagePageView)
        
        theirUserName = UILabel()
        theirUserName.translatesAutoresizingMaskIntoConstraints = false
        theirUserName.font = UIFont.boldSystemFont(ofSize: 18)
        theirUserName.text = placeHolderTheirUserName
        theirUserName.textAlignment = .center
        view.addSubview(theirUserName)
        
        theirBioLabel = UILabel()
        theirBioLabel.translatesAutoresizingMaskIntoConstraints = false
        theirBioLabel.text = "Bio:"
        theirBioLabel.font = theirBioLabel.font?.withSize(14)
        view.addSubview(theirBioLabel)
        
        theirFunFactLabel = UILabel()
        theirFunFactLabel.translatesAutoresizingMaskIntoConstraints = false
        theirFunFactLabel.text = "Fun Fact:"
        theirFunFactLabel.font = theirFunFactLabel.font.withSize(14)
        view.addSubview(theirFunFactLabel)
        
        bioView = UITextView()
        bioView.translatesAutoresizingMaskIntoConstraints = false
        bioView.text = placeHolderTheirBio
        bioView.font = theirBioLabel.font.withSize(14)
        view.addSubview(bioView)
        
        funfactView = UITextView()
        funfactView.translatesAutoresizingMaskIntoConstraints = false
        funfactView.text = placeHolderTheirFunFact
        funfactView.font = theirBioLabel.font.withSize(14)
        view.addSubview(funfactView)
        
        theirInfoLabel = UILabel()
        theirInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        theirInfoLabel.text = "Personal Information"
        theirInfoLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(theirInfoLabel)
        
        theirGenderLabel = UILabel()
        theirGenderLabel.translatesAutoresizingMaskIntoConstraints = false
        theirGenderLabel.text = "Gender:"
        theirGenderLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(theirGenderLabel)
        
        theirGender = UILabel()
        theirGender.translatesAutoresizingMaskIntoConstraints = false
        theirGender.text = placeHolderTheirGender
        theirGender.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(theirGender)
        
        theirPriceLabel = UILabel()
        theirPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        theirPriceLabel.text = "Price Range (USD):"
        theirPriceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(theirPriceLabel)
        
        theirPrice = UILabel()
        theirPrice.translatesAutoresizingMaskIntoConstraints = false
        theirPrice.text = "$\(placeHolderTheirPriceMin) to $\(placeHolderTheirPriceMax)"
        theirPrice.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(theirPrice)
        
        theirSleepLabel = UILabel()
        theirSleepLabel.translatesAutoresizingMaskIntoConstraints = false
        theirSleepLabel.text = "Sleep Schedule:"
        theirSleepLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(theirSleepLabel)
        
        theirSleep = UILabel()
        theirSleep.translatesAutoresizingMaskIntoConstraints = false
        theirSleep.text = placeHolderTheirSleep
        theirSleep.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(theirSleep)
        
        theirCleanlinessLabel = UILabel()
        theirCleanlinessLabel.translatesAutoresizingMaskIntoConstraints = false
        theirCleanlinessLabel.text = "Cleanliness:"
        theirCleanlinessLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(theirCleanlinessLabel)
        
        theirCleanliness = UILabel()
        theirCleanliness.translatesAutoresizingMaskIntoConstraints = false
        theirCleanliness.text = placeHolderTheirCleanliness
        theirCleanliness.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(theirCleanliness)
        
        theirContactInfoLabel = UILabel()
        theirContactInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        theirContactInfoLabel.text = "Contact Information"
        theirContactInfoLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(theirContactInfoLabel)
        
        theirPhoneNumberLabel = UILabel()
        theirPhoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        theirPhoneNumberLabel.text = "Phone Number:"
        theirPhoneNumberLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(theirPhoneNumberLabel)
        
        theirPhoneNumber = UILabel()
        theirPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        theirPhoneNumber.text = placeHolderTheirPhoneNumber
        theirPhoneNumber.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(theirPhoneNumber)
        
        theirEmailLabel = UILabel()
        theirEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        theirEmailLabel.text = "Email:"
        theirEmailLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(theirEmailLabel)
        
        theirEmail = UILabel()
        theirEmail.translatesAutoresizingMaskIntoConstraints = false
        theirEmail.text = placeHolderTheirEmail
        theirEmail.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(theirEmail)
        
        
        setupConstraints()
     
    }
    
    func setupConstraints(){
        
    
        NSLayoutConstraint.activate([
            topRect.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            topRect.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topRect.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -445),
            topRect.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            topRect.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            bottomRect.topAnchor.constraint(equalTo: topRect.bottomAnchor, constant: 20),
            bottomRect.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomRect.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            bottomRect.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            bottomRect.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            theirProfileImagePageView.centerYAnchor.constraint(equalTo: topRect.topAnchor),
            theirProfileImagePageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theirProfileImagePageView.heightAnchor.constraint(equalToConstant: 100),
            theirProfileImagePageView.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate([
            theirUserName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            theirUserName.topAnchor.constraint(equalTo: theirProfileImagePageView.bottomAnchor, constant: 12),
            theirUserName.leadingAnchor.constraint(equalTo: topRect.leadingAnchor, constant: 60),
            theirUserName.trailingAnchor.constraint(equalTo: topRect.trailingAnchor, constant: -60)
            ])
        
        NSLayoutConstraint.activate([
            theirBioLabel.topAnchor.constraint(equalTo: theirUserName.bottomAnchor, constant: 12),
            theirBioLabel.heightAnchor.constraint(equalToConstant: 30),
            theirBioLabel.widthAnchor.constraint(equalToConstant: 60),
            theirBioLabel.leadingAnchor.constraint(equalTo: topRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirFunFactLabel.topAnchor.constraint(equalTo: theirBioLabel.bottomAnchor, constant: 12),
            theirFunFactLabel.heightAnchor.constraint(equalToConstant: 30),
            theirFunFactLabel.widthAnchor.constraint(equalToConstant: 60),
            theirFunFactLabel.leadingAnchor.constraint(equalTo: topRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            bioView.bottomAnchor.constraint(equalTo: theirBioLabel.bottomAnchor, constant: -2),
            bioView.heightAnchor.constraint(equalToConstant: 30),
            bioView.leadingAnchor.constraint(equalTo: theirBioLabel.trailingAnchor, constant: 20),
            bioView.trailingAnchor.constraint(equalTo: topRect.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            funfactView.topAnchor.constraint(equalTo: theirFunFactLabel.topAnchor, constant: -2),
            funfactView.heightAnchor.constraint(equalToConstant: 100),
            funfactView.leadingAnchor.constraint(equalTo: theirFunFactLabel.trailingAnchor, constant: 20),
            funfactView.trailingAnchor.constraint(equalTo: topRect.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            theirInfoLabel.topAnchor.constraint(equalTo: bottomRect.topAnchor, constant: 20),
            theirInfoLabel.heightAnchor.constraint(equalToConstant: 30),
            theirInfoLabel.widthAnchor.constraint(equalToConstant: 300),
            theirInfoLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirGenderLabel.topAnchor.constraint(equalTo: theirInfoLabel.bottomAnchor, constant: 20),
            theirGenderLabel.heightAnchor.constraint(equalToConstant: 30),
            theirGenderLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirGender.topAnchor.constraint(equalTo: theirInfoLabel.bottomAnchor, constant: 20),
            theirGender.heightAnchor.constraint(equalToConstant: 30),
            theirGender.leadingAnchor.constraint(equalTo: theirGenderLabel.trailingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            theirPriceLabel.topAnchor.constraint(equalTo: theirInfoLabel.bottomAnchor, constant: 55),
            theirPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            theirPriceLabel.trailingAnchor.constraint(equalTo: bottomRect.trailingAnchor, constant: -30),
            theirPriceLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirPrice.topAnchor.constraint(equalTo: theirInfoLabel.bottomAnchor, constant: 55),
            theirPrice.heightAnchor.constraint(equalToConstant: 30),
            theirPrice.leadingAnchor.constraint(equalTo: theirPriceLabel.leadingAnchor, constant: 135)
            ])
        
        NSLayoutConstraint.activate([
            theirSleepLabel.topAnchor.constraint(equalTo: theirInfoLabel.bottomAnchor, constant: 105),
            theirSleepLabel.heightAnchor.constraint(equalToConstant: 30),
            theirSleepLabel.widthAnchor.constraint(equalToConstant: 125),
            theirSleepLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirSleep.topAnchor.constraint(equalTo: theirInfoLabel.bottomAnchor, constant: 105),
            theirSleep.heightAnchor.constraint(equalToConstant: 30),
            theirSleep.widthAnchor.constraint(equalToConstant: 125),
            theirSleep.leadingAnchor.constraint(equalTo: theirSleepLabel.leadingAnchor, constant: 115)
            ])
        
        NSLayoutConstraint.activate([
            theirCleanlinessLabel.topAnchor.constraint(equalTo: theirInfoLabel.bottomAnchor, constant: 140),
            theirCleanlinessLabel.heightAnchor.constraint(equalToConstant: 30),
            theirCleanlinessLabel.widthAnchor.constraint(equalToConstant: 125),
            theirCleanlinessLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirCleanliness.topAnchor.constraint(equalTo: theirInfoLabel.bottomAnchor, constant: 140),
            theirCleanliness.heightAnchor.constraint(equalToConstant: 30),
            theirCleanliness.widthAnchor.constraint(equalToConstant: 125),
            theirCleanliness.leadingAnchor.constraint(equalTo: theirCleanlinessLabel.leadingAnchor, constant: 90)
            ])
        
        NSLayoutConstraint.activate([
            theirContactInfoLabel.topAnchor.constraint(equalTo: bottomRect.topAnchor, constant: 240),
            theirContactInfoLabel.heightAnchor.constraint(equalToConstant: 30),
            theirContactInfoLabel.widthAnchor.constraint(equalToConstant: 300),
            theirContactInfoLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirPhoneNumberLabel.topAnchor.constraint(equalTo: theirContactInfoLabel.bottomAnchor, constant: 10),
            theirPhoneNumberLabel.heightAnchor.constraint(equalToConstant: 30),
            theirPhoneNumberLabel.widthAnchor.constraint(equalToConstant: 125),
            theirPhoneNumberLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirPhoneNumber.topAnchor.constraint(equalTo: theirContactInfoLabel.bottomAnchor, constant: 10),
            theirPhoneNumber.heightAnchor.constraint(equalToConstant: 30),
            theirPhoneNumber.widthAnchor.constraint(equalToConstant: 125),
            theirPhoneNumber.leadingAnchor.constraint(equalTo: theirPhoneNumberLabel.leadingAnchor, constant: 110)
            ])
        
        NSLayoutConstraint.activate([
            theirEmailLabel.topAnchor.constraint(equalTo: theirContactInfoLabel.bottomAnchor, constant: 45),
            theirEmailLabel.heightAnchor.constraint(equalToConstant: 30),
            theirEmailLabel.widthAnchor.constraint(equalToConstant: 125),
            theirEmailLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            theirEmail.topAnchor.constraint(equalTo: theirContactInfoLabel.bottomAnchor, constant: 45),
            theirEmail.heightAnchor.constraint(equalToConstant: 30),
            theirEmail.leadingAnchor.constraint(equalTo: theirEmailLabel.leadingAnchor, constant: 50)
            ])
   
    }
    
}
