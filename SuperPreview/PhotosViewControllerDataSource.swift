//
//  PhotosViewControllerDataSource.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

import Foundation

protocol PhotosViewControllerDataSource: class {

    var numberOfPhotos: Int { get }
    func photoAtIndex(_ index: Int) -> Photo?
    func indexOfPhoto(_ photo: Photo) -> Int
    func containsPhoto(_ photo: Photo) -> Bool
}
