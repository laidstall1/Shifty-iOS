//
//  CustomMobileTitleView.swift
//  Shifty-iOS
//
//  Created by mac on 07/09/2021.
//

import UIKit

class CustomTitleView: UIView {
    init(label: [UILabel], spacing: CGFloat) {
        super.init(frame: .zero)
        
        setDimensions(height: 124, width: 291)
        
        let stack = UIStackView(arrangedSubviews: label)
        stack.axis = .vertical
        stack.spacing = spacing
        addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
