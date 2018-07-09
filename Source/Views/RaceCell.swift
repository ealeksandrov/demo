//
//  RaceCell.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 09/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class RaceCell: UITableViewCell {

    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.image = UIImage(named: "bitmap")?.rounded()
        }
    }

    func config(for index: Int) {
        bgImageView.image = UIImage(named: "unsplash-\(index % 4 + 1)")
    }

}
