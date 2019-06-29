//
//  ViewController.swift
//  SimpleCommunication
//
//  Created by Harshu Patel on 2019-06-29.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    
    @IBOutlet weak var lblOutput: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if (WCSession.isSupported()) {
            print("PHONE: Supports SESSION!")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else {
            print("PHONE: Does NOT support SESSION")
        }
    }
    
    @IBAction func btnPressed(_ sender: Any) {
     
        print("Phone: Button pressed")
        self.lblOutput.text = "Button pressed!"

        if (WCSession.default.isReachable) {
            print("PHONE: Phone found the watch")
            
            let message = [
                "data": "Jenelle is the best!"
            ]
            
            WCSession.default.sendMessage(message, replyHandler: nil)
            
            print("PHONE: Sent the data!")
            self.lblOutput.text = "Message Sent!"
        }
        else {
            print("PHONE: Cannot find the watch")
            self.lblOutput.text = "Connect the watch first"
        }
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }

}

