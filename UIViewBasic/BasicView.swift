//
//  BasicView.swift
//  UIViewBasic
//
//  Created by cuong minh on 12/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class BasicView: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var rotateSlider: UISlider!
    @IBOutlet weak var scaleSlider: UISlider!
    //var transform: CGAffineTransform!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onShow(sender: UISwitch) {
        myView.hidden = !sender.on
    }

    @IBAction func onAlphaChange(sender: UISlider) {
        myView.alpha = CGFloat(sender.value)
    }
    func rotateAndScale() {
        let rotateTransform = CGAffineTransformMakeRotation(CGFloat(rotateSlider.value) * CGFloat(M_PI))
        let scalaTransform = CGAffineTransformMakeScale(CGFloat(scaleSlider.value), CGFloat(scaleSlider.value))
        myView.transform = CGAffineTransformConcat(rotateTransform, scalaTransform)

    }
    @IBAction func onRotate(sender: UISlider) {
        rotateAndScale()
    }
    @IBAction func onScaleChange(sender: UISlider) {
        rotateAndScale()
    }
    @IBAction func onColorChange(sender: UISegmentedControl) {
        
        switch (sender.selectedSegmentIndex)
        {
        case 0:
            myView.backgroundColor = UIColor.blackColor()
            
        case 1:
            myView.backgroundColor = UIColor.redColor()
            
        case 2:
            myView.backgroundColor = UIColor.greenColor()
            
        case 3:
            myView.backgroundColor = UIColor.blueColor()
            
        default: 
            break
        }
        
    }
}
