//
//  PersonHeaderView.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 10/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class PersonHeaderView: UIView {

    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.image = UIImage(named: "bitmap")?.rounded()
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

}
