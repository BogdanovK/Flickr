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

    let collectionView:UICollectionView
    let delegateDataSource = CollectionViewDelegateDataSource()
    let flowLayout = UICollectionViewFlowLayout()
    required init?(coder aDecoder: NSCoder) {
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout:flowLayout)
        super.init(coder: aDecoder)
    }
    
    init() {
        self.collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout:flowLayout)
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        setupCollectionView()
    }
   
    func setupCollectionView() {
        self.collectionView.register(CollectionViewCell.classForCoder(), forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        self.collectionView.delegate = delegateDataSource
        self.collectionView.dataSource = delegateDataSource
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.backgroundColor = UIColor.cyan
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant:50),
            ])
    }
    
//MARK: TabBarSetupProtocol
    
    func setupTapBarParameters() {
        self.tabBarItem.title = Constants.popularPhotosButtonTitle
        self.tabBarItem.image = UIImage(named: "popular")
    }
}
