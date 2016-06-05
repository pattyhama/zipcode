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
        
        if let url = NSURL(string: urlStr) {
            // If url object is not nil, create Search Process object
            let urlSession = NSURLSession.sharedSession()
            // If Search Process object is completed, create a task to call onGetAddress
            let task = urlSession.dataTaskWithURL(url, completionHandler: self.onGetAddress)
            // Run task
            task.resume()
        }
    }

    // Run after search is Search Process is completed
    func onGetAddress(data: NSData?, res: NSURLResponse?, error: NSError?){
        // Show data to confirm
        print(data)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

