//
//  ImageModel.swift
//  FlickerSearch
//
//  Created by Vishal on 8/8/20.
//  Copyright © 2020 Andes Infotech. All rights reserved.
//

import Foundation
import UIKit

struct ImageModel {

    let imageURL: String
    
    init(withPhotos photo: FlickrPhoto) {
        imageURL = photo.imageURL
    }
}
