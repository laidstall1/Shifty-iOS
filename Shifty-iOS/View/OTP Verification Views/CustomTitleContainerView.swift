//
//  CustomAuthTitleView.swift
//  Shifty-iOS
//
//  Created by mac on 07/09/2021.
//

import UIKit


class CustomTitleContainerView: UIView {
    init(label: [UILabel], height: CGFloat, width: CGFloat) {
        super.init(frame: .zero)
        
        setDimensions(height: height, width: width)

        let stack = UIStackView(arrangedSubviews: label)
        stack.axis = .vertical
        stack.spacing = 6
        addSubview(stack)
        stack.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
