//
//  Config.swift
//  SuperPreview
//
//  Created by NIX on 2016/11/28.
//  Copyright © 2016年 nixWork. All rights reserved.
//

import UIKit

final public class Config {

    public static var bottomBarHeight: CGFloat?
    public static var animationDurationWithZooming: TimeInterval?
    public static var animationDurationWithoutZooming: TimeInterval?
    public static var shareImageAction: ((_ image: UIImage, _ fromViewController: UIViewController) -> Void)?
}
