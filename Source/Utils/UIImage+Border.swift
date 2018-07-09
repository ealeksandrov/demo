//
//  UIImage+Border.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 09/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

extension UIImage {
    func rounded() -> UIImage {
        let imageWidth = size.width
        let imageHeight = size.height

        let diameter = min(imageWidth, imageHeight)
        let isLandscape = imageWidth > imageHeight

        let xOffset = isLandscape ? (imageWidth - diameter) / 2 : 0
        let yOffset = isLandscape ? 0 : (imageHeight - diameter) / 2

        let imageSize = CGSize(width: diameter, height: diameter)

        return UIGraphicsImageRenderer(size: imageSize).image { _ in
            let ovalPath = UIBezierPath(ovalIn: CGRect(origin: .zero, size: imageSize))
            ovalPath.addClip()
            draw(at: CGPoint(x: -xOffset, y: -yOffset))
            UIColor.white.setStroke()
            ovalPath.lineWidth = 4
            ovalPath.stroke()
        }
    }
}
