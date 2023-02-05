//
//  CategoryCell.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    func update(category: Category) {
        categoryLabel.text = category.display_name
//        backgroundColor = .systemBlue
        layer.cornerRadius = 50
        categoryLabel.textColor = UIColor.white
        categoryLabel.font = UIFont.boldSystemFont(ofSize: 19.0)
        categoryLabel.numberOfLines = 0
        
        
        
        let internalURL = URL(string:"http://localhost:8000" + category.default_pic)!
        let imageData = try! Data(contentsOf: internalURL)
        let image = UIImage(data: imageData)
        
        self.backgroundColor = UIColor(patternImage: image!)
//        if let filePath = Bundle.main.path(forResource: category.default_pic, ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
//            self.backgroundColor = UIColor(patternImage: image)
//        }
        
    }
}
