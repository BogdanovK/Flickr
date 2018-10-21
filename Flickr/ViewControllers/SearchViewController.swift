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
    
    override func loadView() {
        super.loadView()

        
    }
    
    
    
    // Когда может вызываться несколько раз viewDidLoad ?
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let newView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        newView.backgroundColor = UIColor.green
        newView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(newView)
        
        
        NSLayoutConstraint.activate([
            newView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            newView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 45),
            newView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -45),
            newView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
            ])
        
        self.view.backgroundColor = UIColor.gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
//
//    override func didReceiveMemoryWarning() {
//
//    }
    
    
//MARK: TabBarSetupProtocol
    
    func setupTapBarParameters() {
        self.tabBarItem.title = kSearchButtonTitle
    }
}

