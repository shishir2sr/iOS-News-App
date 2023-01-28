//
//  UiVIewExtension.swift
//  The News Explorer
//
//  Created by bjit on 27/1/23.
//
import Foundation

import UIKit

extension UIView {
    func round(_ radious: CGFloat = 10) {
        layer.cornerRadius = radious
        clipsToBounds = true
    }

    func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}
