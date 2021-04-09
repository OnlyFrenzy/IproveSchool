//
//  CustomButton.swift
//  IproveSchool
//
//  Created by OnlyFrenzy on 19.03.2021.
//

import UIKit

class CustomButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            super.setTitleColor(.black, for: .highlighted)
            if isHighlighted {
                super.backgroundColor = highlightedColor
            } else {
                super.backgroundColor = notHighlightedColor
            }
        }
    }

    // MARK: Custom Button Interface Builder Settings

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            return layer.borderColor?.UIColor
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var highlightedColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: notHighlightedColor must be equal backgroundColor

    @IBInspectable var notHighlightedColor: UIColor = .clear {
        didSet {
            setNeedsDisplay()
        }
    }
}
