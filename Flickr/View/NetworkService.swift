//
//  NetworkService.swift
//  Flickr
//
//  Created by Константин Богданов on 16.12.2018.
//  Copyright © 2018 Константин Богданов. All rights reserved.
//

import UIKit

class NetworkService: NSObject {

    static func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        
        let session = URLSession(configuration: .default)
        
        let dataTask = session.dataTask(with: url) { data, response, error in
         
            if let recivedData = data {
                
                let image = UIImage.init(data: recivedData)
                completion(image)
            }
        }
        dataTask.resume()
        
    }
}
