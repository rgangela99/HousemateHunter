//
//  Person.swift
//  HousemateHunter
//
//  Created by Morgan Belous on 4/26/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import Foundation
import UIKit

struct Person: Codable {
    
    var name: String
    var profile_pic: String
    var gender: String
    var grad_year: String
    var bio: String
    var fun_fact: String
    var price_max: Int
    var price_min: Int
    var sleep_time: String
    var cleanliness: String
    var phone: String
    var email: String
    
    
    init(name: String, profile_pic: String, gender: String, grad_year: String, bio: String, fun_fact: String, price_max: Int, price_min: Int, sleep_time: String, cleanliness: String, phone: String, email: String){
        self.name = name
        self.profile_pic = profile_pic
        self.gender = gender
        self.grad_year = grad_year
        self.bio = bio
        self.fun_fact = fun_fact
        self.price_max = price_max
        self.price_min = price_min
        self.sleep_time = sleep_time
        self.cleanliness = cleanliness
        self.phone = phone
        self.email = email
    }
}

struct PersonDataResponse: Codable {
    var users: [Person]
}

struct PersonResponse: Codable{
    var data: PersonDataResponse
}
