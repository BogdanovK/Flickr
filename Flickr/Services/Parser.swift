//
//  Parser.swift
//  Flickr
//
//  Created by Константин Богданов on 13.02.2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import Foundation

class Parser {
    static func parseToPathModels(data: Data) -> [ImagePathModel] {
        do {
            let response = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
            
            var models: [ImagePathModel] = []
            if let json = response?["photos"] as? [String : Any] {
                if let photos = json["photo"] as? [[String : Any]] {
                    for dictionary in photos  {
                        if let title = dictionary["title"] as? String, let urlMedium = dictionary["url_m"] as? String, let urlSquare = dictionary["url_sq"] as? String {
                            models.append(ImagePathModel(name: title, descript: "", urlSquare: urlSquare, urlMedium: urlMedium))
                        }
                    }
                }
                
            }

            return models
            
        } catch {
            return []
        }
    }
}
