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

    static func configureAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: StyleKit.Colors.darkText]
        UINavigationBar.appearance().tintColor = StyleKit.Colors.darkText
    }

}
