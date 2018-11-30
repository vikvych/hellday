//
//  UILabelPadding.swift
//  YoushidoDemo
//
//  Created by Maxim Matveev on 11/30/18.
//  Copyright © 2018 Maxim Matveev. All rights reserved.
//

import UIKit

class UILabelPadding: LTMorphingLabel {
    
    var insets = UIEdgeInsets.zero
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize : CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + insets.left + insets.right
        let heigth = superContentSize.height + insets.top + insets.bottom
        
        return CGSize(width: width, height: heigth)
    }
    
    
    
}

