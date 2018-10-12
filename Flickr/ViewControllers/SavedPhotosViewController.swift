//
//  SavedPhotosViewController.swift
//  Flickr
//
//  Created by Константин Богданов on 07.10.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

/**
 Контроллер отображения сохраненных картинок.
 */

class SavedPhotosViewController: UIViewController, TabBarSetupProtocol{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brown
    }
    
//MARK: TabBarSetupProtocol
    
    func setupTapBarParameters() {
        self.tabBarItem.title = kSavedPhotosButtonTitle
    }
}
