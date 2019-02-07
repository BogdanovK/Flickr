//
//  SearchCell.swift
//  Flickr
//
//  Created by Vio on 12.12.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    static let reuseIdentifier = "searchCellIdentifier"
    
    private let photoImageView = UIImageView()
    let descriptionLabel = UILabel()
    var photo: UIImage? { set {
            self.photoImageView.image = newValue
        }
        get {
            return self.photoImageView.image
        }
    }
    let likeButton = UIButton()
    var isLike = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.photoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.likeButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.photoImageView)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.likeButton)
        self.selectionStyle = .none
        self.descriptionLabel.numberOfLines = 0
        self.photoImageView.contentMode = UIView.ContentMode.scaleAspectFit
        
        let imageLike = UIImage.init(named: "like.png")
        self.likeButton.setImage(imageLike, for: .normal)
        self.likeButton.addTarget(self, action: #selector(doubleTapped), for: .touchUpInside)
        
        self.createConstraints()
        self.createGesture()
    }
    
    private func createGesture() {
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTapGesture.numberOfTapsRequired = 2
        self.photoImageView.addGestureRecognizer(doubleTapGesture)
        self.photoImageView.isUserInteractionEnabled = true
    }
    
    @objc func doubleTapped() {
        self.isLike = !self.isLike
    }
    
    fileprivate func createConstraints() {
        
        self.photoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        self.photoImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5).isActive = true
        self.photoImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5).isActive = true
        self.photoImageView.heightAnchor.constraint(equalTo: self.photoImageView.widthAnchor).isActive = true
        
        self.likeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.likeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.likeButton.topAnchor.constraint(equalTo: self.photoImageView.bottomAnchor, constant: 5).isActive = true
        self.likeButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 15).isActive = true
        
        self.descriptionLabel.topAnchor.constraint(equalTo: self.photoImageView.bottomAnchor, constant: 5).isActive = true
        self.descriptionLabel.leftAnchor.constraint(equalTo: self.likeButton.leftAnchor, constant: 55).isActive = true
        self.descriptionLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -5).isActive = true
        self.descriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.descriptionLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5).isActive = true
    }
}
