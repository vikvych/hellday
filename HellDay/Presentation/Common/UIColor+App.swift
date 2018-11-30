//
//  UIColor+App.swift
//  HellDay
//
//  Created by Ivan Tkachenko on 11/30/18.
//  Copyright © 2018 Ivan Tkachenko. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init?(withHex string: String) {
        let redIndex = string.startIndex
        let greenIndex = string.index(redIndex, offsetBy: 2)
        let blueIndex = string.index(greenIndex, offsetBy: 2)
        
        if  let red = Int(string[redIndex..<greenIndex], radix: 16),
            let green = Int(string[greenIndex..<blueIndex], radix: 16),
            let blue = Int(string[blueIndex...], radix: 16) {
            self.init(red: CGFloat(red) / 256,
                      green: CGFloat(green) / 256,
                      blue: CGFloat(blue) / 256,
                      alpha: 1.0)
        } else {
            return nil
        }
    }
    
}
