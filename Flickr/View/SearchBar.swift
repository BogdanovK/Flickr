//
//  SearchBar.swift
//  Flickr
//
//  Created by Vio on 23.10.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

/**
 Бар поиска
 */

class SearchBar: UITextField {
    
    var customPlaceHolder: String?
    
    init(withCustomPlaceHolder: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        self.placeholder = withCustomPlaceHolder
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
