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
    @IBOutlet weak var personHeader: PersonHeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Title"

        navigationItem.rightBarButtonItem = StyleKit.BarButtons.searchButton
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
