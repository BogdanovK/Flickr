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

class SettingsViewController: UIViewController, TabBarSetupProtocol {

    let tableView:UITableView
    let delegateDataSource = SettingsDelegateDataSource()
    
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
        self.view.backgroundColor = UIColor.green
        setupSearchBar()
        setupTableView()
    }
    
    
 //MARK:Search Bar setup
    
    func setupSearchBar() {

        if let searchBar = SearchBar.init(withCustomPlaceHolder: "Поиск в настройках") {
          
            searchBar.backgroundColor = UIColor.white
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            searchBar.layer.cornerRadius = 10
            searchBar.textAlignment = NSTextAlignment.center
            self.view.addSubview(searchBar)
            
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                searchBar.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant:5),
                searchBar.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant:-5),
                searchBar.heightAnchor.constraint(equalToConstant: 40)
                ])
        }
        
    }
    
    
    func setupTableView() {
        self.tableView.register(SettingsCell.classForCoder(), forCellReuseIdentifier: SettingsCell.settingsCellIdentifier)
        self.tableView.delegate = delegateDataSource
        self.tableView.dataSource = delegateDataSource
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.tableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant:50),
            ])
    }
    
//MARK: TabBarSetupProtocol
    
    func setupTapBarParameters() {
        self.tabBarItem.title = kSettingsButtonTitle
    }
}
