//
//  FlickrAPI.swift
//  VirtualTourist
//
//  Created by Ahmad on 24/07/2019.
//  Copyright © 2019 ahmad. All rights reserved.
//

import Foundation

struct FlickrAPIConstent {
    
    struct constent {
        
        static let scheme = "https"
        static let host = "api.flickr.com"
        static let path = "/services/rest"
    }
    
    struct keys {
        static let apikey = "api_key"
        static let method = "method"
        static let BBox = "bbox"
        static let safe = "safe_search"
        static let Text = "text"
        static let page = "page"
        static let perPage = "per_page"
        static let format = "format"
        static let noJson = "nojsoncallback"
        
        static let Extras = "extras"
    }
    struct value {
        static let apivalue = "42d02a1c9e97c60828a2a6d5d4a60c47"
        static let serach = "flickr.photos.search"
        static let formatValue = "json"
        static let noJsonValue = "1"
        static let perPageValue = 20
        static let Url = "url_m"
        static let safeSearch = "1"
        static let GalleryPhotos = "flickr.galleries.getPhotos"
        
    }
    
}
