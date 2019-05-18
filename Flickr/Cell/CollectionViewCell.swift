//
//  CollectionViewCell.swift
//  Flickr
//
//  Created by Kozaderov Ivan on 15/02/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "collectionCellIdentifier"
    
    var photoImageView = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.photoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.photoImageView.contentMode = UIView.ContentMode.scaleAspectFit
        self.contentView.addSubview(self.photoImageView)
        self.createConstraints()
    }
    
    func createConstraints() {
        self.photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        self.photoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
        self.photoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 5).isActive = true
        self.photoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 5).isActive = true
    }

}
