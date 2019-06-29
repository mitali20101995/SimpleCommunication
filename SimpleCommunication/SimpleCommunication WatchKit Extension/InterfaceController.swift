//
//  InterfaceController.swift
//  SimpleCommunication WatchKit Extension
//
//  Created by Harshu Patel on 2019-06-29.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    @IBOutlet weak var lblComment: WKInterfaceLabel!
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        WKInterfaceDevice().play(.click)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Play a "click" sound when you get the message
        WKInterfaceDevice().play(.click)
        
        // output a debug message to the terminal
        print("WATCH: Got a message!")
        
        // update the message with a label
        lblComment.setText("\(message)")
    }

    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
            print("Session is reachable: \(session.isReachable)")
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
