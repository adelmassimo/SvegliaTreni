//
//  Allarm.swift
//  SvegliaTreni
//
//  Created by adel on 08/03/17.
//  Copyright © 2017 Adel. All rights reserved.
//

import UIKit

class Allarm: NSObject{
    var expiryTime : Date?
    var repeatOn : NSMutableArray?
    var sound : String = "sound2"
    
    init(et: Date) {
        expiryTime = et
        repeatOn = nil
    }
    
    init(et: Date, r: NSMutableArray) {
        expiryTime = et
        repeatOn = r
    }
    
    func descriptor()->String{
        return (expiryTime?.description)!
    }
    
    func setSound(theSound: String){
        
    }
    
    func schedule(){
        let notification = UILocalNotification()
        notification.fireDate = expiryTime
        notification.alertBody = "SVEGLIA COGLIONE!"
        notification.alertAction = "open"
        notification.hasAction = true
        notification.soundName = sound+".mp3"
        notification.userInfo = ["UUID": "reminderID" ]
        UIApplication.shared.scheduleLocalNotification(notification)
    }
}
    
