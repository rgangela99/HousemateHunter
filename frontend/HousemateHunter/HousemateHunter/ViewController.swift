//
//  ViewController.swift
//  HousemateHunter
//
//  Created by Morgan Belous on 4/26/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import UIKit

protocol ChangeUserInformationDelegate: class {
    func userInformationChanged(to newName: String, newProfileImage: UIImage, newFunFact: String, newBio: String, newMax: Int, newMin: Int, newMale: Bool, newFemale: Bool, newBefore12: Bool, newAround12: Bool, newAfter12: Bool, newVeryClean: Bool, newClean: Bool)
}

class ViewController: UIViewController {
    
    var peopleCollectionView: UICollectionView!
    var personArray = [Person]()
    var filteredPersonArray = [Person]()
    var ownProfileButton: UIButton!
    var searchBar: UISearchBar!
    var isSearching: Bool! = false
    var matchButton: UIButton!
    
    
    let peopleReuseIdentifier = "peopleReuseIdentifier"
    let user = User(userName: "Enter Name", userProfileImage: UIImage(named: "blankIcon.png")!, userGender: "Female/Male", userBio: "ie. Hometown, Major, Industry", userFunFact: "ie. Hobbies & Interests", userPriceMax: 0, userPriceMin: 0, userMale: true, userFemale: true, before12: true, around12: true, after12: true, veryClean: true, clean: true)
    
    let padding: CGFloat = 8
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Housemates"
        view.backgroundColor = .white
        
        //let tim = Person(theirName: "Tim", theirProfileImage: UIImage(named: "tim.png")!, theirGender: "Male", theirGraduationYear: "2022", theirBio: "Tim's Bio", theirFunFact: "Tim's fun fact", theirPriceMax: 6000, theirPriceMin: 2000, theirSleep: "Before 12am", theirCleanliness: "Very clean", theirPhoneNumber: "123-342-1244", theirEmail: "tim@cornell.com")
//        let julia = Person(name: "Julia", gender: "Female", graduationYear: "2021" )
//        let amanda = Person(name: "Amanda", gender: "Female", graduationYear: "2018")
//        let jake = Person(name: "Jake", gender: "Male", graduationYear: "2017")
//        let hannah = Person(name: "Hannah", gender: "Female", graduationYear: "2014")
//        let will = Person(name: "Will", gender: "Male", graduationYear: "2018")
//        let ben = Person(name: "Ben", gender: "Male", graduationYear: "2019")
//        let ava = Person(name: "Ava", gender: "Female", graduationYear: "2022")
//        let arianna = Person(name: "Arianna", gender: "Female", graduationYear: "2023")
        
        //personArray = [tim, julia, amanda, jake, hannah, will, ben, ava, arianna]
        //personArray = [tim]
        //personArray.sort{$0.theirName < $1.theirName}
        
        //filteredPersonArray = personArray
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        
        searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "Search by name or year"
        let searchBarText = searchBar.value(forKey: "searchField") as? UITextField
        searchBarText?.backgroundColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        searchBar.delegate = self
        view.addSubview(searchBar)
        
        
        
        peopleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        peopleCollectionView.translatesAutoresizingMaskIntoConstraints = false
        peopleCollectionView.backgroundColor = .white
        peopleCollectionView.dataSource = self
        peopleCollectionView.delegate = self
        peopleCollectionView.register(PeopleCollectionViewCell.self, forCellWithReuseIdentifier: peopleReuseIdentifier)
        view.addSubview(peopleCollectionView)
        
        
        ownProfileButton = UIButton()
        ownProfileButton.translatesAutoresizingMaskIntoConstraints = false
        ownProfileButton.setImage(user.userProfileImage, for: .normal)
        ownProfileButton.backgroundColor = .white
        ownProfileButton.layer.cornerRadius = 38
        ownProfileButton.clipsToBounds = true
        ownProfileButton.addTarget(self, action: #selector(presentOwnProfile), for: .touchUpInside)
        view.addSubview(ownProfileButton)
        
        matchButton = UIButton()
        matchButton.translatesAutoresizingMaskIntoConstraints = false
        matchButton.setTitle("Match Me!", for: .normal)
        matchButton.setTitleColor(.white, for: .normal)
        matchButton.backgroundColor = UIColor(red: 73/255, green: 128/255, blue: 233/255, alpha: 1.0)
        matchButton.layer.cornerRadius = 10
        matchButton.clipsToBounds = true
        view.addSubview(matchButton)
    
    
        setupConstraints()
        getPeople()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
            
            ])
        
        NSLayoutConstraint.activate([
            peopleCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            peopleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            peopleCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            peopleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            ownProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ownProfileButton.heightAnchor.constraint(equalToConstant: 76),
            ownProfileButton.widthAnchor.constraint(equalToConstant: 76),
            ownProfileButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5)
            ])
        
        NSLayoutConstraint.activate([
            matchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            matchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            matchButton.widthAnchor.constraint(equalToConstant: 100),
            matchButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        
    }
    
    func getPeople(){
        NetworkManager.getPeople { filteredPersonArray in
            self.filteredPersonArray = filteredPersonArray
            DispatchQueue.main.async {
                self.peopleCollectionView.reloadData()
            }
        }
    }
    
    
    @objc func pushProfileViewController() {
        if let indexPath = self.peopleCollectionView.indexPathsForSelectedItems?.first{
            let person = personArray[indexPath.row]
            let profileViewController = ProfileViewController(placeHolderTheirUserName: person.name, placeHolderTheirProfileImageData: person.profile_pic, placeHolderTheirGender: person.gender, placeHolderTheirBio: person.bio, placeHolderTheirFunFact: person.fun_fact, placeHolderTheirPriceMin: person.price_min, placeHolderTheirPriceMax: person.price_max, placeHolderTheirSleep: person.sleep_time, placeHolderTheirCleanliness: person.cleanliness, placeHolderTheirPhoneNumber: person.phone, placeHolderTheirEmail: person.email)
            navigationController?.pushViewController(profileViewController, animated: true)
        }
        
    }
    
    
    @objc func presentOwnProfile(){
        let ownProfileViewController = OwnProfileViewController(placeHolderUserName: user.userName, placeHolderProfileImage: user.userProfileImage, placeHolderUserBio: user.userBio, placeHolderUserFunFact: user.userFunFact, placeHolderPriceMax: user.userPriceMax, placeHolderPriceMin: user.userPriceMin, uncheckedMale: user.userMale, uncheckedFemale: user.userFemale, uncheckedBefore12: user.before12, uncheckedAround12: user.around12, uncheckedAfter12: user.after12, uncheckedVeryClean: user.veryClean, uncheckedClean: user.clean)
        ownProfileViewController.delegate = self
        present(ownProfileViewController, animated: true, completion: nil)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isSearching {
            return filteredPersonArray.count
        }
        return personArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: peopleReuseIdentifier, for: indexPath) as! PeopleCollectionViewCell
        if isSearching {
            let person = filteredPersonArray[indexPath.item]
            cell.configure(for: person)
            return cell
        }else {
            let person = personArray[indexPath.item]
            cell.configure(for: person)
            return cell
        }
        
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushProfileViewController()
        
        
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 3 * padding) / 2
        let length = width * (10/9)
        return CGSize(width: width, height: length)
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredPersonArray.removeAll(keepingCapacity: false)
        let predicateString = searchBar.text!
        filteredPersonArray = personArray.filter({$0.name.range(of: predicateString) != nil || $0.grad_year.range(of: predicateString) != nil})
        filteredPersonArray.sort{$0.name < $1.name}
        isSearching = (filteredPersonArray.count == 0) ? false: true
        peopleCollectionView.reloadData()
    }
    
    
}

extension ViewController: ChangeUserInformationDelegate {
    func userInformationChanged(to newName: String, newProfileImage: UIImage, newFunFact: String, newBio: String, newMax: Int, newMin: Int, newMale: Bool, newFemale: Bool, newBefore12: Bool, newAround12: Bool, newAfter12: Bool, newVeryClean: Bool, newClean: Bool) {
        user.userName = newName
        user.userProfileImage = newProfileImage
        user.userFunFact = newFunFact
        user.userBio = newBio
        user.userPriceMax = newMax
        user.userPriceMin = newMin
        user.userMale = newMale
        user.userFemale = newFemale
        user.before12 = newBefore12
        user.around12 = newAround12
        user.after12 = newAfter12
        user.veryClean = newVeryClean
        user.clean = newClean
        
        ownProfileButton.setImage(newProfileImage, for: .normal)
    }
    
}


