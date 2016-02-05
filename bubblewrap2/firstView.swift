//
//  firstView.swift
//  bubblewrap2
//
//  Created by  John Cui on 2/5/16.
//  Copyright © 2016  John Cui. All rights reserved.
//

import UIKit

class firstView: UIViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "normal") {
            let DestViewController = segue.destinationViewController as! ViewController
            DestViewController.firstImg = "bubb2.png"
            DestViewController.secondImg = "bubb.png"
            DestViewController.music = "bubble3"
        }
        if (segue.identifier == "special") {
            let DestViewController = segue.destinationViewController as! ViewController
            DestViewController.firstImg = "pumpkin.png"
            DestViewController.secondImg = "ghost.png"
            DestViewController.music = "pumpkinsmash"
        }
    }
    
}
