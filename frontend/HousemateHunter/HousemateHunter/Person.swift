//
//  Person.swift
//  HousemateHunter
//
//  Created by Morgan Belous on 4/26/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import Foundation
import UIKit

struct Person {
    
    var name: String
    var netid: String
    var grad_year: String
    var age: Int
    var gender: String
    var sleep_time: String
    var cleanliness: String
    var min_price: Int
    var max_price: Int
    var bio: String
    var fun_fact: String
    var email: String
    var phone: String
    var profile_pic: UIImage
    

    init(name: String, netid: String, grad_year: String, age: Int, gender: String, sleep_time: String, cleanliness: String, min_price: Int, max_price: Int, bio: String, fun_fact: String, email: String, phone: String, profile_pic: UIImage){
        self.name = name
        self.netid = netid
        self.age = age
        self.profile_pic = profile_pic
        self.gender = gender
        self.grad_year = grad_year
        self.bio = bio
        self.fun_fact = fun_fact
        self.max_price = max_price
        self.min_price = min_price
        self.sleep_time = sleep_time
        self.cleanliness = cleanliness
        self.phone = phone
        self.email = email
    }
}

//struct PersonDataResponse: Codable {
//    var users: [Person]
//}
//
//struct PersonResponse: Codable{
//    var data: PersonDataResponse
//}
