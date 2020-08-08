//
//  FlickerPhoto.swift
//  FlickerSearch
//
//  Created by Vishal on 8/8/20.
//  Copyright © 2020 Andes Infotech. All rights reserved.
//

import Foundation


struct FlickrPhoto: Codable {
    
    let farm : Int
    let id : String
    
    let isfamily : Int
    let isfriend : Int
    let ispublic : Int
    
    let owner: String
    let secret : String
    let server : String
    let title: String
    
    var imageURL: String {
        let urlString = String(format: Constants.imageURL, farm, server, id, secret)
        return urlString
    }
}
