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
class SearchViewController: UIViewController, TabBarSetupProtocol, UITextFieldDelegate {

    private let searchBar = SearchBar(withCustomPlaceHolder: "Поиск фото...")
    private let searchService = PhotosSearchService()
    private var searchClosure = DispatchWorkItem {}
    
    let tableView:UITableView
    let tableHandler = SearchTableHandler()
    
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
        self.view.addSubview(self.searchBar)
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.searchBar.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant:5),
            self.searchBar.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant:-5),
            self.searchBar.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        self.searchBar.delegate = self
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.register(SearchCell.classForCoder(), forCellReuseIdentifier: SearchCell.reuseIdentifier)
        self.tableView.delegate = self.tableHandler
        self.tableView.dataSource = self.tableHandler
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.tableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant:50),
            ])
    }
    
//MARK: UITextFieldDelegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.startSearch(for: textField.text! + string)
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.startSearch(for: textField.text!)
        return true
    }
    
    func startSearch(for string: String) {
        self.searchClosure.cancel()
        if string.count < 2 {
            return
        }
        self.searchClosure = DispatchWorkItem {
            self.searchService.searchPhotos(for: string, onComplete: { photos in
                self.tableHandler.models = photos
                self.updateTable()
            })
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + MathematicConstants.delay, execute: self.searchClosure)
    }
    
    private func updateTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
//MARK: TabBarSetupProtocol
    
    func setupTapBarParameters() {
        self.tabBarItem.title = Constants.searchButtonTitle
        self.tabBarItem.image = UIImage(named: "search")
    }
}

