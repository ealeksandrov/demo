//
//  StyleKit.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 09/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

enum StyleKit {
    enum Colors {
        static let darkText = UIColor(white: 51.0/255, alpha: 1)
    }

    enum BarButtons {
        static var searchButton: UIBarButtonItem {
            let button = UIButton()
            button.setImage(UIImage(named: "search"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
            return UIBarButtonItem(customView: button)
        }
    }

    enum CustomImages {
        static var mapPin: UIImage {
            let original = UIImage(named: "shape")!.scaled(1.5)
            let topColor = UIColor(red: 25.0/255, green: 110.0/255, blue: 195.0/255, alpha: 1)
            let bottomColor = UIColor(red: 35.0/255, green: 185.0/255, blue: 110.0/255, alpha: 1)
            let gradientImage = UIImage(size: original.size, fromColor: topColor, toColor: bottomColor)!

            return gradientImage.masked(maskImage: original)!
        }
    }

    static func configureAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: StyleKit.Colors.darkText]
        UINavigationBar.appearance().tintColor = StyleKit.Colors.darkText

        let backImage = UIImage(named: "back")
        UINavigationBar.appearance().backIndicatorImage = backImage
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = backImage
    }

}
