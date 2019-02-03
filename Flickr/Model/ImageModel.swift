//
//  ImageModel.swift
//  Flickr
//
//  Created by Константин Богданов on 03.02.2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class ImageModel: NSObject {

    let descript: String
    let name: String
    let image: UIImage
    
    init(image: UIImage, name: String, description: String) {
        self.descript = description
        self.name = name
        self.image = image
        super.init()
    }
    
}
