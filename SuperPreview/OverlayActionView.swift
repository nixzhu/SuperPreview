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

    private lazy var toolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.setShadowImage(UIImage(), forToolbarPosition: .any)
        toolbar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        toolbar.backgroundColor = .clear
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(_:)))
        ]
        return toolbar
    }()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        makeUI()
    }

    private func makeUI() {
        addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        let views = [
            "toolbar": toolbar
        ]
        let constraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[toolbar]|", options: [], metrics: nil, views: views)
        let constraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:[toolbar]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activate(constraintsH)
        NSLayoutConstraint.activate(constraintsV)
    }

    @objc fileprivate func share(_ sender: UIButton) {
        shareAction?()
    }

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
}
