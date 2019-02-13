//
//  PhotosSearchService.swift
//  Flickr
//
//  Created by Константин Богданов on 03.02.2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class PhotosSearchService: NSObject {
    let queue = DispatchQueue(label: "flick.photos.load.queue")
    let session = URLSession(configuration: .default)

    func searchPhotos(for tags: String, onComplete: @escaping ([ImageModel])-> Void) {
        self.loadData(url: API.searchURL(tags: tags, page: 1)) { data in
            if let pathData = data {
                let models = Parser.parseToPathModels(data: pathData)
                self.loadPhotos(models: models, onComplete: onComplete)
                return
            }
            onComplete([])
        }
    }
    
    private func loadPhotos(models: [ImagePathModel],onComplete: @escaping ([ImageModel])-> Void) {
        let group = DispatchGroup.init()
        var photos: [ImageModel] = []

        for model in models {
            group.enter()
            if let url = URL(string: model.urlSquare) {
                
                self.loadData(url: url) { data in
                    
                    if let imageData = data {
                        if let image = UIImage(data: imageData) {
                            photos.append(ImageModel(image: image, name: model.name, description: model.descript))
                        }
                    }
                    group.leave()
                }
                continue
            }
            group.leave()
        }
        group.notify(queue: self.queue, execute: {
            onComplete(photos)
        })
    }
    
    private func loadData(url: URL, onComplete: @escaping (Data?) -> Void) {
        let dataTask = self.session.dataTask(with: URLRequest(url: url)) { data, response, error in
            onComplete(data)
        }
        dataTask.resume()
    }
}
