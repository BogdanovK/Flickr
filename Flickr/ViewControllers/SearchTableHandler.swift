//
//  SearchTableHandler.swift
//  Flickr
//
//  Created by Kozaderov Ivan on 07/02/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class SearchTableHandler: NSObject, UITableViewDataSource,UITableViewDelegate {

    var models: [ImageModel] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseIdentifier, for: indexPath) as? SearchCell
        
        if  cell == nil {
            cell = SearchCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: SearchCell.reuseIdentifier)
        }
        
        cell?.descriptionLabel.text = model.name
        cell?.photo = model.image
        cell?.setNeedsUpdateConstraints()
        return cell!
    }
    
}
