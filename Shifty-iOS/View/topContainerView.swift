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
