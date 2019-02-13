//
//  SearchDelegateDataSource.swift
//  Flickr
//
//  Created by Kozaderov Ivan on 07/02/2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class SearchDelegateDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseIdentifier, for: indexPath) as? SearchCell
        
        if  cell == nil {
            cell = SearchCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: SearchCell.reuseIdentifier)
        }
        
        cell?.descriptionLabel.text = "searchCellLabel"
        cell?.imageView?.image = nil
        cell?.setNeedsUpdateConstraints()
        return cell!
    }
    
}
