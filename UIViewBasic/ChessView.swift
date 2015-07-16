//
//  ChessView.swift
//  UIViewBasic
//
//  Created by cuong minh on 12/19/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class ChessView: UIViewController {
    let margin: CGFloat = 10.0
    let h0: CGFloat = 160.0
    var containerView: UIView!
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.grayColor()
        
        
        containerView = UIView(frame: CGRect(x: 0, y: 0, width: (view.bounds.size.width - margin * 2.0), height:  (view.bounds.size.width - margin * 2.0)))
        
        containerView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(containerView)
        containerView.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
        
        println("width = \(view.bounds.size.width), height = \(view.bounds.size.height)")
        let cellWidth = (view.bounds.size.width - margin * 2.0) / 8.0
        for rowIndex in 0...7 {
            for colIndex in 0...7 {
                let rect = CGRect( x:CGFloat(colIndex) * cellWidth, y:  CGFloat(rowIndex) * cellWidth, width: cellWidth, height: cellWidth)
                let cell = UIView(frame: rect)
                if rowIndex % 2 == 0 {  //even row
                    cell.backgroundColor = (colIndex % 2 == 0) ? UIColor.blackColor() : UIColor.whiteColor()
                } else { //odd row
                    cell.backgroundColor = (colIndex % 2 == 0) ? UIColor.whiteColor() : UIColor.blackColor()
                }
                containerView.addSubview(cell)
            }
        }
        
        var slider = UISlider(frame: CGRect(x: 20 , y: self.view.bounds.height-100, width: self.view.bounds.width - 40, height: 10))
        slider.minimumValue = -1
        slider.maximumValue = 1
        slider.value = 0
        slider.addTarget(self, action: "onRotate:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(slider)
    }
    
    func onRotate(sender: UISlider) {
        containerView.transform = CGAffineTransformMakeRotation(CGFloat(sender.value) * CGFloat(M_PI))
    }


}
