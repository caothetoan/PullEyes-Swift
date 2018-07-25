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
    
    var points: Int = 0
    var currentRound: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    //message is sent by UIKit immediately after the view controller loads its user interface from the storyboard file
    // At this point, the view controller isn’t visible yet, so this is a good place to set instance variables to their proper initial values.
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
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
        caculateScore()
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)" +
         "\nYou scored \(points) points"
        
        let title: String
        if points == 0 {
            title = "Perfect!"
        } else if points > 95 {
            title = "You almost had it!"
        } else if points > 90 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let alert = UIAlertController(title: title,
                                      message: message,    // changed
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { action in
            self.startNewRound()
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    @IBAction func startOver(){
        reset()
        startNewRound()
    }
    
    func caculateScore() {
        points = 100 - abs(targetValue - currentValue)
    }
    func reset() {
        currentRound = 0
        points = 0
    }
    func startNewRound() {
        
        currentValue = 50
        targetValue = minValue + Int(arc4random_uniform(UInt32(maxValue)))
        slider.value = Float(currentValue)
        
        currentRound += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(points)
        roundLabel.text = String(currentRound)
    }
}

