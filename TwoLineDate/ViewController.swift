//
//  ViewController.swift
//  TwoLineDate
//
//  Created by Pascale Beaulac on 2014-10-12.
//  Copyright (c) 2014 Pascale Beaulac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dateView: DateView!
    @IBOutlet weak var verticalButton: UIButton!
    @IBAction func togleVertical(sender: AnyObject) {
        dateView.displayVetical = !dateView.displayVetical
        let btn = sender as UIButton
        btn.selected = !btn.selected
    }
    @IBAction func capitalize(sender: AnyObject) {
        dateView.dateCapitalized = !dateView.dateCapitalized
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let formater = NSDateFormatter()
        formater.dateFormat = "dd/MM/yyyy"
        dateView.date = formater.dateFromString("13/10/1999")!

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

