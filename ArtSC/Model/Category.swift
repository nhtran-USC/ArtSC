//
//  Category.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import Foundation
class Category:Decodable {
    var text:String
    var display_name:String
    var id:Int
    var default_pic:String
    
    init(text: String, display_name: String, id: Int, default_pic: String) {
        self.text = text
        self.display_name = display_name
        self.id = id
        self.default_pic = default_pic
    }
}
