//
//  FlickerViewModel.swift
//  FlickerSearch
//
//  Created by Vishal on 8/8/20.
//  Copyright © 2020 Andes Infotech. All rights reserved.
//

import UIKit

class FlickrViewModel: NSObject {

    private(set) var photoArray = [FlickrPhoto]()
    private var searchText = ""
    private var pageNo = 1
    private var totalPageNo = 1
    
    var showAlert: ((String) -> Void)?
    var dataUpdated: (() -> Void)?
    
    func search(text: String, completion:@escaping () -> Void) {
        searchText = text
        photoArray.removeAll()
        fetchResults(completion: completion)
    }
    
    private func fetchResults(completion:@escaping () -> Void) {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        SearchService().request(searchText, pageNo: pageNo) { (result) in
        
            Thread.runOnMainThread {
            
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                switch result {
                case .Success(let results):
                    if let result = results {
                        self.totalPageNo = result.pages
                        self.photoArray.append(contentsOf: result.photo)
                        self.dataUpdated?()
                    }
                    completion()
                case .Failure(let message):
                    self.showAlert?(message)
                    completion()
                case .Error(let error):
                    if self.pageNo > 1 {
                        self.showAlert?(error)
                    }
                    completion()
                }
            }
        }
    }
    
    func fetchNextPage(completion:@escaping () -> Void) {
        if pageNo < totalPageNo {
            pageNo += 1
            fetchResults {
                completion()
            }
        } else {
            completion()
        }
    }
}
