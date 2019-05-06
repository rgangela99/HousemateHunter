//
//  NetworkManager.swift
//  HousemateHunter
//
//  Created by Morgan Belous on 5/3/19.
//  Copyright © 2019 Morgan Belous. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    
    static func getPeople(completion: @escaping ([Person]) -> Void) {
        let endpoint = "https://housemate-hunter.herokuapp.com/api/users"
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let personResponse = try? jsonDecoder.decode(PersonResponse.self, from: data){
                    let users = personResponse.data.users
                    completion(users)
                } else {
                    print("Invalid response data")   
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
