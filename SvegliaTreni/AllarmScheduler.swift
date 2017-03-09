//
//  AllarmScheduler.swift
//  SvegliaTreni
//
//  Created by adel on 08/03/17.
//  Copyright © 2017 Adel. All rights reserved.
//

import UIKit

class AllarmScheduler: NSObject {
    var allarms = [Allarm]()
    
    func addAllarm( _ a: Allarm){
        allarms.append(a)
        print(a.descriptor())
    }
    
    func scheduleAll(){
        for a in allarms{
            a.schedule()
        }
    }
    
    func clearSchedule(){
        UIApplication.shared.cancelAllLocalNotifications()
    }
}
