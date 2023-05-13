//
//  Coordinator.swift
//  UpdatedMap
//
//  Created by frh alshaalan on 13/05/2023.
//

import Foundation
import Foundation
import SwiftUI
import MapKit
import CoreLocation
 

    
  
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            parent.region = mapView.region
        }
        
        //annotationView
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Placemark"
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
            
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation {
                let placemark = MKPlacemark(coordinate: annotation.coordinate)
                let mapItem = MKMapItem(placemark: placemark)
                mapItem.name = annotation.title ?? "Placemark"
                mapItem.openInMaps(launchOptions: nil)
            }
            
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            // Handle annotation selection
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            // Handle annotation deselection
        }
        func addAnnotation(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
                let annotation = MKPointAnnotation()
//                annotation.coordinate = region.center
                annotation.title = "New Location"
                mapView.addAnnotation(annotation)
            }
        
    }
    
//extension MapView {
//    func addAnnotation() {
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = region.center
//        annotation.title = "New Location"
//        mapView.addAnnotation(annotation)
//    }
//}

