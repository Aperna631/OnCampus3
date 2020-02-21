//
//  FirstViewController.swift
//  OnCampus
//
//  Created by Dane Brazinski on 2/15/20.
//  Copyright © 2020 Dane Brazinski. All rights reserved.
//

import UIKit
import GoogleMaps
import Firebase

class FirstViewController: UIViewController {
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterPickerView: UIPickerView!
    @IBOutlet weak var theMapView: GMSMapView!
    
    
    override func loadView(){
        super.loadView()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 43.037665, longitude:  -76.134194, zoom: 15.0)
        theMapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        theMapView.isMyLocationEnabled = true
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                theMapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        view = theMapView
        // Creates a marker in the center of the map.
        var ref: DatabaseReference!
        //var markers = [GMSMarker]()
        let node = "AcademicBuildings"
        ref = Database.database().reference()
        getFromDatabase(ref: ref, node: node, length: 18, mapView: theMapView)
//        for i in 0...18 {
//            ref.child(node).child(String(i)).observeSingleEvent(of: .value, with: { (snapshot) in
//                let value = snapshot.value as? NSDictionary
//                let building = value?["building"] as? String ?? ""
//                let lat = value?["lat"] as? Double ?? 0.0
//                let lon = value?["long"] as? Double ?? 0.0
//                let marker = GMSMarker()
//                marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
//                marker.title = building
//                marker.snippet = node
//                marker.map = mapView
//                markers.append(marker)
//
//            })
//        }
        //loadMarkersFromDatabase(ref: ref, node: "AcademicBuidings", completion: saveMarkers)
        //loadMarkersToView(markers: academicMarkers, mapView: mapView)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func filterPressed(_ sender: UIButton) {
        print("Filter Pressed")
        promptFilterPicker()
    }
    
    
    func promptFilterPicker(){
        
    }
    
    
    
    func loadMarkersToView(markers:[GMSMarker], mapView: GMSMapView){
        for marker in markers {
            marker.map = mapView
        }
    }
    
    func loadMarkersFromDatabase(ref:DatabaseReference, node:String, completion: @escaping ([GMSMarker]) -> Void) {
//        var markers = [GMSMarker]()
        var length:Int? = 1
        ref.child("Config").observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                length = (value?["AcademicBuildingsLength"] as? Int ?? 0)
                print(length!)
            })
        print(length!)
//        for i in 0...length! {
//            ref.child(node).child(String(i)).observeSingleEvent(of: .value, with: { (snapshot) in
//                let value = snapshot.value as? NSDictionary
//                let building = value?["building"] as? String ?? ""
//                let lat = value?["lat"] as? Double ?? 0.0
//                let lon = value?["long"] as? Double ?? 0.0
//                let marker = GMSMarker()
//                marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
//                marker.title = building
//                marker.snippet = node
//                markers.append(marker)
//            })
//
//        }
//        return markers
    }
    func getFromDatabase(ref:DatabaseReference, node:String, length:Int, mapView: GMSMapView) {
        for i in 0...length {
            ref.child(node).child(String(i)).observeSingleEvent(of: .value, with: { (snapshot) in
                let value = snapshot.value as? NSDictionary
                let building = value?["building"] as? String ?? ""
                let lat = value?["lat"] as? Double ?? 0.0
                let lon = value?["long"] as? Double ?? 0.0
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                marker.title = building
                marker.snippet = node
                marker.map = mapView
            })
        }
    }

}

