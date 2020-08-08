//
//  Result.swift
//  FlickerSearch
//
//  Created by Vishal on 8/8/20.
//  Copyright © 2020 Andes Infotech. All rights reserved.
//

import Foundation


enum Result <T>{
    case Success(T)
    case Failure(String)
    case Error(String)
}
