//
//  User.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import Foundation

class User: Codable{
    var status: String
    var token: String
    var email: String
    var first_name: String
    var last_name: String
    var profile_photo: String
    
    
    init(status: String, token: String, email: String, first_name: String, last_name: String, profile_photo: String) {
        self.status = status
        self.token = token
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.profile_photo = profile_photo
    }
}
