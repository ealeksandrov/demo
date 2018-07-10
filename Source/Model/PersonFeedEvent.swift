//
//  PersonFeedEvent.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 10/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class PersonFeedEvent {

    private static let lipsum = """
        Sequi delectus sapiente est numquam corrupti enim veniam. Ut ratione non ad sunt magni. Delectus beatae porro voluptatum praesentium ut autem. Nihil officiis corrupti qui in autem. Sapiente fugit impedit veniam quos sit mollitia quia.
        """
    private static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .none
        df.timeStyle = .short
        return df
    }()

    var isTopCell: Bool
    var titleImage: UIImage
    var titleText: String
    var descText: String
    var timeText: String

    init(for index: Int) {
        isTopCell = index == 0
        titleImage = index % 2 == 0 ? UIImage(named: "plane")! : UIImage(named: "bus")!

        let words = PersonFeedEvent.lipsum.components(separatedBy: CharacterSet.whitespacesAndNewlines)
        titleText = words[Int(arc4random_uniform(UInt32(words.count)))].capitalized
        descText = words.dropLast(Int(arc4random_uniform(UInt32(words.count - 5)))).joined(separator: " ")

        let randDate = Date().addingTimeInterval(TimeInterval(arc4random_uniform(10_000)))
        timeText = PersonFeedEvent.dateFormatter.string(from: randDate)
    }
}
