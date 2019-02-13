//
//  API.swift
//  Flickr
//
//  Created by Константин Богданов on 13.02.2019.
//  Copyright © 2019 Константин Богданов. All rights reserved.
//

import UIKit

class API: NSObject {
    static let basePath = "https://api.flickr.com/services/rest/"
    static let searchMethod = "flickr.photos.search"
    static let apiKey = "dab4052df3cc23ed39745a8cca163e0a"
    static let perPage: UInt = 50
    static func searchURL(tags: String, page: UInt) -> URL {
        var components = URLComponents(string: self.basePath)
        let method = URLQueryItem(name: "method", value: self.searchMethod)
        let apiKey = URLQueryItem(name: "api_key", value: self.apiKey)
        let allTags = URLQueryItem(name: "tags", value:tags)
        let tagMode = URLQueryItem(name: "tag_mode", value:"all")
        let perpage = URLQueryItem(name: "per_page", value:"\(self.perPage)")
        let pageNum = URLQueryItem(name: "page", value:"\(page)");
        let format = URLQueryItem(name: "format", value:"json")
        let imgFormat = URLQueryItem(name: "extras", value:"url_sq,url_m")
        let noCallBack = URLQueryItem(name: "nojsoncallback", value:"1")
        let safeMode = URLQueryItem(name: "safe_search", value:"1")
        
        let items = [method, apiKey, allTags, tagMode, perpage, pageNum, format, imgFormat, noCallBack, safeMode]
        
        components?.queryItems = items
        
        return components?.url ?? URL(fileURLWithPath: "")
    }
}
