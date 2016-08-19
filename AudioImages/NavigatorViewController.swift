//
//  NavigatorViewController.swift
//  AudioImages
//
//  Created by Kevin Chang on 6/26/16.
//  Copyright © 2016 Kevin Chang. All rights reserved.
//

import UIKit

var category: String!

class NavigatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func animalButtonPressed(sender: UIButton) {
        category = "animal"
    }
    
    @IBAction func natureButtonPressed(sender: AnyObject) {
        category = "nature"
    }
    
    @IBAction func instrumentButtonPressed(sender: UIButton) {
        category = "instrument"
    }
    @IBAction func cityButtonPressed(sender: UIButton) {
        category = "city"
    }
}
