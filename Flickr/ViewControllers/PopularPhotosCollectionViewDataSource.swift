//
//  PopularPhotosCollectionViewDataSource.swift
//  Flickr
//
//  Created by Kozaderov Ivan on 04/04/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class PopularPhotosCollectionViewDataSource: NSObject,UICollectionViewDataSource{

    var models: [ImageModel] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return models.count;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = models[indexPath.row]
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell
        
        if  cell == nil {
            cell = CollectionViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }

        cell?.photoImageView.image = model.image
        cell?.setNeedsUpdateConstraints()
        return cell!
    }
    
}
