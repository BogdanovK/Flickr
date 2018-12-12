//
//  TabBarViewController.swift
//  Flickr
//
//  Created by Krasnovid Filipp on 09.10.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

protocol TabBarSetupProtocol: class {
    func setupTapBarParameters()
}

class TabBarViewController: UIViewController {
    
    var bottomTabBar: UITabBarController = UITabBarController()
    
    var popularPhotosController = PopularPhotosViewController()
    var savedPhotosController = SavedPhotosViewController()
    var searchController = SearchViewController()
    var settingsController = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        setupUI()
    }
    
    func setupUI() {
        self.view .addSubview(bottomTabBar.view)
        setupTabBar()
    }
    
    func setupTabBar() {
        let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
        let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor : selectedColor], for: .selected)
    }
    
    func setupControllers() {
        bottomTabBar.viewControllers = [popularPhotosController, savedPhotosController, searchController, settingsController]
        for case let vc as TabBarSetupProtocol in bottomTabBar.viewControllers! {
            vc.setupTapBarParameters()
        }
    }
    
}
