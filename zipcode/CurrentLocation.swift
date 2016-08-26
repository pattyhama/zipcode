//
//  ViewController.swift
//  zipcode
//
//  Created by Harumi Hamaoka on 2016/06/05.
//  Copyright © 2016 pattyhama. All rights reserved.
//

import UIKit
import MapKit

class ViewController3: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView2: MKMapView!

    var mapManager:CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //デリゲート先に自分を設定する。
        mapManager.delegate = self
        
        //位置情報の取得を開始する。
        mapManager.startUpdatingLocation()
        
        //位置情報の利用許可を変更する画面をポップアップ表示する。
        mapManager.requestWhenInUseAuthorization()
        
    }
    
        //位置情報取得時の呼び出しメソッド
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            for location in locations {
                //中心座標
                let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                //表示範囲
                let span = MKCoordinateSpanMake(0.01, 0.01)
            
            //中心座標と表示範囲をマップに登録する。
            let region = MKCoordinateRegionMake(center, span)
            mapView2.setRegion(region, animated:true)
            
            //ピンを作成してマップビューに登録する。
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            mapView2.addAnnotation(annotation)
            }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}