//
//  ViewController.swift
//  bubblewrap2
//
//  Created by  John Cui on 2/4/16.
//  Copyright © 2016  John Cui. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var firstImg = String()
    var secondImg = String()
    var music = String()
    var buttonArr : [UIButton] = [UIButton]()
    var audioPlayer : AVAudioPlayer!
    var odd = 0
    var image1 = UIImage(named: "bubb.png") as UIImage?
    var image2 = UIImage(named: "bubb2.png") as UIImage?
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
        image1 = UIImage(named: secondImg) as UIImage?
        image2 = UIImage(named: firstImg) as UIImage?
        var audioFilePath = NSBundle.mainBundle().pathForResource(music, ofType: "wav")
        
        if audioFilePath != nil {
            
            var audioFileUrl = NSURL.fileURLWithPath(audioFilePath!)
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: audioFileUrl, fileTypeHint: nil )
            }
            catch {
                
            }
            
        } else {
            print("audio file is not found")
        }
        var count = 0
        let screenWidth = Int(screenSize.width)
        let screenHeight = Int(screenSize.height)
        for var i = 74; i < screenHeight-40; i += 48 {
            odd = (odd+1) % 2
            for var j = odd*28 - 56; j < screenWidth; j += 48 {
                var button1 = UIButton(frame: CGRectMake(CGFloat(j),CGFloat(i), 56, 56))
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
       
        
    }
    
    func deepPressHandler(value: DeepPressGestureRecognizer)
    {
        if value.state == UIGestureRecognizerState.Began
        {
            print("deep press begin: ", value.view?.description)
            //audioPlayer.play()
           
            UIDevice.currentDevice()._tapticEngine().actuateFeedback(1001)
            
            audioPlayer.play()
            if let button = value.view as? UIButton {
                // use button
                 //audioPlayer.play()
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




