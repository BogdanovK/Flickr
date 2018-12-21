//
//  SettingsDelegateDataSource.swift
//  Flickr
//
//  Created by Kozaderov Ivan on 14/12/2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

class SettingsDelegateDataSource: NSObject,UITableViewDataSource,UITableViewDelegate {

    let urlString = "https://mir24.tv/uploaded/images/2017/December/dc976ec848368fe8ca7f5212316fc7f438c802d421b410d6ade1da7d6fa41ace.jpg"
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier:  SettingsCell.settingsCellIdentifier, for: indexPath) as? SettingsCell
        
        if  cell == nil {
            cell = SettingsCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: SettingsCell.settingsCellIdentifier)
        }
        
        cell?.settingsCellLabel.text = "settingsCellLabel"
        cell?.setNeedsUpdateConstraints()
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let currentCell:SettingsCell? = tableView.cellForRow(at: indexPath) as? SettingsCell
        
        if let cell = currentCell {
            
            let url = URL.init(string: urlString)
            let session = URLSession.init(configuration: .default)
            let task = session.dataTask(with: url!) { (data,response, error) -> Void in
                
                if let receivedData = data {
                    DispatchQueue.main.async {
                    let image = UIImage.init(data: receivedData)
                    cell.settingsCellImage.image = image
                  }
                    
                }
            }
            task.resume()
            
        }
        
    }
    
    
    
}
