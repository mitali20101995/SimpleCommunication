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
        
        WKInterfaceDevice().play(.click)
        print("WATCH: Got a message!")
        
        lblComment.setText("\(message["data"] ?? "error")")
        
    }
    
    @IBAction func btnSendBackPressed() {
        let message = [
            "data": "I know"
        ]
        WCSession.default.sendMessage(message, replyHandler:{ (reply) -> Void in
            self.lblComment.setText("\(reply["data"] ?? "error")")
        }){
            (error) -> Void in
            print("\(error)")
        }
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
