//
//  CategoryResponse.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import Foundation

class CategoryResponse:Decodable {
    
    var status: String
    var categories: [Category]
    
    init(status: String, categories: [Category]) {
        self.status = status
        self.categories = categories
    }
}
