//
//  OverlayActionView.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

import UIKit

class OverlayActionView: UIView {

    var shareAction: (() -> Void)?

    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.addTarget(self, action: #selector(OverlayActionView.share(_:)), for: .touchUpInside)
        return button
    }()

    override func draw(_ rect: CGRect) {
        let startColor: UIColor = UIColor.clear
        let endColor: UIColor = UIColor.black.withAlphaComponent(0.2)
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocations: [CGFloat] = [0.0, 1.0]
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: rect.height)
        context!.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        makeUI()
    }

    private func makeUI() {
        addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        let trailing = shareButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        let bottom = shareButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        NSLayoutConstraint.activate([trailing, bottom])
    }

    @objc fileprivate func share(_ sender: UIButton) {
        shareAction?()
    }
}
