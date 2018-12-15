//
//  PopularPhotosViewController.swift
//  Flickr
//
//  Created by Константин Богданов on 07.10.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

/**
 Контроллер отображения популярных картинок.
 */

class PopularPhotosViewController: UIViewController, TabBarSetupProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }
    
//MARK: TabBarSetupProtocol
    
    func setupTapBarParameters() {
        self.tabBarItem.title = Constants.popularPhotosButtonTitle
        self.tabBarItem.image = UIImage(named: "popular")
    }
}
