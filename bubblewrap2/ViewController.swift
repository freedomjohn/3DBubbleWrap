//
//  ViewController.swift
//  bubblewrap2
//
//  Created by  John Cui on 2/4/16.
//  Copyright © 2016  John Cui. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    let screenSize: CGRect = UIScreen.mainScreen().bounds
    let image1 = UIImage(named: "bubb.png") as UIImage?
    let image2 = UIImage(named: "bubb2.png") as UIImage?
    var buttonArr: [UIButton] = [UIButton]()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        var count = 0
        let screenWidth = Int(screenSize.width)
        let screenHeight = Int(screenSize.height)
        for var i = 0; i < screenWidth; i += 50 {
            for var j = 30; j < screenHeight-30; j += 50 {
                var button1 = UIButton(frame: CGRectMake(CGFloat(i),CGFloat(j), 55, 55))
                button1.tag = count
                count = count + 1
                button1.setImage(image2, forState: .Normal)
                let deepPressGestureRecognizer = DeepPressGestureRecognizer(target: self, action: "deepPressHandler:", threshold: 0.75)
                
                button1.addGestureRecognizer(deepPressGestureRecognizer)
                buttonArr.append(button1)
                self.view.addSubview(button1)
                
            }
        }
        
       
        
    }
    
    func deepPressHandler(value: DeepPressGestureRecognizer)
    {
        if value.state == UIGestureRecognizerState.Began
        {
            print("deep press begin: ", value.view?.description)
            UIDevice.currentDevice()._tapticEngine().actuateFeedback(1001)
            if let button = value.view as? UIButton {
                // use button
                var num = button.tag
                buttonArr[num].setImage(image1, forState: .Normal)
                buttonArr[num].enabled = false
                print(button.tag)
                
            }
            var touchLocation: CGPoint = value.locationInView(value.view)
            print(touchLocation)
            //touchLocation = self.convertPointFromView(touchLocation)
            //button1.setImage(image1, forState: .Normal)
            
        }
        else if value.state == UIGestureRecognizerState.Ended
        {
            print("deep press ends.")
        }
    }
    
  /*
    override func viewDidLayoutSubviews()
    {
        stackView.axis = UILayoutConstraintAxis.Vertical
        stackView.distribution = UIStackViewDistribution.EqualSpacing
        stackView.alignment = UIStackViewAlignment.Center
        
        stackView.frame = CGRect(x: 0,
            y: topLayoutGuide.length,
            width: view.frame.width,
            height: view.frame.height - topLayoutGuide.length).insetBy(dx: 50, dy: 100)
    }
*/
}

class DeepPressableButton: UIButton, DeepPressable
{
    
}




