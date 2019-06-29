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

    
    @IBOutlet weak var outputLabel: UILabel!
    
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
    
    @IBAction func buttonPressed(_ sender: Any) {

        print("Phone: Button pressed")
        self.outputLabel.text = "Button pressed!"

        if (WCSession.default.isReachable) {
            print("PHONE: Phone found the watch")
            
            let message = [
                "name": "Mitali",
                "comment": "Jenelle is the best!"
            ]
            
            WCSession.default.sendMessage(message, replyHandler: nil)
            
            print("PHONE: Sent the data!")
            self.outputLabel.text = "Message Sent"
        }
        else {
            print("PHONE: Cannot find the watch")
            self.outputLabel.text = "Connect the watch first"
        }
        
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }

}

