//
//  Reference.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

import UIKit

public struct Reference {

    let view: UIView
    public let image: UIImage?

    var imageView: UIImageView {
        let imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        return imageView
    }

    public init(view: UIView, image: UIImage?) {
        self.view = view
        self.image = image
    }
}
