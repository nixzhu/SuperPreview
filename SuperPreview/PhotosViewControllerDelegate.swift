//
//  PhotosViewControllerDelegate.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

public protocol PhotosViewControllerDelegate: class {

    func photosViewController(_ vc: PhotosViewController, referenceForPhoto photo: Photo) -> Reference?
    func photosViewController(_ vc: PhotosViewController, didNavigateToPhoto photo: Photo, atIndex index: Int)
    func photosViewControllerWillDismiss(_ vc: PhotosViewController)
    func photosViewControllerDidDismiss(_ vc: PhotosViewController)
}
