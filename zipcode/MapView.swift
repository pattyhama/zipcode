//
//  ViewController.swift
//  zipcode
//
//  Created by Harumi Hamaoka on 2016/06/05.
//  Copyright © 2016 pattyhama. All rights reserved.
//

import UIKit
import MapKit

class ViewController2: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.mapView.rotateEnabled = false
        self.mapView.pitchEnabled = false
        let coordinate = CLLocationCoordinate2DMake(35.700668, 139.771670)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(coordinate, span)
        
        mapView.setRegion(region, animated:true)
        
        // add Annotation
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.coordinate = coordinate
        pointAnnotation.title = "アニメショップ"
        pointAnnotation.subtitle = "秋葉原"
        self.mapView.addAnnotation(pointAnnotation)
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}