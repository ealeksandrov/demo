//
//  PersonFeedCell.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 10/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class PersonFeedCell: UITableViewCell {

    static let lipsum = """
        Sequi delectus sapiente est numquam corrupti enim veniam. Ut ratione non ad sunt magni. Delectus beatae porro voluptatum praesentium ut autem. Nihil officiis corrupti qui in autem. Sapiente fugit impedit veniam quos sit mollitia quia.
        """

    @IBOutlet weak var lineHiderView: UIView!
    @IBOutlet weak var titleIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    func config(for index: Int) {
        lineHiderView.isHidden = index != 0

        titleIcon.image = index % 2 == 0 ? UIImage(named: "plane") : UIImage(named: "bus")

        let words = PersonFeedCell.lipsum.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        titleLabel.text = words[Int(arc4random_uniform(UInt32(words.count)))].capitalized
        descLabel.text = words.dropLast(Int(arc4random_uniform(UInt32(words.count - 5)))).joined(separator: " ")
    }

}
