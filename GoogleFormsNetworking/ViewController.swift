//
//  ViewController.swift
//  GoogleFormsNetworking
//
//  Created by Zapotiltic23 on 6/25/17.
//  Copyright © 2017 Zapotiltic23. All rights reserved.
//
// Important: Right click on 'info.plist' and view as 'source code'. The copy and paste this:
//
//      <key>AppTransportSecurity</key>
//      <dict> <key>AllowArbitraryLoads</key> <true/>
//      </dict>
//
// right before the last two lines of code!

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var lastnameTextField: UITextField!
    
    //URL: https://docs.google.com/forms/d/e/1FAIpQLSca4vt8x0MXlKzvd3mRFgO0TEu71V_FEcwWbd8iee9xMDDOTA/formResponse
    //Entry: entry.301244190 -> Name
    //Entry: entry.1453548225 -> Last Name
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func SendToGoogleForms(_ sender: UIButton) {
        
        //Create references to the text on the textfields
        let name = self.nameTextField.text!
        let last = self.lastnameTextField.text!
        
        //Create url string to connect to the Google Form
        let urlString = "https://docs.google.com/forms/d/e/1FAIpQLSca4vt8x0MXlKzvd3mRFgO0TEu71V_FEcwWbd8iee9xMDDOTA/formResponse"
        
        //Create a URL
        if let url = URL(string: urlString){
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            //This string helps us fill out the form fields with our text
            let dataChain = "entry.301244190=\(name)&entry.1453548225=\(last)"
            let accentChain = dataChain.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            let binData = accentChain?.data(using: String.Encoding.utf8)
            
            //Send Data
            let task = session.uploadTask(with: request, from: binData, completionHandler: { (data, response, error) in
                
                //We have data. Let's Use it!
                //let chain = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                //print(chain!)
            })
            task.resume()
            
        }
        
        
        
    }
    

}

