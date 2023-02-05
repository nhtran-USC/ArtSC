//
//  ArtViewController.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import UIKit

class ArtViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
}


extension ArtViewController: UICollectionViewDelegate {
    
}

extension ArtViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let posts = ArtService.shared.artResponse?.posts else {
            return 0
        }
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "artCell", for: indexPath) as! ArtCell
        guard let posts = ArtService.shared.artResponse?.posts else {
            return cell
        }
        cell.update(art: posts[indexPath.row])
        return cell
    }
    
    
}
