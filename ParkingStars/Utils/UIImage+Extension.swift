//
//  UIImage+Extension.swift
//  ParkingStars
//
//  Created by Marcin Mucha on 23/10/2019.
//  Copyright © 2019 STP. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    static func make(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.opaque = true
        let renderer = UIGraphicsImageRenderer(size: size, format: format)
        return renderer.image { _ in
            color.setFill()
            let rect = CGRect(origin: .zero, size: size)
            UIRectFill(rect)
        }
    }
}
