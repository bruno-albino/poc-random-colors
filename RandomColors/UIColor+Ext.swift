//
//  UIColor+Ext.swift
//  RandomColors
//
//  Created by Bruno Albino on 31/05/23.
//

import Foundation
import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1.0),
            green: CGFloat.random(in: 0...1.0),
            blue: CGFloat.random(in: 0...1.0),
            alpha: 1
        )
    }
}
