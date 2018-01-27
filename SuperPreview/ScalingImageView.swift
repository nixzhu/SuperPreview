//
//  ScalingImageView.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

import UIKit

class ScalingImageView: UIScrollView {

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()

    var image: UIImage? {
        didSet {
            image.flatMap { setup(with: $0) }
        }
    }

    var mode: PhotoDisplayMode = .normal

    var isLongImage: Bool {
        guard let realImageSize = realImageSize else { return false }
        return realImageSize.height > bounds.height
    }

    private var realImageSize: CGSize?

    // MARK: Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.bouncesZoom = true
        self.decelerationRate = UIScrollViewDecelerationRateFast
        self.addSubview(imageView)
        self.clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setup(with image: UIImage) {
        update(with: image)
    }

    private func update(with image: UIImage) {
        imageView.transform = CGAffineTransform.identity
        imageView.image = image
        realImageSize = image.size

        if mode == .longImagefullScreen {
            let imageRatio = image.size.height / image.size.width
            if imageRatio > bounds.height / bounds.width {
                realImageSize = CGSize(width: bounds.width, height: bounds.width * imageRatio)
            }
        }

        imageView.frame = CGRect(origin: CGPoint.zero, size: realImageSize!)
        contentSize = realImageSize!
        updateZoomScale(with: image)
        centerContent()
    }

    private func updateZoomScale(with image: UIImage) {
        let scrollViewFrame = bounds
        let imageSize = realImageSize ?? image.size
        let widthScale = scrollViewFrame.width / imageSize.width
        let heightScale = scrollViewFrame.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        minimumZoomScale = minScale
        maximumZoomScale = minScale * 4
        if (imageSize.height / imageSize.width) > (scrollViewFrame.height / scrollViewFrame.width) {
            if mode == .longImagefullScreen {
                minimumZoomScale = 1
            }
            maximumZoomScale = max(maximumZoomScale, widthScale)
        }
        zoomScale = minimumZoomScale
        panGestureRecognizer.isEnabled = mode == .longImagefullScreen
    }

    private func centerContent() {
        var horizontalInset: CGFloat = 0
        var verticalInset: CGFloat = 0
        if contentSize.width < bounds.width {
            horizontalInset = (bounds.width - contentSize.width) * 0.5
        }
        if contentSize.height < bounds.height {
            verticalInset = (bounds.height - contentSize.height) * 0.5
        }
        if let scale = window?.screen.scale, scale < 2 {
            horizontalInset = floor(horizontalInset)
            verticalInset = floor(verticalInset)
        }
        contentInset = UIEdgeInsets(top: verticalInset, left: horizontalInset, bottom: verticalInset, right: horizontalInset)
    }
}
