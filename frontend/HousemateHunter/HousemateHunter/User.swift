//
//  User.swift
//  HousemateHunter
//
//  Created by Kristina Liu on 4/30/19.
//  Copyright © 2019 Kristina Liu. All rights reserved.
//

import Foundation
import UIKit

class User {
    var userName: String
    var userProfileImage: UIImage
    var userGender: String
    var userBio: String
    var userFunFact: String
    var userPriceMax: Int
    var userPriceMin: Int
    var userMale: Bool
    var userFemale: Bool
    var before12: Bool
    var around12: Bool
    var after12: Bool
    var veryClean: Bool
    var clean: Bool
    
    init(userName: String, userProfileImage: UIImage, userGender: String, userBio: String, userFunFact: String, userPriceMax: Int, userPriceMin: Int, userMale: Bool, userFemale: Bool, before12: Bool, around12: Bool, after12: Bool, veryClean: Bool, clean: Bool){
        self.userName = userName
        self.userProfileImage = userProfileImage
        self.userGender = userGender
        self.userBio = userBio
        self.userFunFact = userFunFact
        self.userPriceMax = userPriceMax
        self.userPriceMin = userPriceMin
        self.userMale = userMale
        self.userFemale = userFemale
        self.before12 = before12
        self.around12 = around12
        self.after12 = after12
        self.veryClean = veryClean
        self.clean = clean
    }
    
}
