//
//  ViewController.swift
//  zipcode
//
//  Created by Harumi Hamaoka on 2016/06/05.
//  Copyright © 2016 pattyhama. All rights reserved.
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
        do {
            // JSON-parse the received data
            let jsonDic = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
            // Analyze the parsed data
            if let code = jsonDic["code"] as? Int {
                // If the code item is integer, it's a code information from Address-Search API
                if code != 200 {
                    if let errmsg = jsonDic["message"] as? String {
                        print(errmsg)
                    }
                }
            }
            if let data = jsonDic["data"] as? NSDictionary {
                // Analyze if the data item is dictionary data
                if let pref = data["pref"] as? String {
                    // If the code item is string, it's a prefecture
                    print("Prefecture is \(pref)")
                }
                if let address = data["address"] as?String {
                    // If the code item is string, it's an address
                    print("Address is \(address)")
                }
            }
        } catch {
            print("Error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

