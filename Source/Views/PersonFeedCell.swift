//
//  PersonFeedCell.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 10/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class PersonFeedCell: UITableViewCell {

    @IBOutlet weak var lineHiderView: UIView!
    @IBOutlet weak var titleIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    func config(with event: PersonFeedEvent) {
        lineHiderView.isHidden = !event.isTopCell
        titleIcon.image = event.titleImage
        titleLabel.text = event.titleText
        descLabel.text = event.descText
        timeLabel.text = event.timeText
    }

}
