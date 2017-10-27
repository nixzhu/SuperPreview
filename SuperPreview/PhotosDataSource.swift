//
//  PhotosDataSource.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

import Foundation

class PhotosDataSource: NSObject {

    let photos: [Photo]

    private let _photos: NSArray

    init(photos: [Photo]) {
        self.photos = photos
        let _photos = NSMutableArray()
        for photo in photos {
            _photos.add(photo)
        }
        self._photos = _photos
    }
}

extension PhotosDataSource: PhotosViewControllerDataSource {

    var numberOfPhotos: Int {
        return photos.count
    }

    func photoAtIndex(_ index: Int) -> Photo? {
        if (index >= 0) && (index < numberOfPhotos) {
            return photos[index]
        }
        return nil
    }

    func indexOfPhoto(_ photo: Photo) -> Int {
        return _photos.index(of: photo)
    }

    func containsPhoto(_ photo: Photo) -> Bool {
        return _photos.contains(photo)
    }
}
