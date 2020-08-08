//
//  Photo.swift
//  FlickerSearch
//
//  Created by Vishal on 8/8/20.
//  Copyright © 2020 Andes Infotech. All rights reserved.
//

import Foundation
import UIKit

struct Photo: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [FlickrPhoto]
    let total: String
}
