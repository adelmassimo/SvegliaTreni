//
//  AddAllarmViewController.swift
//  SvegliaTreni
//
//  Created by adel on 08/03/17.
//  Copyright © 2017 Adel. All rights reserved.
//

import UIKit

class AddAllarmViewController: UIViewController {

    @IBOutlet var timeSelector: UIDatePicker!
    var scheduler : AllarmScheduler?
    let day = 86400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduler = AllarmScheduler()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func scheduleAllarm(){        
        scheduler?.addAllarm(Allarm(et: timeSelector.date.addingTimeInterval(TimeInterval(day))))
    }
    
    @IBAction func getTrain(){

        let url = NSURL(string: "http://www.viaggiatreno.it/viaggiatrenonew/resteasy/viaggiatreno/andamentoTreno/S00228/4640")
        let request = NSURLRequest(url: url! as URL)
        let connection = NSURLConnection(request: request as URLRequest, delegate:nil, startImmediately: true)
        print(connection)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
