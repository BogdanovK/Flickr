//
//  SettingsCell.swift
//  Flickr
//
//  Created by Kozaderov Ivan on 14/12/2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    static let settingsCellIdentifier = "settingsCellIdentifier"
    
    let settingsCellLabel = UILabel()
    let settingsCellImage = UIImageView()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.settingsCellLabel.translatesAutoresizingMaskIntoConstraints = false
        self.settingsCellImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.settingsCellLabel)
        self.contentView.addSubview(self.settingsCellImage)
        self.selectionStyle = .none
        self.createConstraints()
    }
    
    func createConstraints() {
        self.settingsCellLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.settingsCellLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        self.settingsCellLabel.trailingAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: -10).isActive = true
        self.settingsCellLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
        
        self.settingsCellImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        self.settingsCellImage.leadingAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 10).isActive = true
        self.settingsCellImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        self.settingsCellImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
}
