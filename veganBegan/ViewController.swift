//
//  ViewController.swift
//  veganBegan
//
//  Created by Release on 2021/05/05.
//  Copyright © 2021 Release. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MTMapViewDelegate {

    var mapView: MTMapView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView = MTMapView(frame: self.view.bounds)
        
        if let mapView = mapView{
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
            
        }
    }


}

