//
//  ViewController.swift
//  SvegliaTreni
//
//  Created by adel on 06/03/17.
//  Copyright © 2017 Adel. All rights reserved.
//

import AVFoundation
import UIKit
import MediaPlayer

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    @IBOutlet var play: UIButton!

    @IBAction func registerLocal(sender: AnyObject) {
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let notificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)

        
        
        
        let now = NSDate()
        print(now)
        
        print(now.dateByAddingTimeInterval(NSTimeInterval(60)))
        
        let notification = UILocalNotification()
        notification.fireDate = now.dateByAddingTimeInterval(NSTimeInterval(15))
        notification.alertBody = "Alert!"
        notification.alertAction = "open"
        notification.hasAction = true
        notification.soundName = "sound2.mp3"
        notification.userInfo = ["UUID": "reminderID" ]
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func allarmButtonPressed(){
        print(player?.playing.boolValue)
        if (player?.playing.boolValue == false || player?.playing.boolValue == nil){
            playSound("sound1")
        }
        else{
            stopSound()
        }
    }
    
    func playSound(soundName : String) {
        let url = NSBundle.mainBundle().URLForResource(soundName, withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    func stopSound() {
        player?.stop()
    }

}

