//
//  DetailsViewController.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 09/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Title"

        navigationItem.rightBarButtonItem = StyleKit.BarButtons.searchButton
    }

}
