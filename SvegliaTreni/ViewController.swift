//
//  ViewController.swift
//  SvegliaTreni
//
//  Created by adel on 06/03/17.
//  Copyright © 2017 Adel. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBOutlet var play: UIButton!

    @IBAction func registerLocal(_ sender: AnyObject) {
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ask permissions for notifications
        let notificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(notificationSettings)
        
        
        let defaults = UserDefaults.standard
/*
        let allarmScheduler = defaults.value(forKey: "allarmScheduler")
        if allarmScheduler == nil{
            let encodedData = NSKeyedArchiver.archivedData(withRootObject: AllarmScheduler())
            defaults.setValue(encodedData, forKey: "allarmScheduler")
            defaults.synchronize()
            print("scheduler not found")
        }
 */
        
        let now = Date()
        print(now)
        
        /*
        defaults.setValue(now, forKey: "myDate");
        
        let gained = defaults.value(forKey: "myaDate")
         */
        let scheduler = AllarmScheduler()
        scheduler.addAllarm(Allarm(et: now.addingTimeInterval(TimeInterval(5))))
        scheduler.addAllarm(Allarm(et: now.addingTimeInterval(TimeInterval(60))))
        scheduler.scheduleAll()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

