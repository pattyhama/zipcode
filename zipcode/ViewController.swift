//
//  ViewController.swift
//  zipcode
//
//  Created by 浜岡春見 on 2016/06/05.
//  Copyright © 2016年 pattyhama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var zipTextField: UITextField!

    @IBAction func tapReturn() {
    }

    @IBAction func tapSearch() {
        guard let ziptext = zipTextField.text else {
            // End if value is nil
            return
        }
        
        // Create requested URL
        let urlStr = "http://api.zipaddress.net/?zipcode=\(ziptext)"
        print(urlStr)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

