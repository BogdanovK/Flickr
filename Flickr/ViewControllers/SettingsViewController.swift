//
//  SettingsViewController.swift
//  Flickr
//
//  Created by Константин Богданов on 03.10.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

/**
 Контроллер изменения настроек пользователя.
 */

class SettingsViewController: UIViewController, TabBarSetupProtocol, UITextFieldDelegate {
    
    let tableView:UITableView
    let searchBar = UITextField()

    required init?(coder aDecoder: NSCoder) {
        
     self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
     super.init(coder: aDecoder)
        
    }
    
    init() {
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(self.searchBar)
        
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.backgroundColor = UIColor.white
        self.searchBar.placeholder = "Поиск по настройкам"
        self.searchBar.delegate = self
        
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.searchBar.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 5),
            self.searchBar.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -5),
            self.searchBar.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    
//MARK: TabBarSetupProtocol
    
    func setupTapBarParameters() {
        self.tabBarItem.title = kSettingsButtonTitle
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
