//
//  SearchViewController.swift
//  Flickr
//
//  Created by Константин Богданов on 03.10.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

/**
 Контроллер поиска картинок.
 */

class SearchViewController: UIViewController, TabBarSetupProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
    }
    
//MARK: TabBarSetupProtocol
    
    func setupTapBarParameters() {
        self.tabBarItem.title = Constants.searchButtonTitle
        self.tabBarItem.image = UIImage(named: "search")
    }
}


