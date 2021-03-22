//
//  CustomButton.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 19.03.2021.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            super .setTitleColor(.black, for: .highlighted)
            if isHighlighted {
                super .backgroundColor = highlightedColor
            } else {
                super .backgroundColor = notHighlightedColor
            }
        }
    }
    
    //MARK: Custom Button Interface Builder Settings
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            return layer.borderColor?.UIColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var highlightedColor: UIColor = UIColor.clear {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    
    //MARK: notHighlightedColor must be equal backgroundColor
    @IBInspectable var notHighlightedColor: UIColor = UIColor.clear {
        didSet {
            self.setNeedsDisplay()
        }
    }
}


