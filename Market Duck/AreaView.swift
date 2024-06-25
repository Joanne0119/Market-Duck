//
//  AreaView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/25.
//

import SwiftUI
import GoogleMaps
import CoreLocation
//
//struct AreaView: UIViewRepresentable {
//    func updateUIView(_ uiView: GMSMapView, context: Context) {
//        print("map")
//    }
//    
//    // Binding for total distance
//    var initialLocation: CLLocationCoordinate2D // Add initialLocation parameter
//
//    
//    // Coordinator to handle events
//    class Coordinator: NSObject, CLLocationManagerDelegate {
//        var mapView: GMSMapView?
//        var locationManager = CLLocationManager()
//        var previousLocation: CLLocation?
//        var polyline: GMSPolyline?
//        @Binding var totalDistance: CLLocationDistance
//        
//        init(totalDistance: Binding<CLLocationDistance>) {
//            self._totalDistance = totalDistance
//        }
//        
//        // Location manager delegate method
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            guard let location = locations.first else { return }
//            
//            // Calculate distance and update total distance
//            if let previousLocation = self.previousLocation {
//                let distance = location.distance(from: previousLocation)
//                self.totalDistance += distance
//            }
//            
//            // Update polyline to draw the route
//            if let path = polyline?.path {
//                let mutablePath = GMSMutablePath(path: path)
//                mutablePath.add(location.coordinate)
//                polyline?.path = mutablePath
//            } else {
//                let path = GMSMutablePath()
//                path.add(location.coordinate)
//                
//                let newPolyline = GMSPolyline(path: path)
//                newPolyline.strokeColor = .red
//                newPolyline.strokeWidth = 5.0
//                newPolyline.map = mapView
//                polyline = newPolyline
//            }
//            
//            // Set camera position to current location
//            let zoom: Float = 18.0
//            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
//                                                  longitude: location.coordinate.longitude,
//                                                  zoom: zoom)
//            mapView?.animate(to: camera)
//            
//            self.previousLocation = location
//        }
//        
//        // Authorization status change handler
//        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//            if status == .authorizedWhenInUse {
//                locationManager.startUpdatingLocation()
//                mapView?.isMyLocationEnabled = true
//                mapView?.settings.myLocationButton = true
//            }
//        }
//    }
//    
//    // Make coordinator
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(totalDistance: $totalDistance)
//    }
//    
//    // Make UIView
//    func makeUIView(context: Context) -> GMSMapView {
//        let camera = GMSCameraPosition.camera(withLatitude: initialLocation.latitude,longitude: initialLocation.longitude, zoom: 12.0)
//        
//        let mapView =  GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        mapView.isMyLocationEnabled = true
//        mapView.settings.myLocationButton = true
//        context.coordinator.mapView = mapView
//        
//        // Request location authorization
//        context.coordinator.locationManager.requestWhenInUseAuthorization()
//        context.coordinator.locationManager.delegate = context.coordinator
//        return mapView
//    }
//}



struct AreaView: UIViewRepresentable {
    let initialLocation: CLLocationCoordinate2D
    let initZoom: Float
    let markets: [Market]

    func makeUIView(context: Self.Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: initialLocation.latitude, longitude: initialLocation.longitude, zoom: initZoom)
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
        for market in markets {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: market.latitude, longitude: market.longitude)
            marker.title = market.name
            marker.snippet = "\(market.location) \(market.mrt)\n\(market.startDate)-\(market.endDate)"
            marker.map = mapView
        }
    }
}

