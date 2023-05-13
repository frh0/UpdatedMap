//
//  MapView.swift
//  UpdatedMap
//
//  Created by frh alshaalan on 13/05/2023.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation
 

struct MapView: UIViewRepresentable {
    @State  var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 24.7311, longitude: 46.6701),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    let locationManager = CLLocationManager()

    func makeUIView(context: Context) -> MKMapView {
        locationManager.requestWhenInUseAuthorization()
        let mapView = MKMapView(frame: .zero)
        mapView.showsUserLocation = true
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.setRegion(region, animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

   
}

