//
//  ImagePathModel.swift
//  Flickr
//
//  Created by Константин Богданов on 13.02.2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class ImagePathModel {
    let urlMedium: String
    let urlSquare: String
    let descript: String
    let name: String
    
    init(name: String, descript: String, urlSquare: String, urlMedium: String) {
        self.name = name
        self.descript = descript
        self.urlSquare = urlSquare
        self.urlMedium = urlMedium
    }
}
