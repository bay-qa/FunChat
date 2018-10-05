//
//  RoundedButton.swift
//  FunChatik
//
//  Created by Igor on 7/8/18.
//  Copyright © 2018 Igor. All rights reserved.
//

import UIKit

//make custom class rounded button, which can make buttons rounded
@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
    }
}
