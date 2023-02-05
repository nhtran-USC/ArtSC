//
//  ArtResponse.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import Foundation

class ArtResponse :Decodable {
    init(status: String, posts: [Art]) {
        self.status = status
        self.posts = posts
    }
    

    var status:String
    var posts:[Art]
    
}
