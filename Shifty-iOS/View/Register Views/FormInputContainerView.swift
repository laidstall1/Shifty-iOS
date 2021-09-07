//
//  InputTextFieldView.swift
//  Shifty-iOS
//
//  Created by mac on 07/09/2021.
//

import UIKit

class FormInputContainerView: UIView {
    init (_ textfield: UITextField, _ labelText: String, labelContainerWidth: CGFloat) {
        super.init(frame: .zero)
        
        let containerView = UIView()
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(white: 0, alpha: 0.1).cgColor
        containerView.layer.cornerRadius = 16
        
        containerView.setDimensions(height: 56, width: 295)
        
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        containerView.addSubview(textfield)
        textfield.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingLeft: 24)
        
        let lbl = UILabel()
        lbl.text = labelText
        lbl.font = .systemFont(ofSize: 12)
        lbl.textColor = #colorLiteral(red: 0.1058823529, green: 0.1137254902, blue: 0.1294117647, alpha: 1)
        lbl.backgroundColor = .white
        lbl.alpha = 0.4
        
        let labelView = UIView()
        labelView.backgroundColor = .white
        labelView.setDimensions(height: 16, width: labelContainerWidth)

        labelView.addSubview(lbl)
        lbl.centerX(inView: labelView)
        lbl.centerY(inView: labelView)
        
        addSubview(labelView)
        labelView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, paddingTop: -8, paddingLeft: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
