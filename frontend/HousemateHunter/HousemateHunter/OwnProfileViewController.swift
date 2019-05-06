//
//  OwnProfileViewController.swift
//  HousemateHunter
//
//  Created by Kristina Liu on 4/29/19.
//  Copyright © 2019 Kristina Liu. All rights reserved.
//

import UIKit

class OwnProfileViewController: UIViewController {
    
    var bioLabel: UILabel!
    var funfactLabel: UILabel!
    var bioField: UITextField!
    var funfactField: UITextField!
    var userNameTextBox: UITextField!
    var placeHolderUserName: String!
    var placeHolderUserBio: String!
    var placeHolderUserFunFact: String!
    var placeHolderProfileImage: UIImage!
    
    var myInfoLabel: UILabel!
    var genderLabel: UILabel!
    var maleButton: UIButton!
    var femaleButton: UIButton!
    var uncheckedMale: Bool!
    var uncheckedFemale: Bool!
    var maleLabel: UILabel!
    var femaleLabel: UILabel!
    
    var priceLabel: UILabel!
    var sliderMax: UISlider!
    var sliderMin: UISlider!
    var sliderMaxText: UILabel!
    var sliderMinText: UILabel!
    var placeHolderPriceMax: Int!
    var placeHolderPriceMin: Int!
    
    var sleepLabel: UILabel!
    var before12Button: UIButton!
    var around12Button: UIButton!
    var after12Button: UIButton!
    var uncheckedBefore12: Bool!
    var uncheckedAround12: Bool!
    var uncheckedAfter12: Bool!
    var before12Label: UILabel!
    var around12Label: UILabel!
    var after12Label: UILabel!
    
    var cleanlinessLabel: UILabel!
    var veryCleanButton: UIButton!
    var cleanButton: UIButton!
    var uncheckedVeryClean: Bool!
    var uncheckedClean: Bool!
    var veryCleanLabel: UILabel!
    var cleanLabel: UILabel!
    
    var topRect: UILabel!
    var bottomRect: UILabel!
    var ownProfilePictureButton: UIButton!
    var imagePicker = UIImagePickerController()
    
    weak var delegate: ChangeUserInformationDelegate?
    
    
    var dismissOwnProfileButton: UIButton!
    
    init(placeHolderUserName: String, placeHolderProfileImage: UIImage, placeHolderUserBio: String, placeHolderUserFunFact: String, placeHolderPriceMax: Int, placeHolderPriceMin: Int, uncheckedMale: Bool, uncheckedFemale: Bool, uncheckedBefore12: Bool, uncheckedAround12: Bool, uncheckedAfter12: Bool, uncheckedVeryClean: Bool, uncheckedClean: Bool){
        self.placeHolderUserName = placeHolderUserName
        self.placeHolderProfileImage = placeHolderProfileImage
        self.placeHolderUserBio = placeHolderUserBio
        self.placeHolderUserFunFact = placeHolderUserFunFact
        self.placeHolderPriceMax = placeHolderPriceMax
        self.placeHolderPriceMin = placeHolderPriceMin
        self.uncheckedMale = uncheckedMale
        self.uncheckedFemale = uncheckedFemale
        self.uncheckedBefore12 = uncheckedBefore12
        self.uncheckedAround12 = uncheckedAround12
        self.uncheckedAfter12 = uncheckedAfter12
        self.uncheckedVeryClean = uncheckedVeryClean
        self.uncheckedClean = uncheckedClean
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imagePicker.delegate = self
        
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
        
        userNameTextBox = UITextField()
        userNameTextBox.translatesAutoresizingMaskIntoConstraints = false
        userNameTextBox.borderStyle = .roundedRect
        userNameTextBox.font = userNameTextBox.font?.withSize(18)
        userNameTextBox.text = placeHolderUserName
        userNameTextBox.clearsOnBeginEditing = true
        userNameTextBox.textAlignment = .center
        view.addSubview(userNameTextBox)
        
        bioLabel = UILabel()
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.text = "Bio:"
        bioLabel.font = bioLabel.font?.withSize(14)
        view.addSubview(bioLabel)
        
        funfactLabel = UILabel()
        funfactLabel.translatesAutoresizingMaskIntoConstraints = false
        funfactLabel.text = "Fun Fact:"
        funfactLabel.font = funfactLabel.font.withSize(14)
        view.addSubview(funfactLabel)
        
        bioField = UITextField()
        bioField.translatesAutoresizingMaskIntoConstraints = false
        bioField.borderStyle = .roundedRect
        bioField.text = placeHolderUserBio
        bioField.font = bioLabel.font.withSize(13)
        bioField.clearsOnBeginEditing = true
        view.addSubview(bioField)
        
        funfactField = UITextField()
        funfactField.translatesAutoresizingMaskIntoConstraints = false
        funfactField.borderStyle = .roundedRect
        funfactField.text = placeHolderUserFunFact
        funfactField.font = bioLabel.font.withSize(13)
        funfactField.clearsOnBeginEditing = true
        view.addSubview(funfactField)
        
        myInfoLabel = UILabel()
        myInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        myInfoLabel.text = "My Public Information"
        myInfoLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(myInfoLabel)
        
        genderLabel = UILabel()
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.text = "Gender"
        genderLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(genderLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "Price Range (USD)"
        priceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(priceLabel)
        
        sleepLabel = UILabel()
        sleepLabel.translatesAutoresizingMaskIntoConstraints = false
        sleepLabel.text = "Sleep Schedule"
        sleepLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(sleepLabel)
        
        cleanlinessLabel = UILabel()
        cleanlinessLabel.translatesAutoresizingMaskIntoConstraints = false
        cleanlinessLabel.text = "Cleanliness"
        cleanlinessLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(cleanlinessLabel)
        
        dismissOwnProfileButton = UIButton()
        dismissOwnProfileButton.translatesAutoresizingMaskIntoConstraints = false
        dismissOwnProfileButton.setTitle("Save", for: .normal)
        dismissOwnProfileButton.setTitleColor(.black, for: .normal)
        dismissOwnProfileButton.addTarget(self, action: #selector(dismissOwnProfile), for: .touchUpInside)
        view.addSubview(dismissOwnProfileButton)
        
        ownProfilePictureButton = UIButton()
        ownProfilePictureButton.translatesAutoresizingMaskIntoConstraints = false
        ownProfilePictureButton.setImage(placeHolderProfileImage, for: .normal)
        ownProfilePictureButton.backgroundColor = .white
        ownProfilePictureButton.layer.cornerRadius = 50
        ownProfilePictureButton.layer.shadowOpacity = 0.4
        ownProfilePictureButton.layer.shadowRadius = 5
        ownProfilePictureButton.clipsToBounds = true
        ownProfilePictureButton.addTarget(self, action: #selector(displayImagePicker), for: .touchUpInside)
        view.addSubview(ownProfilePictureButton)
        
        sliderMaxText = UILabel()
        sliderMaxText.translatesAutoresizingMaskIntoConstraints = false
        sliderMaxText.text = "$\((IntegerLiteralType)(placeHolderPriceMax))"
        sliderMaxText.font = sliderMaxText.font.withSize(14)
        view.addSubview(sliderMaxText)
        
        sliderMinText = UILabel()
        sliderMinText.translatesAutoresizingMaskIntoConstraints = false
        sliderMinText.text = "$\((IntegerLiteralType)(placeHolderPriceMin))"
        sliderMinText.font = sliderMinText.font.withSize(14)
        view.addSubview(sliderMinText)
        
        sliderMax = UISlider()
        sliderMax.translatesAutoresizingMaskIntoConstraints = false
        sliderMax.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        sliderMax.thumbTintColor = .gray
        sliderMax.maximumValue = 10000
        sliderMax.minimumValue = 0
        sliderMax.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        view.addSubview(sliderMax)
        
        sliderMin = UISlider()
        sliderMin.translatesAutoresizingMaskIntoConstraints = false
        sliderMin.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        sliderMin.thumbTintColor = .gray
        sliderMin.maximumValue = 10000
        sliderMin.minimumValue = 0
        sliderMin.addTarget(self, action: #selector(changeValue2(_:)), for: .valueChanged)
        view.addSubview(sliderMin)
        
        maleButton = UIButton()
        maleButton.translatesAutoresizingMaskIntoConstraints = false
        var imageMaleCheck = UIImage(named: "unchecked.png")
        if (!(uncheckedMale)){
            imageMaleCheck = UIImage(named: "checked.png")
        }
        maleButton.setImage(imageMaleCheck, for: .normal)
        maleButton.addTarget(self, action: #selector(checkMale), for: .touchUpInside)
        view.addSubview(maleButton)
        
        femaleButton = UIButton()
        femaleButton.translatesAutoresizingMaskIntoConstraints = false
        var imageFemaleCheck = UIImage(named: "unchecked.png")
        if (!(uncheckedFemale)){
            imageFemaleCheck = UIImage(named: "checked.png")
        }
        femaleButton.setImage(imageFemaleCheck, for: .normal)
        femaleButton.addTarget(self, action: #selector(checkFemale), for: .touchUpInside)
        view.addSubview(femaleButton)
        
        maleLabel = UILabel()
        maleLabel.translatesAutoresizingMaskIntoConstraints = false
        maleLabel.text = "Male"
        maleLabel.font = maleLabel.font.withSize(14)
        view.addSubview(maleLabel)
        
        femaleLabel = UILabel()
        femaleLabel.translatesAutoresizingMaskIntoConstraints = false
        femaleLabel.text = "Female"
        femaleLabel.font = femaleLabel.font.withSize(14)
        view.addSubview(femaleLabel)
        
        before12Button = UIButton()
        before12Button.translatesAutoresizingMaskIntoConstraints = false
        var imageBefore12Check = UIImage(named: "unchecked.png")
        if (!(uncheckedBefore12)){
            imageBefore12Check = UIImage(named: "checked.png")
        }
        before12Button.setImage(imageBefore12Check, for: .normal)
        before12Button.addTarget(self, action: #selector(checkBefore12), for: .touchUpInside)
        view.addSubview(before12Button)
        
        around12Button = UIButton()
        around12Button.translatesAutoresizingMaskIntoConstraints = false
        var imageAround12Check = UIImage(named: "unchecked.png")
        if (!(uncheckedAround12)){
            imageAround12Check = UIImage(named: "checked.png")
        }
        around12Button.setImage(imageAround12Check, for: .normal)
        around12Button.addTarget(self, action: #selector(checkAround12), for: .touchUpInside)
        view.addSubview(around12Button)
        
        after12Button = UIButton()
        after12Button.translatesAutoresizingMaskIntoConstraints = false
        var imageAfter12Check = UIImage(named: "unchecked.png")
        if (!(uncheckedAfter12)){
            imageAfter12Check = UIImage(named: "checked.png")
        }
        after12Button.setImage(imageAfter12Check, for: .normal)
        after12Button.addTarget(self, action: #selector(checkAfter12), for: .touchUpInside)
        view.addSubview(after12Button)
        
        before12Label = UILabel()
        before12Label.translatesAutoresizingMaskIntoConstraints = false
        before12Label.text = "Before 12am"
        before12Label.font = before12Label.font.withSize(14)
        view.addSubview(before12Label)
        
        around12Label = UILabel()
        around12Label.translatesAutoresizingMaskIntoConstraints = false
        around12Label.text = "Around 12am"
        around12Label.font = around12Label.font.withSize(14)
        view.addSubview(around12Label)
        
        after12Label = UILabel()
        after12Label.translatesAutoresizingMaskIntoConstraints = false
        after12Label.text = "After 12am"
        after12Label.font = after12Label.font.withSize(14)
        view.addSubview(after12Label)
        
        veryCleanButton = UIButton()
        veryCleanButton.translatesAutoresizingMaskIntoConstraints = false
        var imageVeryCleanCheck = UIImage(named: "unchecked.png")
        if (!(uncheckedVeryClean)){
            imageVeryCleanCheck = UIImage(named: "checked.png")
        }
        veryCleanButton.setImage(imageVeryCleanCheck, for: .normal)
        veryCleanButton.addTarget(self, action: #selector(checkVeryClean), for: .touchUpInside)
        view.addSubview(veryCleanButton)
        
        cleanButton = UIButton()
        cleanButton.translatesAutoresizingMaskIntoConstraints = false
        var imageCleanCheck = UIImage(named: "unchecked.png")
        if (!(uncheckedClean)){
            imageCleanCheck = UIImage(named: "checked.png")
        }
        cleanButton.setImage(imageCleanCheck, for: .normal)
        cleanButton.addTarget(self, action: #selector(checkClean), for: .touchUpInside)
        view.addSubview(cleanButton)
        
        veryCleanLabel = UILabel()
        veryCleanLabel.translatesAutoresizingMaskIntoConstraints = false
        veryCleanLabel.text = "Very Clean"
        veryCleanLabel.font = veryCleanLabel.font.withSize(14)
        view.addSubview(veryCleanLabel)
        
        cleanLabel = UILabel()
        cleanLabel.translatesAutoresizingMaskIntoConstraints = false
        cleanLabel.text = "Casual"
        cleanLabel.font = cleanLabel.font.withSize(14)
        view.addSubview(cleanLabel)
        
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
            dismissOwnProfileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20
            ),
            dismissOwnProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissOwnProfileButton.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        
        NSLayoutConstraint.activate([
            ownProfilePictureButton.centerYAnchor.constraint(equalTo: topRect.topAnchor),
            ownProfilePictureButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ownProfilePictureButton.heightAnchor.constraint(equalToConstant: 100),
            ownProfilePictureButton.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        
        NSLayoutConstraint.activate([
            userNameTextBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameTextBox.topAnchor.constraint(equalTo: ownProfilePictureButton.bottomAnchor, constant: 12),
            userNameTextBox.leadingAnchor.constraint(equalTo: topRect.leadingAnchor, constant: 60),
            userNameTextBox.trailingAnchor.constraint(equalTo: topRect.trailingAnchor, constant: -60)
            ])
        
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: userNameTextBox.bottomAnchor, constant: 12),
            bioLabel.heightAnchor.constraint(equalToConstant: 30),
            bioLabel.widthAnchor.constraint(equalToConstant: 60),
            bioLabel.leadingAnchor.constraint(equalTo: topRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            funfactLabel.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 12),
            funfactLabel.heightAnchor.constraint(equalToConstant: 30),
            funfactLabel.widthAnchor.constraint(equalToConstant: 60),
            funfactLabel.leadingAnchor.constraint(equalTo: topRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            bioField.topAnchor.constraint(equalTo: userNameTextBox.bottomAnchor, constant: 12),
            bioField.heightAnchor.constraint(equalToConstant: 30),
            bioField.leadingAnchor.constraint(equalTo: bioLabel.trailingAnchor, constant: 20),
            bioField.trailingAnchor.constraint(equalTo: topRect.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            funfactField.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 12),
            funfactField.heightAnchor.constraint(equalToConstant: 30),
            funfactField.leadingAnchor.constraint(equalTo: funfactLabel.trailingAnchor, constant: 20),
            funfactField.trailingAnchor.constraint(equalTo: topRect.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            myInfoLabel.topAnchor.constraint(equalTo: bottomRect.topAnchor, constant: 20),
            myInfoLabel.heightAnchor.constraint(equalToConstant: 30),
            myInfoLabel.widthAnchor.constraint(equalToConstant: 300),
            myInfoLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: myInfoLabel.bottomAnchor, constant: 20),
            genderLabel.heightAnchor.constraint(equalToConstant: 30),
            genderLabel.widthAnchor.constraint(equalToConstant: 125),
            genderLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            maleButton.centerYAnchor.constraint(equalTo: sliderMax.centerYAnchor),
            maleButton.heightAnchor.constraint(equalToConstant: 20),
            maleButton.widthAnchor.constraint(equalToConstant: 20),
            maleButton.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            femaleButton.centerYAnchor.constraint(equalTo: sliderMin.centerYAnchor),
            femaleButton.heightAnchor.constraint(equalToConstant: 20),
            femaleButton.widthAnchor.constraint(equalToConstant: 20),
            femaleButton.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            maleLabel.centerYAnchor.constraint(equalTo: maleButton.centerYAnchor),
            maleLabel.heightAnchor.constraint(equalToConstant: 30),
            maleLabel.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            femaleLabel.centerYAnchor.constraint(equalTo: femaleButton.centerYAnchor),
            femaleLabel.heightAnchor.constraint(equalToConstant: 30),
            femaleLabel.leadingAnchor.constraint(equalTo: femaleButton.trailingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: myInfoLabel.bottomAnchor, constant: 20),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),
            priceLabel.trailingAnchor.constraint(equalTo: bottomRect.trailingAnchor, constant: -30),
            priceLabel.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            sliderMax.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            sliderMax.heightAnchor.constraint(equalToConstant: 30),
            sliderMax.trailingAnchor.constraint(equalTo: bottomRect.trailingAnchor, constant: -10),
            sliderMax.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            sliderMin.topAnchor.constraint(equalTo: sliderMax.bottomAnchor, constant: 10),
            sliderMin.heightAnchor.constraint(equalToConstant: 30),
            sliderMin.trailingAnchor.constraint(equalTo: bottomRect.trailingAnchor, constant: -10),
            sliderMin.leadingAnchor.constraint(equalTo: genderLabel.trailingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            sliderMinText.centerYAnchor.constraint(equalTo: sliderMin.centerYAnchor),
            sliderMinText.trailingAnchor.constraint(equalTo: sliderMin.leadingAnchor, constant: 25),
            sliderMinText.heightAnchor.constraint(equalToConstant: 30),
            ])
        
        NSLayoutConstraint.activate([
            sliderMaxText.centerYAnchor.constraint(equalTo: sliderMax.centerYAnchor),
            sliderMaxText.trailingAnchor.constraint(equalTo: sliderMax.leadingAnchor, constant: 25),
            sliderMaxText.heightAnchor.constraint(equalToConstant: 30),
            ])
        
        NSLayoutConstraint.activate([
            sleepLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 100),
            sleepLabel.heightAnchor.constraint(equalToConstant: 30),
            sleepLabel.widthAnchor.constraint(equalToConstant: 125),
            sleepLabel.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            before12Button.topAnchor.constraint(equalTo: sleepLabel.bottomAnchor, constant: 20),
            before12Button.heightAnchor.constraint(equalToConstant: 20),
            before12Button.widthAnchor.constraint(equalToConstant: 20),
            before12Button.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            around12Button.topAnchor.constraint(equalTo: before12Button.bottomAnchor, constant: 10),
            around12Button.heightAnchor.constraint(equalToConstant: 20),
            around12Button.widthAnchor.constraint(equalToConstant: 20),
            around12Button.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            after12Button.topAnchor.constraint(equalTo: around12Button.bottomAnchor, constant: 10),
            after12Button.heightAnchor.constraint(equalToConstant: 20),
            after12Button.widthAnchor.constraint(equalToConstant: 20),
            after12Button.leadingAnchor.constraint(equalTo: bottomRect.leadingAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            before12Label.centerYAnchor.constraint(equalTo: before12Button.centerYAnchor),
            before12Label.heightAnchor.constraint(equalToConstant: 30),
            before12Label.leadingAnchor.constraint(equalTo: before12Button.trailingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            around12Label.centerYAnchor.constraint(equalTo: around12Button.centerYAnchor),
            around12Label.heightAnchor.constraint(equalToConstant: 30),
            around12Label.leadingAnchor.constraint(equalTo: around12Button.trailingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            after12Label.centerYAnchor.constraint(equalTo: after12Button.centerYAnchor),
            after12Label.heightAnchor.constraint(equalToConstant: 30),
            after12Label.leadingAnchor.constraint(equalTo: after12Button.trailingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            cleanlinessLabel.centerYAnchor.constraint(equalTo: sleepLabel.centerYAnchor),
            cleanlinessLabel.heightAnchor.constraint(equalToConstant: 30),
            cleanlinessLabel.trailingAnchor.constraint(equalTo: bottomRect.trailingAnchor, constant: -30),
            cleanlinessLabel.leadingAnchor.constraint(equalTo: sleepLabel.trailingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            veryCleanButton.centerYAnchor.constraint(equalTo: before12Button.centerYAnchor),
            veryCleanButton.heightAnchor.constraint(equalToConstant: 20),
            veryCleanButton.widthAnchor.constraint(equalToConstant: 20),
            veryCleanButton.leadingAnchor.constraint(equalTo: cleanlinessLabel.leadingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            cleanButton.centerYAnchor.constraint(equalTo: around12Button.centerYAnchor),
            cleanButton.heightAnchor.constraint(equalToConstant: 20),
            cleanButton.widthAnchor.constraint(equalToConstant: 20),
            cleanButton.leadingAnchor.constraint(equalTo: cleanlinessLabel.leadingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            veryCleanLabel.centerYAnchor.constraint(equalTo: veryCleanButton.centerYAnchor),
            veryCleanLabel.heightAnchor.constraint(equalToConstant: 30),
            veryCleanLabel.leadingAnchor.constraint(equalTo: veryCleanButton.trailingAnchor, constant: 10)
            ])
        
        NSLayoutConstraint.activate([
            cleanLabel.centerYAnchor.constraint(equalTo: cleanButton.centerYAnchor),
            cleanLabel.heightAnchor.constraint(equalToConstant: 30),
            cleanLabel.leadingAnchor.constraint(equalTo: cleanButton.trailingAnchor, constant: 10)
            ])
    }
    
    @objc func displayImagePicker(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @objc func changeValue(_ sender: UISlider) {
        sliderMaxText.text = "$\((IntegerLiteralType)(sliderMax.value))"
    }
    
    @objc func changeValue2(_ sender: UISlider) {
        sliderMinText.text = "$\((IntegerLiteralType)(sliderMin.value))"
    }
    
    @objc func checkMale(_ sender: UIButton) {
        if uncheckedMale {
            maleButton.setImage(UIImage(named:"checked.png"), for: .normal)
            uncheckedMale = false
            femaleButton.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedFemale = true
        }
        else {
            maleButton.setImage( UIImage(named:"unchecked.png"), for: .normal)
            uncheckedMale = true
        }
    }
    
    @objc func checkFemale(_ sender: UIButton) {
        if uncheckedFemale {
            femaleButton.setImage(UIImage(named:"checked.png"), for: .normal)
            uncheckedFemale = false
            maleButton.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedMale = true
        }
        else {
            femaleButton.setImage( UIImage(named:"unchecked.png"), for: .normal)
            uncheckedFemale = true
        }
    }
    
    @objc func checkBefore12(_ sender: UIButton) {
        if uncheckedBefore12 {
            before12Button.setImage(UIImage(named:"checked.png"), for: .normal)
            uncheckedBefore12 = false
            around12Button.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedAround12 = true
            after12Button.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedAfter12 = true
        }
        else {
            before12Button.setImage( UIImage(named:"unchecked.png"), for: .normal)
            uncheckedBefore12 = true
        }
    }
    
    @objc func checkAround12(_ sender: UIButton) {
        if uncheckedAround12 {
            around12Button.setImage(UIImage(named:"checked.png"), for: .normal)
            uncheckedAround12 = false
            before12Button.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedBefore12 = true
            after12Button.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedAfter12 = true
        }
        else {
            around12Button.setImage( UIImage(named:"unchecked.png"), for: .normal)
            uncheckedAround12 = true
        }
    }
    
    @objc func checkAfter12(_ sender: UIButton) {
        if uncheckedAfter12 {
            after12Button.setImage(UIImage(named:"checked.png"), for: .normal)
            uncheckedAfter12 = false
            before12Button.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedBefore12 = true
            around12Button.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedAround12 = true
        }
        else {
            after12Button.setImage( UIImage(named:"unchecked.png"), for: .normal)
            uncheckedAfter12 = true
        }
    }
    
    @objc func checkVeryClean(_ sender: UIButton) {
        if uncheckedVeryClean {
            veryCleanButton.setImage(UIImage(named:"checked.png"), for: .normal)
            uncheckedVeryClean = false
            cleanButton.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedClean = true
        }
        else {
            veryCleanButton.setImage( UIImage(named:"unchecked.png"), for: .normal)
            uncheckedVeryClean = true
        }
    }
    
    @objc func checkClean(_ sender: UIButton) {
        if uncheckedClean {
            cleanButton.setImage(UIImage(named:"checked.png"), for: .normal)
            uncheckedClean = false
            veryCleanButton.setImage(UIImage(named: "unchecked.png"), for: .normal)
            uncheckedVeryClean = true
        }
        else {
            cleanButton.setImage( UIImage(named:"unchecked.png"), for: .normal)
            uncheckedClean = true
        }
    }
    
    @objc func dismissOwnProfile(){
        if let name = userNameTextBox.text, let funfact = funfactField.text, let bio = bioField.text, let image = ownProfilePictureButton.currentImage {
            if var max = sliderMaxText.text, var min = sliderMinText.text {
                max = max.replacingOccurrences(of: "$", with: "", options: NSString.CompareOptions.literal, range: nil)
                min = min.replacingOccurrences(of: "$", with: "", options: NSString.CompareOptions.literal, range: nil)
                let max2 = ((IntegerLiteralType)(max))
                let min2 = ((IntegerLiteralType)(min))
                let female = uncheckedFemale
                let male = uncheckedMale
                let before12 = uncheckedBefore12
                let around12 = uncheckedAround12
                let after12 = uncheckedAfter12
                let veryClean = uncheckedVeryClean
                let clean = uncheckedClean
                delegate?.userInformationChanged(to: name, newProfileImage: image, newFunFact: funfact, newBio: bio, newMax: max2!, newMin: min2!, newMale: male!, newFemale: female!, newBefore12: before12!, newAround12: around12!, newAfter12: after12!, newVeryClean: veryClean!, newClean: clean!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

extension OwnProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            ownProfilePictureButton.setImage(image, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
