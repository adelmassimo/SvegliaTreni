//
//  SelectRingtoneViewController.swift
//  SvegliaTreni
//
//  Created by adel on 09/03/17.
//  Copyright © 2017 Adel. All rights reserved.
//

import UIKit
import MediaPlayer

class SelectRingtoneViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
    
{
    @IBOutlet weak var pickerView: UIPickerView!
    var player: AVAudioPlayer?
    
    var pickerDataSource = ["none", "Caparezza", "Sirena"];
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0)
        {
            self.view.backgroundColor = UIColor.white;
            stopSound()
        }
        else if(row == 1)
        {
            self.view.backgroundColor = UIColor.red;
            playSound("sound2")
        }
        else if(row == 2)
        {
            self.view.backgroundColor =  UIColor.green;
            playSound("tornadoSiren")
        }
        else
        {

        }
    }
    
    func playSound(_ soundName : String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    @IBAction func stopSound() {
        player?.stop()
    }
    
}

