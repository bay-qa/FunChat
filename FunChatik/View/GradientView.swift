//
//  GradientView.swift
//  FunChatik
//
//  Created by Igor on 7/5/18.
//  Copyright © 2018 Igor. All rights reserved.
//

import UIKit

//make able to work with this in ths Storyboard
@IBDesignable

class GradientView: UIView {
    //make able to change this variablse in storyboard
    //color Literal helps to choose color from the table
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.8903672272, green: 0.07605033993, blue: 0.09816237499, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    //add this gradient to the UIView (to the storyboard)
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
