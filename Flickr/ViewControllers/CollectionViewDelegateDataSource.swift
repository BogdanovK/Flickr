//
//  CollectionViewDelegateDataSource.swift
//  Flickr
//
//  Created by Kozaderov Ivan on 15/02/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class CollectionViewDelegateDataSource: NSObject,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var models: [ImageModel] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = models[indexPath.row]
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell
        
        if  cell == nil {
            cell = CollectionViewCell()
        }
        
        cell?.photoImageView.image = model.image
        cell?.setNeedsUpdateConstraints()
        return cell!
    }
    

}
