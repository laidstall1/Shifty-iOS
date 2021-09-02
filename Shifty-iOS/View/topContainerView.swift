//
//  topContainerView.swift
//  Shifty-iOS
//
//  Created by mac on 01/09/2021.
//

import UIKit

class TopContainerView: UIView {
    init(image: String) {
        super.init(frame: .zero)
        let iv = UIImageView()
        iv.image = UIImage(named: image)
        
        addSubview(iv)
        iv.centerY(inView: self)
        iv.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
