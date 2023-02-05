//
//  Art.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import Foundation
class Art:Decodable{
    init(image: String, description: String, username: String, category: Category) {
        self.image = image
        self.description = description
        self.username = username
        self.category = category
    }
    var imageNameOnly:String?
    var image: String
    var description: String
    var username:String
    var category:Category
}
