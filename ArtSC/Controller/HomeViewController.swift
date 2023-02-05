//
//  HomeViewController.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
}


extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let categories = CategoryService.shared.categoryResponse?.categories else {
            return
        }
        ArtService.shared.fetchArtReponseByCategory(id: categories[indexPath.row].id) {
            self.performSegue(withIdentifier: "homeToArtSegue", sender: nil)
            
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (CategoryService.shared.categoryResponse?.categories.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        guard let categories = CategoryService.shared.categoryResponse?.categories else {
            return cell
        }
        cell.update(category: categories[indexPath.row])
        return cell
    }
}

