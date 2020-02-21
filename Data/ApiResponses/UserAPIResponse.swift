//
//  User.swift
//  ExempleProjRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 12/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

struct UserAPIResponse: Codable {
    let email: String
    let age: Int
    let birthday: Date
    
}



extension UserAPIResponse {

    func map() -> UserResponse {

        return UserResponse(email: self.email)

    }
}
