//
//  CustomTextfield.swift
//  Shifty-iOS
//
//  Created by mac on 07/09/2021.
//

import UIKit

class CustomTextField: UITextField {
    
    init() {
        super.init(frame: .zero)
        
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 14)
        textColor = #colorLiteral(red: 0.01568627451, green: 0.01568627451, blue: 0.08235294118, alpha: 1)
        keyboardAppearance = .light
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

