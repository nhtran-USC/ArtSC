//
//  ArtCollectionViewCell.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/5/23.
//

import UIKit

class ArtCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var artImageView: UIImageView!
    
    @IBOutlet weak var userNameButton: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func update(art :Art) {
        let beginingOfSentence = art.image.lastIndex(of: "/")!
        let artName = art.image[beginingOfSentence...]
        
        artImageView.image = UIImage(named: String(artName))
        userNameButton.setTitle(art.username, for: .normal)
        descriptionLabel.text = art.description
        
    }
}
