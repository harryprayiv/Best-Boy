//
//  ViewController.swift
//  Learning Project
//
//  Created by Harry E. Pray IV on 7/15/16.
//  Copyright © 2016 harryprayiv.com. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var dateSelected: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlAction(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        let timeFormatter = DateFormatter()
        // Now we specify the display format, e.g. "27-08-2015
        dateFormatter.dateFormat = "MM/dd/yyyy"
        timeFormatter.dateFormat = "h:mm a"
        // Now we get the date from the UIDatePicker and convert it to a string
        let strDate = dateFormatter.string(from: dateSelected.date)
        let strTime = timeFormatter.string(from: dateSelected.date)
        // Finally we set the text of the label to our new string with the date
        
        if(segmentedControl.selectedSegmentIndex == 0)
        {
            //setValue(<#T##value: AnyObject?##AnyObject?#>, forKey: <#T##String#>)
            datebeginLabel.text = strDate
            precallstatusLabel.text = strTime
        }
        else if(segmentedControl.selectedSegmentIndex == 1)
        {
            datebeginLabel.text = strDate
            callstatusLabel.text = strTime
        }
        else if(segmentedControl.selectedSegmentIndex == 2)
        {
            mealstatusLabel.text = strTime
        }
        else if(segmentedControl.selectedSegmentIndex == 3)
        {
            mealendstatusLabel.text = strTime
        }
        else if(segmentedControl.selectedSegmentIndex == 4)
        {
            wrapstatusLabel.text = strTime
        }
    }
    
    @IBOutlet weak var datebeginLabel: UILabel!
    @IBOutlet weak var precallstatusLabel: UILabel!
    @IBOutlet weak var callstatusLabel: UILabel!
    @IBOutlet weak var mealstatusLabel: UILabel!
    @IBOutlet weak var mealendstatusLabel: UILabel!
    @IBOutlet weak var wrapstatusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datebeginLabel.text = "";
        precallstatusLabel.text = "";
        callstatusLabel.text = "";
        mealstatusLabel.text = "";
        mealendstatusLabel.text = "";
        wrapstatusLabel.text = "";
        // initializing text in labels
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

