//
//  Router.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 09/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit

class Router {
    static let shared = Router()
    private init() {}

    lazy var rootViewController: UINavigationController = {

        let navigationController = UINavigationController(rootViewController: listVC)

        return navigationController
    }()

    func showDetailsVC(for index: Int) {
        let vc = detailsVC
        rootViewController.pushViewController(vc, animated: true)
    }

    // MARK: - Private

    private var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }

    private var listVC: ListViewController {
        return mainStoryboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
    }

    private var detailsVC: DetailsViewController {
        return mainStoryboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
    }

}
