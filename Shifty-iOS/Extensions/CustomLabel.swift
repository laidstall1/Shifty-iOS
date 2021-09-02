//
//  CustomLabel.swift
//  Shifty-iOS
//
//  Created by mac on 02/09/2021.
//

import UIKit

class CustomLabel: UILabel {
    init(text: String, font: UIFont, _ largeTitle: Bool) {
        super.init(frame: .zero)
        
        self.text = text
        self.font = font
        textColor = .black
        numberOfLines = -1
        textAlignment = .center
        lineBreakMode = .byWordWrapping
        
        if !largeTitle {
            textColor = UIColor(white: 0, alpha: 0.5)
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.5
        paragraphStyle.alignment = .center
        
        attributedText = NSMutableAttributedString(string: text, attributes: [ NSAttributedString.Key.kern: -0.36, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
