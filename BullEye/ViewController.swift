//
//  ViewController.swift
//  BullEye
//
//  Created by toanct on 7/19/18.
//  Copyright © 2018 toanct. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    let minValue: Int = 1
    let maxValue: Int = 100
    @IBOutlet weak var slider: UISlider!
    
    //message is sent by UIKit immediately after the view controller loads its user interface from the storyboard file
    // At this point, the view controller isn’t visible yet, so this is a good place to set instance variables to their proper initial values.
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = minValue + Int(arc4random_uniform(UInt32(maxValue)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ slider: UISlider){
         currentValue = lroundf(slider.value)
        print("The value of the slider is now: \(slider.value)")
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,    // changed
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",          // changed
            style: .default,
            handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}

