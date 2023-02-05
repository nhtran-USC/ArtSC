//
//  ArtCell.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/5/23.
//

import UIKit

class ArtCell: UICollectionViewCell {
    @IBOutlet weak var artImageView: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func update(art :Art) {
//        let beginingOfSentence = art.image.lastIndex(of: "i")!
//        let artName = art.image[beginingOfSentence...]
        let internalURL = URL(string:"http://localhost:8000" + art.image)!
        let imageData = try! Data(contentsOf: internalURL)
        let image = UIImage(data: imageData)
        
        artImageView.image = image
        authorLabel.text = "Author: " + art.username
        descriptionLabel.text = "Description: "  + art.description
        
    }

}
