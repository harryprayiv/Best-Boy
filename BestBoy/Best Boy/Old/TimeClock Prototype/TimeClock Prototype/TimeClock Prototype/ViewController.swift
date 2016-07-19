//
//  ViewController.swift
//  TimeClock Prototype
//
//  Created by Harry E. Pray IV on 7/9/16.
//  Copyright © 2016 harryprayiv.com. All rights reserved.
//

import UIKit

var segmentIndex = UISegmentedControl(items: [0,1,2,3,4])

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var punchButtonSegment: UISegmentedControl!
    @IBAction func punchButtonPressed(_ sender: UISegmentedControl) {
    switch punchButtonSegment.selectedSegmentIndex
    {
    case 0:
    textLabel.text = "PreCall selected";
    case 1:
    textLabel.text = "Call selected";
    case 2:
    textLabel.text = "Lunch selected";
    case 3:
    textLabel.text = "Lunch End selected";
    case 4:
    textLabel.text = "Wrap selected";
    default:
    break;
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

