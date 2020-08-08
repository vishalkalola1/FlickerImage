//
//  ImageCache.swift
//  FlickerSearch
//
//  Created by Vishal on 8/8/20.
//  Copyright © 2020 Andes Infotech. All rights reserved.
//

import Foundation
import UIKit

class ImageCache: NSObject {

    static let shared = ImageCache()
    
    private(set) var cache: NSCache<AnyObject, AnyObject> = NSCache()
    
    func getImageFromCache(key: String) -> UIImage? {
        if (self.cache.object(forKey: key as AnyObject) != nil) {
            return self.cache.object(forKey: key as AnyObject) as? UIImage
        } else {
            return nil
        }
    }
    
    func saveImageToCache(key: String, image: UIImage) {
        self.cache.setObject(image, forKey: key as AnyObject)
    }
    
}
