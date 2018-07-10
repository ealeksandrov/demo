//
//  UIImage+Utils.swift
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

    func scaled(_ scale: CGFloat) -> UIImage {
        return imageWith(newSize: CGSize(width: size.width*scale, height: size.height*scale))
    }

    func imageWith(newSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size:newSize)
        let image = renderer.image{_ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
        }

        return image
    }

    func masked(maskImage: UIImage) -> UIImage? {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 2)
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        maskImage.draw(in: rect)
        context.setBlendMode(.sourceAtop)
        context.draw(cgImage!, in: rect)

        return UIGraphicsGetImageFromCurrentImageContext()
    }

    convenience init?(size: CGSize, fromColor: UIColor, toColor: UIColor) {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        defer { UIGraphicsEndImageContext() }

        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        guard let gradient = CGGradient(colorSpace: CGColorSpaceCreateDeviceRGB(),
                                        colorComponents: [fromColor, toColor].compactMap { $0.cgColor.components }.flatMap { $0 },
                                        locations: [0, 1], count: 2) else { return nil }

        context.drawLinearGradient(gradient, start: CGPoint.zero, end: CGPoint(x: 0, y: size.height), options: CGGradientDrawingOptions())
        guard let image = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else { return nil }
        self.init(cgImage: image)
    }
}
