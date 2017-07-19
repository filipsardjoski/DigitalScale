//
//  ViewController.swift
//  DigitalScale
//
//  Created by Filip Sardzoski on 7/19/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                if touch.force >= touch.maximumPossibleForce {
                    forceLabel.text = "385+ grams"
                } else {
                    let force = touch.force/touch.maximumPossibleForce
                    let grams = force * 385
                    let roundGrams = Int(grams)
                    forceLabel.text = "\(roundGrams) grams"
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        forceLabel.text = "0 grams"
    }
    
}





// check for 3D Touch
/*
 func is3DTouchAvailable() -> Bool {
 return self.traitCollection.forceTouchCapability == UIForceTouchCapability.Available
 }
 */
