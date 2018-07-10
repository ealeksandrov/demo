//
//  DetailsViewController.swift
//  Demo
//
//  Created by Evgeny Aleksandrov on 09/07/2018.
//  Copyright © 2018 demo. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            setLocation()
        }
    }
    @IBOutlet weak var mapHeight: NSLayoutConstraint!
    @IBOutlet weak var personHeader: PersonHeaderView!
    @IBOutlet weak var personStats: PersonStatsView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.rowHeight = UITableViewAutomaticDimension
        }
    }
    @IBOutlet weak var tableHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Title"

        navigationItem.rightBarButtonItem = StyleKit.BarButtons.searchButton
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        tableHeight?.constant = tableView.contentSize.height
    }

}

extension DetailsViewController: MKMapViewDelegate {

    class Annotation: NSObject, MKAnnotation {
        let coordinate: CLLocationCoordinate2D

        init(coordinate: CLLocationCoordinate2D) {
            self.coordinate = coordinate
            super.init()
        }
    }

    class AnnotationMarkerView: MKAnnotationView {
        override var annotation: MKAnnotation? {
            willSet {
                image = StyleKit.CustomImages.mapPin
            }
        }
    }

    func setLocation() {
        let location = CLLocation(latitude: 37.3322707, longitude: -122.0299583)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 1000, 1000)
        mapView.setRegion(coordinateRegion, animated: false)

        mapView.register(AnnotationMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)

        let annotation = Annotation(coordinate: location.coordinate)
        mapView.addAnnotation(annotation)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Annotation else { return nil }

        let identifier = "marker"
        var view: MKMarkerAnnotationView

        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        return view
    }
}


extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonFeedCell", for: indexPath) as! PersonFeedCell
        cell.config(for: indexPath.row)

        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
}


extension DetailsViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            mapHeight.constant = 130
        } else {
            mapHeight.constant = 130 - scrollView.contentOffset.y
        }
    }
}
