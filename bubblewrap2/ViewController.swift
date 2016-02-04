//
//  ViewController.swift
//  bubblewrap2
//
//  Created by  John Cui on 2/4/16.
//  Copyright © 2016  John Cui. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let stackView = UIStackView()

    let button1 = UIButton(type: UIButtonType.System)
    let image1 = UIImage(named: "ghost.png") as UIImage?
    let image2 = UIImage(named: "pumpkin.png") as UIImage?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        button1.setImage(image2, forState: .Normal)
        view.addSubview(stackView)
        stackView.addArrangedSubview(button1)
        
        let deepPressGestureRecognizer = DeepPressGestureRecognizer(target: self, action: "deepPressHandler:", threshold: 0.75)
        
        button1.addGestureRecognizer(deepPressGestureRecognizer)
        
        stackView.addArrangedSubview(button1)
        
       
        
    }
    
    func deepPressHandler(value: DeepPressGestureRecognizer)
    {
        if value.state == UIGestureRecognizerState.Began
        {
            print("deep press begin: ", value.view?.description)
            UIDevice.currentDevice()._tapticEngine().actuateFeedback(1001)
            button1.setImage(image1, forState: .Normal)
            
        }
        else if value.state == UIGestureRecognizerState.Ended
        {
            print("deep press ends.")
        }
    }
    
  
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
}

class DeepPressableButton: UIButton, DeepPressable
{
    
}




