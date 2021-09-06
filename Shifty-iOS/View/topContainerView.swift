//
//  topContainerView.swift
//  Shifty-iOS
//
//  Created by mac on 01/09/2021.
//

import UIKit

class TopContainerView: UIView {
    init(imageView: UIImageView) {
        super.init(frame: .zero)
       
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomMobileTitleView: UIView {
    init(label: [UILabel]) {
        super.init(frame: .zero)
        
        setDimensions(height: 124, width: 291)
        
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
