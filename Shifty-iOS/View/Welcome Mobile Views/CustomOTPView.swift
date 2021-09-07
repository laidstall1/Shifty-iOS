//
//  CustomOTPView.swift
//  Shifty-iOS
//
//  Created by mac on 07/09/2021.
//

import UIKit

class CustomOTPView: UIView {
    init(textfield: UITextField) {
        super.init(frame: .zero)
        setDimensions(height: 62, width: 48)
        layer.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        layer.borderWidth = 1
        layer.cornerRadius = 8
        
        addSubview(textfield)
        textfield.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

