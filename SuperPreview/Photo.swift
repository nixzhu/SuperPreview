//
//  Photo.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

import Foundation

public protocol Photo: class {

    var image: UIImage? { get }
    var updatedImage: ((_ image: UIImage?) -> Void)? { get set }
}
